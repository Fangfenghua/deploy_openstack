DB_FILE=/etc/openvswitch/conf.db
DB_SCHEMA=/usr/share/openvswitch/vswitch.ovsschema


ovsdb_tool () {
    ovsdb-tool -vconsole:off "$@"
}

create_db () {
    ovsdb_tool create "$DB_FILE" "$DB_SCHEMA"
}

upgrade_db () {
    schemaver=`ovsdb_tool schema-version "$DB_SCHEMA"`
    if test ! -e "$DB_FILE"; then
        echo "$DB_FILE does not exist"
        install -d -m 755 -o root -g root `dirname $DB_FILE`
        create_db
    elif test X"`ovsdb_tool needs-conversion "$DB_FILE" "$DB_SCHEMA"`" != Xno; then
        # Back up the old version.
        version=`ovsdb_tool db-version "$DB_FILE"`
        cksum=`ovsdb_tool db-cksum "$DB_FILE" | awk '{print $1}'`
        backup=$DB_FILE.backup$version-$cksum
        cp "$DB_FILE" "$backup" || return 1

        ovsdb_tool compact "$DB_FILE"

        # Upgrade or downgrade schema.
        if ovsdb_tool convert "$DB_FILE" "$DB_SCHEMA"; then
            :
        else
            echo "Schema conversion failed, using empty database instead"
            rm -f "$DB_FILE"
            create_db
        fi
    fi
}

start_ovsdb()
{
      ovsdb-server $DB_FILE -vconsole:emer -vsyslog:err -vfile:info --remote=punix:/var/run/openvswitch/db.sock --private-key=db:Open_vSwitch,SSL,private_key --certificate=db:Open_vSwitch,SSL,certificate --bootstrap-ca-cert=db:Open_vSwitch,SSL,ca_cert --no-chdir --log-file=/var/log/openvswitch/ovsdb-server.log --pidfile=/var/run/openvswitch/ovsdb-server.pid
}

upgrade_db
start_ovsdb

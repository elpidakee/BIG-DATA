function sygkrisi = compare_samples( db_table_name, conn)

sprintf('Parakalw eisagete ena kommati gia sygkrisi(eisagete to path tou kommatiou):')
kommati = input('','s')

x1 = mircentroid( kommati, 'Frame');
y1 = mirgetdata(x1);
y1(isnan(y1))=0;
lstr = make_linestring(y1);

%Dimiourgia kai ektelesh Erwtimatos gia sygkrisi
command2 = sprintf('SELECT table_metadata.song_id, table_metadata.song_name,table_metadata.song_artist,table_geo.id, table_geo.geo <-> ST_GeomFromText(''LINESTRING(%s)'') AS distance FROM table_geo INNER JOIN table_metadata ON (table_geo.id=table_metadata.song_id) ORDER BY table_geo.geo <-> ST_GeomFromText(''LINESTRING(%s)'') LIMIT 3 OFFSET 0;', lstr, lstr);
cur = exec(conn,command2);

%Krataei apotelesmata gia 3 kommatia
row = fetch(cur, 3);
sygkrisi = row.DATA;

sprintf('Telos h kymatomorfh tou kommatiou pou eisixthi einai h:')
wavef = miraudio(kommati)

end

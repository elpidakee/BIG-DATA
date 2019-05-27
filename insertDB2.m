connf = database('projectDB2', 'postgres', 'admin', 'org.postgresql.Driver', 'jdbc:postgresql://127.0.0.1/projectDB2');

path = '/home/nikos/Desktop/projectDB2/MIRtoolbox1.6.1/MIRToolbox/FullSet/train';
t = dir(path);

for i = 3:length(t)
    b = [];
    s = strcat(path, filesep, t(i).name);
    
    a = mircentroid(s, 'Frame');
    b = mirgetdata(a);
    b(isnan(b))=0;
    lstring = make_linestring(b);
    
    command1 = sprintf('INSERT INTO table_metadata (geo) VALUES(ST_GeomFromText(''LINESTRING(%s)'')) ', lstring);
    
    cur = exec(connf,command1);
        
end

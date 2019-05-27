function connf = epikoinwnia_me_postgre( dbname, uname, pass )

%conn = database(dbname, uname,'matlab','Vendor','PostGreSQL');
connf = database(dbname, uname, pass, 'org.postgresql.Driver', 'jdbc:postgresql://127.0.0.1/projectDB2');
if( ~ isempty(connf.Message) )
    fprintf('%s\n',connf.Message);
else
    fprintf('Connection sucessful!!\n');
end

end


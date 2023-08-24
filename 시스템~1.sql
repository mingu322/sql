select username from dba_users;   
drop user java;

create user java identified by pass;
grant connect, resource, dba to java;




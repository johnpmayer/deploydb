create table deployapp.software
(	id int not null generated always as identity
,	package_name varchar(64) not null
,	primary key (id)
,	unique (package_name)
)
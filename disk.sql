create table deployapp.disk (
	id int not null generated always as identity
,	name varchar(32) not null
,	primary key (id)
,	unique (name)
);
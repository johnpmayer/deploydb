create table deployapp.image (
	id int not null generated always as identity
,	name varchar(32) not null
,	archive_url varchar(32) not null
,	primary key (id)
,	unique (name)
,	unique (archive_url)
);
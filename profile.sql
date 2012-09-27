create table deployapp.profile (
	id int not null generated always as identity
,	name varchar(32) not null
,	description varchar(128) not null
,	disk_id int not null
,	image_id int not null
,	primary key (id)
,	foreign key (disk_id) references deployapp.disk
,	foreign key (image_id) references deployapp.image
,	unique (name)
);
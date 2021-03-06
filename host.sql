create table deployapp.host (
	id int not null generated always as identity
,	hw_address varchar(32) not null
,	profile_id int
,	last_reported_ip int
,	deploy_stage int not null
,	primary key (id)
,	foreign key (profile_id) references deployapp.profile
);
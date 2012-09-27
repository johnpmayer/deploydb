create table deployapp.install
(	profile_id int not null
,	software_id int not null
,	primary key (profile_id, software_id)
,	foreign key (profile_id) references deployapp.profile
,	foreign key (software_id) references deployapp.software
)
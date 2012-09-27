create table deployapp.dhcp_entry 
(	host_id int not null
,	ip_assignment int not null
,	primary key (host_id)
,	foreign key (host_id) references deployapp.host
,	unique (ip_assignment)
,	check (ip_assignment between 3 and 99)
)
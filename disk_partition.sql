create table deployapp.disk_partition (
	id int generated always as identity
,	disk_id int not null
,	partition_number int not null
,	partition_type int not null

,	mount_point varchar(32) not null
,	is_boot int not null

,	size_in_mb int not null

,	chain_partition_number int
,	chain_partition_type int

,	primary key (disk_id, partition_number, partition_type)
,	foreign key (disk_id) references deployapp.disk (id)
,	unique (disk_id, partition_number)
,	unique (disk_id, partition_type)
,	unique (disk_id, mount_point)
,	check (size_in_mb > 0)
,	foreign key (disk_id, chain_partition_number, chain_partition_type) references deployapp.disk_partition

/* Valid boot flag, boot partition must be primary and mount point = "/boot" */
,	check ( (not is_boot = 1) or (partition_number between 1 and 4 and partition_type != 0 and mount_point = '/boot'))

/* Valid mount points */
,	check (mount_point like '/%' and mount_point not like '% %')

/* Valid partition types */
,	check 
	(
		/* 1 is primary partition */
		(partition_number = 1 and 
			partition_type = partition_number
		)
		/* 2-4 are Primary or Extended */
	or	(partition_number in (2,3,4) and 
			(
				partition_type = partition_number 
			or 	partition_type = 0
			)
		)
		/* >5 are Logical, must be an extended, and must occur sequentially beginning with 5 */
	or	(partition_number > 4 and 
			(
				partition_type = partition_number
			and	chain_partition_number is not null
			and	chain_partition_type is not null
			and 	(
					(partition_number = 5 and chain_partition_type = 0)
				or	(partition_number > 5 and partition_number = chain_partition_number + 1)
				)
			)
		)
	)
);

-- Document editor
drop table o_wopi_access;
create table o_de_access (
   id bigint not null auto_increment,
   creationdate datetime not null,
   lastmodified datetime not null,
   o_editor_type varchar(64) not null,
   o_expires_at datetime not null,
   o_mode varchar(64) not null,
   o_version_controlled bool not null,
   fk_metadata bigint not null,
   fk_identity bigint not null,
   primary key (id)
);
create table o_de_user_info (
   id bigint not null auto_increment,
   creationdate datetime not null,
   lastmodified datetime not null,
   o_info varchar(2048) not null,
   fk_identity bigint not null,
   primary key (id)
);

alter table o_de_access ENGINE = InnoDB;
alter table o_de_user_info ENGINE = InnoDB;

create unique index idx_de_userinfo_ident_idx on o_de_user_info(fk_identity);


-- Assessment
alter table o_as_entry add column a_current_run_start datetime;


-- Disadvantage compensation
alter table o_qti_assessmenttest_session add column q_compensation_extra_time bigint;

create table o_as_compensation (
   id bigint not null auto_increment,
   creationdate datetime not null,
   lastmodified datetime not null,
   a_subident varchar(512),
   a_subident_name varchar(512),
   a_extra_time bigint not null,
   a_approved_by varchar(2000),
   a_approval timestamp,
   a_status varchar(32),
   fk_identity bigint not null,
   fk_creator bigint not null,
   fk_entry bigint not null,
   primary key (id)
);
alter table o_as_compensation ENGINE = InnoDB;

alter table o_as_compensation add constraint compensation_ident_idx foreign key (fk_identity) references o_bs_identity (id);
alter table o_as_compensation add constraint compensation_crea_idx foreign key (fk_creator) references o_bs_identity (id);
alter table o_as_compensation add constraint compensation_entry_idx foreign key (fk_entry) references o_repositoryentry (repositoryentry_id);

create table o_as_compensation_log (
   id bigint not null auto_increment,
   creationdate datetime not null,
   a_action varchar(32) not null,
   a_val_before mediumtext,
   a_val_after mediumtext,
   a_subident varchar(512),
   fk_entry_id bigint not null,
   fk_identity_id bigint not null,
   fk_compensation_id bigint not null,
   fk_author_id bigint,
   primary key (id)
);
alter table o_as_compensation_log ENGINE = InnoDB;

create index comp_log_entry_idx on o_as_compensation_log (fk_entry_id);
create index comp_log_ident_idx on o_as_compensation_log (fk_identity_id);


-- Appointments
alter table o_ap_appointment add column fk_meeting_id bigint;
alter table o_ap_appointment add constraint ap_appointment_meeting_idx foreign key (fk_meeting_id) references o_bbb_meeting (id);

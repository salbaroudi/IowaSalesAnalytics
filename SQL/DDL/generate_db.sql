create schema public;

comment on schema public is 'standard public schema';

alter schema public owner to postgres;

create table categorynames
(
	categoryid integer not null
		constraint categorynames_pk
			primary key,
	categoryname varchar(256)
);

alter table categorynames owner to sean;

create unique index categorynames_categoryid_uindex
	on categorynames (categoryid);

create table countynames
(
	countyid integer not null
		constraint countynames_pk
			primary key,
	countyname varchar(256)
);

alter table countynames owner to sean;

create unique index countynames_countyid_uindex
	on countynames (countyid);

create table itemdescriptions
(
	itemid integer not null
		constraint itemdescriptions_pk
			primary key,
	itemdescription varchar(256)
);

alter table itemdescriptions owner to sean;

create unique index itemdescriptions_itemid_uindex
	on itemdescriptions (itemid);

create table storenames
(
	storeid integer not null
		constraint storenames_pk
			primary key,
	storename varchar(256)
);

alter table storenames owner to sean;

create unique index storenames_storeid_uindex
	on storenames (storeid);

create table vendornames
(
	vendorid integer not null
		constraint vendornames_pk
			primary key,
	vendorname varchar(256)
);

alter table vendornames owner to sean;

create unique index vendornames_vendorid_uindex
	on vendornames (vendorid);

create table ils_clean
(
	invoiceid text not null
		constraint ils_clean_pk
			primary key,
	date text,
	city text,
	zipcode integer,
	storeid integer
		constraint storeid___fk
			references storenames,
	countyid integer
		constraint countyid___fk
			references countynames,
	categoryid integer
		constraint categoryid__fk
			references categorynames,
	vendorid integer
		constraint vendorid___fk
			references vendornames,
	itemid integer
		constraint itemid___fk
			references itemdescriptions,
	bottlevolumeml integer,
	statebottlecost numeric,
	statebottleretail numeric,
	bottlessold integer,
	saleprice numeric,
	volumesoldlitre integer
);

alter table ils_clean owner to sean;

create unique index ils_clean_invoiceid_uindex
	on ils_clean (invoiceid);


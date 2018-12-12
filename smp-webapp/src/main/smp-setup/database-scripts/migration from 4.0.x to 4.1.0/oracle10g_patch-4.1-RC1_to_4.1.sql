-- add table column registered to 
ALTER TABLE SMP_DOMAIN ADD  SML_REGISTERED number(1,0);
ALTER TABLE SMP_DOMAIN_AUD ADD  SML_REGISTERED number(1,0);

ALTER TABLE SMP_DOMAIN ADD  SML_BLUE_COAT_AUTH number(1,0);
ALTER TABLE SMP_DOMAIN_AUD ADD  SML_BLUE_COAT_AUTH number(1,0);


-- set initial values
UPDATE SMP_DOMAIN set SML_REGISTERED=0 where SML_REGISTERED IS NULL;
UPDATE SMP_DOMAIN set SML_BLUE_COAT_AUTH=1 where SML_BLUE_COAT_AUTH IS NULL;

-- fix typo SMP_SERVICE_GROUP_DOMAIN
ALTER TABLE SMP_SERVICE_GROUP_DOMAIN RENAME COLUMN SML_REGISTRED TO SML_REGISTERED;
ALTER TABLE SMP_SERVICE_GROUP_DOMAIN_AUD RENAME COLUMN SML_REGISTRED TO SML_REGISTERED;

create table SMP_CONFIGURATION (
   PROPERTY varchar2(512 char) not null,
    CREATED_ON timestamp not null,
    DESCRIPTION varchar2(4000 char),
    LAST_UPDATED_ON timestamp not null,
    VALUE varchar2(4000 char),
    primary key (PROPERTY)
);
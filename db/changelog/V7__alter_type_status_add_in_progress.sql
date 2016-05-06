-- workaround in comments doesn't work;

/*
commit;

alter type status
add value 'in progress' after 'confirmed';

begin;
*/

alter type status
rename to deprecated_status;

create type status as enum (
  'new',
  'confirmed',
  'in progress',
  'rejected',
  'done'
);

alter table document
alter column document_status type status using document_status :: text :: status;

drop type deprecated_status;

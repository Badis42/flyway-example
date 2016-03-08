-- drop and create is workaround for postgres,
-- which can't recreate view with differnt set of columns.
drop view if exists full_document;

create view full_document as
  select
    id,
    name,
    value
  from document;

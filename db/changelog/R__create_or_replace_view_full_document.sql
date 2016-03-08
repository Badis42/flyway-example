-- drop and create is workaround for postgres,
-- which can't recreate view with differnt set of columns.
drop view if exists full_document;

create view full_document as
  select
    d.id    document_id,
    d.name  document_name,
    d.value document_value
  from document d;

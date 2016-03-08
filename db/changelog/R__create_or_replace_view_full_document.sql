-- drop and create is workaround for postgres,
-- which can't recreate view with differnt set of columns.
drop view if exists full_document;

create view full_document as
  select
    d.id    document_id,
    d.name  document_name,
    d.value document_value,
    p.id    person_id,
    p.name  person_name
  from document d
    join person p
      on d.person_id = p.id;

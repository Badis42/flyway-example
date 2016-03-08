create table document (
  id         serial primary key,
  created_at timestamp(0) default now(),
  updated_at timestamp(0) default now(),
  person_id  int references person (id),
  name       varchar(512),
  value      jsonb
);

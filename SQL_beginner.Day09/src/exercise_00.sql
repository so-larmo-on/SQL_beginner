create table if not exists person_audit
(created timestamp with time zone not null default CURRENT_TIMESTAMP,
 type_event char(1) not null default 'I',
 row_id bigint not null,
 name varchar,
 age integer,
 gender varchar,
 address varchar,
 constraint ch_type_event CHECK (type_event IN('I', 'U', 'D')),
 constraint fk_person_audit_person_id foreign key  (row_id) references person(id)
 );
 
create or replace function fnc_trg_person_insert_audit()
returns trigger as 
$$
  begin
    insert into person_audit(type_event, row_id, name, age, gender, address) values
    ('I', new.id, new.name, new.age, new.gender, new.address);
    return new;
  end;
$$
language 'plpgsql';

create trigger trg_person_insert_audit after
insert
on person
for each row
execute procedure fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');

-- select * from person_audit
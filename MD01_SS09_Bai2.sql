create index idx_users_email_hash on users using hash (email);

explain
select *
from users
where email = 'example@example.com';
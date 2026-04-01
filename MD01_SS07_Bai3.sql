create index idx_p_content_lower on post (lower(content) text_pattern_ops);

explain analyze
select * from post
where is_public = true and lower(content) like 'du lịch%';

create index idx_p_tags_gin on post using gin (tags);

explain analyze
select * from post where tags @> array['travel'];

create index idx_p_recent_public on post (created_at desc)
where is_public = true;

select * from post
where is_public = true and created_at >= now() - interval '7 days';

create index idx_p_user_created on post (user_id, created_at desc);

select * from post
where user_id = 123
order by created_at desc;


create index idx_book_author_gin on book using gin (author);
create index idx_book_genre_btree on book (genre);

explain analyze
select * from book where author ilike '%Rowling%';

explain analyze
select * from book where genre = 'Fantasy';

create index idx_book_description_gin on book using gin (description);

cluster book using idx_book_genre_btree;
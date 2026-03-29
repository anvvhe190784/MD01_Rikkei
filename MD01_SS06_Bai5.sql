insert into Course (title, instructor, price, duration)
values
    ('hướng dẫn sql cơ bản', 'nguyễn văn an', 450000, 20),
    ('lập trình python nâng cao', 'lê thị bình', 1200000, 45),
    ('thiết kế web demo cho người mới', 'trần an nhiên', 0, 10),
    ('tối ưu hóa truy vấn sql', 'phạm minh tuấn', 1800000, 35),
    ('phát triển ứng dụng mobile', 'hoàng bảo an', 2500000, 50),
    ('khóa học demo java', 'đỗ thùy chi', 150000, 5);

update Course
set price = price * 1.15
where duration > 30;

delete from Course
where title ilike '%demo%';

select *
from Course
where title ilike '%sql%';

select *
from Course
where price between 500000 and 2000000
order by price desc
limit 3;
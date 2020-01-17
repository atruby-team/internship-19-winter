select *
from users inner join books on users.id = books.id_user
where books.book_name = 'naruto';

select users.id, users.user_name, count(books.book_name) as count
from users left join books on users.id = books.id_user
group by users.id;
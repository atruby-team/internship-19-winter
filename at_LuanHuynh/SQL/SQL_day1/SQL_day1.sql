SELECT * FROM MySQL_intern.books;

Select name, email from MySQL_intern.users U left outer join MySQL_intern.books B on U.id = B.id_user
where book = 'naruto';

Select id_user, name, count(id_user) as Book_count
from MySQL_intern.users U inner join MySQL_intern.books B on U.id = B.id_user
group by name, id_user;

Select name, count(id_user) as Book_count
from MySQL_intern.users U inner join MySQL_intern.books B on U.id = B.id_user
group by id_user 

Algunas sentencias para probar una vez instalada la base de datos.


/*Acá puedo ver el título y el contenido de las notas junto con su categoria correspondiente*/
select n.title, n.content, c.name as categoria from notas_category nc inner join notas n ON notas_id = n.id 
inner join category c on category_id = c.id

/*Acá busco el título de la nota y el usuario que gestionó la nota*/
select n.title, u.name  from users u inner join notas n on users_id = u.id

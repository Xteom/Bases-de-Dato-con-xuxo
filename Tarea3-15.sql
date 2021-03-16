-- Todos los nombres y correos de clientes canadienses para una campaña
-- canada id: 20 
select c.first_name, c.last_name, c.email from customer c 
join address a using (address_id) 
join city cit using (city_id)
where cit.country_id = 20;
--join country pais using (country_id) 
--where pais.country ='Canada';

--Seccion para adultos NC-17
select cus.first_name, cus.last_name, count(f.film_id) from customer cus
join rental r using (customer_id)
join inventory i using (inventory_id) 
join film f using (film_id)
where f.rating = 'NC-17'
group by cus.customer_id
order by  count(f.film_id) desc limit 2;

--peliculas más rentadas en nuestras tiendas 
select f2.film_id, f2.title, count(i.film_id) from rental rent 
join inventory i using (inventory_id)
join film f2 using (film_id)
group by (f2.film_id)
order by count(i.film_id) desc limit 1; 

--peliculas más rentadas por tienda

--revenue por store (ingresos por tienda) 
select i.store_id ,sum(pay.amount)  from payment pay
join rental r using (rental_id)
join inventory i using (inventory_id)
group by i.store_id;

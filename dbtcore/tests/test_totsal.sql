select totsal from (
select sal+nvl(comm,0) as totsal from emp)
where totsal<801
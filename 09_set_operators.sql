-- 09_set_operators

-- 두 개 이상의 select 문의 결과 집합을 결합하는데 사용한다.

-- union
-- 두 개 이상의 select 문의 결과를 결합하여 중복된 레코드를 제거한 후,
-- 반환하는 sql 연산자 이다. 

-- 1.
select
	*
from
	tbl_menu
where
	category_code =10		
union  				-- * 10옆의 세미콜론(;)빼고, union으로 묶어주면서 중복된 값을 제외하고(중복된 1값들만 추가됨), 합쳐준 값을 조회할 수 있다.
-- 2.
select
	*
from
	tbl_menu
where
	menu_price < 9000;
    
-- union all 
-- 두 개 이상의 select 문의 결과를 결합하여 중복된 레코드를 제거하지 않고, 모두 반환
-- 1.
select
	*
from
	tbl_menu
where
	category_code =10					
union all		-- * 따라서 아까는 중복된 값은 제거되고 1개의 값들만 출력되었지만, union all은 중복값도 모두 더해져서(중복값끼리는) 나옴
-- 2.
select
	*
from
	tbl_menu
where
	menu_price < 9000;
    
-- intersect
-- 두 select 문의 결과 중 공통되는 레코드만 반환하는 sql 연산자이다.
-- mysql은 intersect 지원을 하지 않는다. (많이 쓰이지 않는다.)
-- 하지만 inner join 또는 in 연산자를 활용해서 구현하는 것은 가능하다.

-- inner join 활용 ▽

-- 1
select
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
from
	tbl_menu;
-- 2
select
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
from
	tbl_menu
where
	menu_price < 9000;
    
-- 결과
select
	a.menu_code,
    a.menu_name,
    a.menu_price,
    a.category_code,
    a.orderable_status
from
	tbl_menu a
inner join					-- 2개의 테이블로 만들어서 조인해준다~
(
select
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
from
	tbl_menu
where
	menu_price < 9000
    ) b						-- 가로 안의 식들을 b로 묶어줘서 간단히 표현함.
on (a.menu_code = b.menu_code);


    
    
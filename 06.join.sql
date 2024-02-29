-- join
-- 두 개 이상의 테이블을 관련 있는 컬럼을 통해 결합하는데 사용된다.
-- 두 개 이상의 테이블은 반드시 연관있는 컬럼이 존재해야 하며,
-- 이를 통해 join 된 테이블들의 컬럼을 모두 사용할 수 있다.

-- alias (as)
-- sql 문의 컬럼 또는 테이블에 별칭을 달아줄 수 있다.
-- 이러한 별칭을 alias 라고 한다.

-- 별칭에 띄어쓰기나 특수기호가 없다면 홀따옴표(')와 as 는 생략 가능하다.
select
	menu_code as 'code', 
    menu_name as name,
    menu_price 'price'
from
	tbl_menu
order by
	price;
    
-- 테이블 별칭
-- 테이블에 별칭을 작성할 수 있으며 어떤 테이블 소속인지를 쉽게 알 수 있게 한다.
select
	a.category_code,
    a.menu_name
from 
	tbl_menu a;					-- table_menu를 'a'라고 별칭을 달았다.

-- join 의 종류
-- inner join 	// 교집합
-- 두 테이블의 교집합을 반환하는 join 유형
-- inner join 에서 inner 키워드는 생략이 가능하다.

-- select
-- 	menu_name,
--     category_name				-- menu_name과 컬럼 다름 / 따라서 안됨~~ 밑에 join을 이용하자~!!
-- from
-- 	tbl_menu;

-- on 키워드를 활용한 join
-- 컬럼명이 같거나 다를 경우 on 으로 서로 연관있는 컬럼에 대한 조건을 작성하여
-- join

select
	a.menu_name,			-- 따라서 해당 별칭을 a. b. 각각 만들어준다. 
    b.category_name
from
	tbl_menu a				-- a라는 별칭, 밑은 b라는 별칭 만들어 준다.
join tbl_category b 
on a.category_code = b.category_code;   -- 어떤 테이블에 있는 category_code 인지 만들어준다.
	
    
-- using 을 활용한 join
-- 컬럼명이 같은 경우 using 으로 서로 연관있는 컬럼에 대한 조건을 작성하여
-- join 하는 경우
select
	a.menu_name,
    b.category_name
from
	tbl_menu a
join
	tbl_category b 
    using (category_code); 	-- category코드는 동일한 명이니 ()로 묶어서 표현/연관관계가 있는 컬럼을 묶음

-- left join   // 교집합 (왼쪽 기준: null 없이 모두 다~)
-- 첫 번째(왼쪽) 테이블의 모든 레코드와 두 번째(오른쪽)테이블에서 일치하는 레코드를 
-- 반환하는 sql join 유형
select
	a.category_name,
    b.menu_name
from 
	tbl_category a
left join tbl_menu b
on a.category_code = b.category_code;

-- right join	// 교집합 (오른쪽 기준: null 없이 모두 다~)
-- 두 번째(오른쪽) 테이블의 모든 레코드와 첫 번째(왼쪽) 테이블에서 일치하는 레코드를 반환하는 
-- sql join 유형
select
	a.menu_name,
    b.category_name
from
	tbl_menu a
right join
	tbl_category b
on a.category_code = b.category_code;

-- cross join 	// 합집합
-- 두 테이블의 모든 가능한 조합을 반환하는 sql join 유형
select
	a.menu_name,
    b.category_name
from
	tbl_menu a
cross join
	tbl_category b;
    
-- self join
-- 같은 테이블 내에서 행과 행 사이의 관계를 찾기 위해 사용되는 sql join 유형

select
	*
from
	tbl_category;					-- 전체로 조회했지만, 그 안에서 서로 인접한 곳으로 연결해서 만든다?
	
select
-- 	* 
	a.category_name,				-- 자기 카테고리를 참조함 (a.b => category_name)/ ref_&category 매칭되어, 값이 일치하면 
	b.category_name,
--     a.ref_category_code
from
	tbl_category a
join tbl_category b
on a.ref_category_code = b.category_code;

select
	a.menu_name,
    b.menu_name
from
	 tbl_menu a
join tbl_menu b
on	a.menu_code = b.menu_code;


	 
    
    


	







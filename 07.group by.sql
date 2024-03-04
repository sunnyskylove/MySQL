-- grouping
-- grouping by 절은 결과 집합을 특정 열의 값에 따라 그룹화 하는데 사용된다.

select
	category_code
from
	tbl_menu
group by category_code;					-- 중복된 것들을 그룹해서 묶어주면서 출력

-- count()	: 개수를 세준다.
select	
    category_code,
    count(*)							-- () 안도 다른 것으로 변경 가능
from
	tbl_menu
group by category_code;

-- sum() : 합계
select
	category_code,
	sum(menu_price)
from
	tbl_menu
group by
	category_code;

-- avg() : 평균
select
	category_code,
    avg(menu_price)					
from
	tbl_menu
group by category_code;

-- 2개 이상의 그룹 생성
select
	menu_price, 
    category_code
from
	tbl_menu
group by 
	menu_price,
    category_code;
    
-- with rollup
-- 컬럼들의 총합을 구하는 방식
select
	category_code,
    sum(menu_price)
from 
	tbl_menu
group by
	category_code
with rollup;				--  (출력값 맨 마지막에) 해당하는 총 합계까지 확인할 수 있다.

select
	menu_price,
    category_code,
    sum(menu_price)
from
	tbl_menu
group by 
	menu_price,
    category_code
with rollup;



	

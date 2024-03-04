-- subqueries
-- 다른 쿼리 내에서 실행되는 쿼리이다.
-- subquery 의 결과를 활용하여 복잡한 mainquery를 작성해 한 번에
-- 여러 작업을 수행할 수 있다.


use menudb;
-- tbl_menu 테이블에서 민트미역국과 같은 카테고리 코드를 가지고 있는 행들의 모든
-- 정보를 조회하시오.
select
	category_code
from
	tbl_menu
where
	menu_name = '민트미역국';

    
select
	*
from
	tbl_menu
where
	category_code = 4;
    
-- 해결 ▽
select
	*
from
	tbl_menu
where
	category_code = (
						select							-- 처음 작성했었던 문제1을 넣기! 
							category_code
						from
							tbl_menu	
						where
							menu_name = '민트미역국'
					);
                    
-- count() : 특정 열 또는 행의 수를 반환하는 데 사용
select
	category_code,
    count(*) as 'count'
from
	tbl_menu
group by category_code;

-- from 절에 쓰인 서브쿼리(derived talbe, 파생 테이블)
-- 반드시 자신의 별칭이 있어야 한다.
-- 이 count 라는 컬럼이 가진 가장 큰 값 -> 6 이라는 값을 도출하고 싶다.
-- max() : 최대값을 반화해줌.
-- ㅁ 상위 조회본에서 count의 수가 가장 많은 것을 다시 조회 원할때
select
	max(count)								 -- count에서 제일 큰 최대값을 꺼내기~!!
from (
		select
			category_code,
			count(*) as 'count'
		from
			tbl_menu
		group by 
			category_code 
		) as countmenu;							-- countmenu로 이름을 정해줌!

-- 상관 서브쿼리
-- 메인쿼리가 서브쿼리 결과에 영향을 주는 경우 상관 서브쿼리 라고 한다.

-- tbl_menu 테이블에서 카테고리 코드가 4번인 친구들의 메뉴 가격 평균을 조회하시오.
-- avg() 함수사용!!!
select
	avg(menu_price)
from 
	tbl_menu
where
	category_code = 4;   

-- 카테고리별 평균 가격보다 높은 가격의 메뉴의 메뉴코드, 메뉴 이름, 메뉴가격, 카테고리코드 를 조회하시오. (잘 안쓰이긴 함)
select
	a.menu_code,
    a.menu_name,
    a.menu_price,
    a.category_code			-- 하위 서브쿼리에 영향을 줌~~??
from tbl_menu a				-- a라는 별칭을 붙인것!
where
	menu_price > (
			select
				avg(menu_price)
			from
				tbl_menu
			where
				category_code = category_code
				);
-- cte(common table expressions)						-- 얘도 잘 안 쓰이긴 한다고 한다. / 가상의 테이블로 정함
-- 파생 테이블과 비슷한 개념이며 코드의 가독성과 재사용성을 위해 파생 테이블
-- 대신 사용하게 된다.
select
	a.menu_name,			
    b.category_name
from
	tbl_menu a
join
	tbl_category b
on
	a.category_code = b.category_code;

with menucate as (						-- 가상의 테이블 menucate를 인위적으로 만들어준다.
				select
					a.menu_name,			
					b.category_name
				from
					tbl_menu a
				join
					tbl_category b
				on
					a.category_code = b.category_code
					)				-- 안끝내놓고, (밑) 재사용으로 만들어 사용해도 된다!
                    
select
	*
from
	menucate;						-- 가상으로 만들어놓은 menucate를 조회한다.









                   
                    

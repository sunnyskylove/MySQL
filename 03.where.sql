-- where
-- where 절은 특정 조건에 맞는 레코드만 선택하는데 
-- 사용되며, 다양한 방법으로 조건을 설정할 수 있다.

select
	menu_name,
    menu_price,
    orderable_status
from 
	tbl_menu
where
	orderable_status = 'Y';			-- *(조건식) 판매상태가 Y인 애들만 추출하고 싶다~!

-- tbl_menu 테이블에서 메뉴 이름, 가격, 판매상태를 조회할건데 
-- 메뉴 가격이 13000원 인 친구들만 조회해줘!
select
	menu_name,
    menu_price,
    orderable_status
from 
	tbl_menu
where
menu_price = 13000;

-- tbl_menu 테이블에서 메뉴코드, 이름, 판매상태를 조회할건데
-- 판매상태가 Y가 아닌 애들만 조회해줘
select
	menu_code,
    menu_name,
    orderable_status
    from
		tbl_menu
	where
				-- !=, <> 부정연산자(generic)
    orderable_status != 'Y';
    
-- tbl_menu 에서 메뉴코드, 이름, 가격을 조회할건데, 가격이 2만원 초과인 녀석들만 조회해줘
select
	menu_code,
    menu_name,
    menu_price
from tbl_menu
where
	menu_price > 20000;

-- 2만원 이하
select
	menu_code,
    menu_name,
    menu_price
from tbl_menu
where
	menu_price <=20000;
    
-- tbl_menu 테이블에서 메뉴코드, 이름, 가격을 조회할건데
-- 10000원 이상 20000원 이하 조회해줘]
select
	menu_code,
    menu_name,
    menu_price
from tbl_menu
where
	menu_price >= 10000 and menu_price <= 20000;		-- &&, and 둘다 사용 가능하다!

-- and / or 연산자
-- where 절과 함께 사용을 하며
-- 자바랑 똑같다. (and 둘 다 true, or 둘 다 false)
-- (or) : 둘 다 null 이 아니면서 하나라도 0이 아닌 값이 있을 경우 1을 반환한다.

-- or 테스트
select 1 or 1, 1 or 0, 0 or 1;
select 0 or 0;

select
	menu_name,
    menu_price,
    category_code,
    orderable_status
from 
	tbl_menu
where
	orderable_status = 'Y' 
    or
    category_code = 10
order by
	category_code;
    
-- tbl_menu 에서 모든 컬럼을 조회하는데, 가격이 5000원 넘거나 카테고리 코드가 10인 녀석들을 조회해줘
select
	*
from 
	tbl_menu
where
	menu_price > 5000
    or
    category_code = 10;
	

-- (and) 연산자
-- and 연산자와 함께 where 절 사용

select 1 and 1;
select 1 and 0, 0 and 1, 0 and 0;

-- tbl_menu 테이블에서 모든 컬럼을 조회하는데, 
-- 판매상태가 y 이면서 카테고리코드가 10인 녀석들만 조회해줘
select
	*
from 
	tbl_menu
where
	orderable_status = 'y'
    and
    category_code = 10;
    
-- and 와 or 의 우선순위
-- and 가 or 보다 우선순위가 높다.
-- 따라서 or 의 우선순위를 높이고 싶으면 ()소괄호를 사용한다.
select
	*
from
	tbl_menu
where
	category_code = 4
    or
    menu_price = 9000				-- 우선순위로 인해, and 연산자부터 진행되고, 위의 or 진행됨
    and
    menu_code > 10;
    
    
-- between 연산자랑 where
select
	menu_name,
    menu_price,
    category_code
from
	tbl_menu
where
	menu_price between 10000 and 20000;

-- 부정 between
select
	menu_name,
    menu_price,
    category_code
from
	tbl_menu
where
	menu_price not between 10000 and 20000;
    
-- like 연산자
-- 문] tbl_menu 테이블에서 메뉴 이름, 가격을 조회하는데
-- 메뉴이름이 '마늘'이라는 단어를 포함하고 있는 녀석들만 조회해줘
select
	menu_name,
    menu_price
from 
	tbl_menu
where
	menu_name like '%마늘%';				  -- %% 안에 있는 문자만 나옴
    
-- tbl_menu 테이블에서 모든 컬럼을 조회하는데
-- 가격이 5000원 넘으면서 카테고리 코드가 10이면서 '갈치' 를 포함하고 있는 녀석을 출력해줘
select
	*
from
	tbl_menu
where
    menu_price > 5000
and
	category_code =10
and
	menu_name like '%갈치%';					-- like 앞에 not(제외한) 넣을 수 있다.

-- in 연산자 활용
-- tbl_menu 테이블에서 메뉴이름, 카테고리 코드 조회하는데
-- 카테고리 코드가 4, 5, 6 인 애들을 조회해줘
select
	menu_name,
    category_code
from 
	tbl_menu
where
	category_code = 4
    or
	category_code = 5
	or
    category_code = 6;
 
-- 좀 더 간단한 식: in
select
	menu_name,
    category_code
from 
	tbl_menu
where
	category_code in (4,5,6);					-- not in 도 사용가능하다 : (~)만 제외한

-- is null 연산자 활용
select	
	category_code,
    category_name,
    ref_category_code
from
	tbl_category
where
	-- ref_category_code = null;					-- 아무것도 안나온다(초기화식)
   ref_category_code is null;						-- 따라서 아무것도 없는 값인 null이 나오게 하려면 is null식(부정) 으로 해야한다.
   --  ref_category_code is not null;					-- 반대식도 가능. 값 있는 것만 불러옴





    
	
	

	
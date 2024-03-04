-- 형변환
-- sql 데이터 형변환은 명시적 형변환과 암시적(묵시적) 형변환이 있다.

-- 명시적 형변환(Explicit Conversion)

-- * cast( 표현식: as 데이터형식 [(길이)] )					-- 길이는 생략 가능 (integer 같은 경우~)
-- * convert(표현식, 데이터형식 [(길이)])

-- 데이터 형식으로 가능한 것은 
-- BINARY, CHAR, DATE, DATETIME, JSON, DECIMAL(실수), SIGNED INTEGER
-- TIME, UNSIGNED INTEGER

-- SIGNED : 부호 있는 정수

select avg(menu_price) from tbl_menu;
select cast(avg (menu_price) as signed integer ) from tbl_menu;
select convert( avg(menu_price), signed integer ) from tbl_menu;

select cast('2024$3$4'as date);
select cast('2024/3/4'as date);
select cast('2024%3%4'as date);

-- 메뉴 가격 구하기
select
	concat( cast(menu_price as char(5)), '원')
from
	tbl_menu;
    
    
    
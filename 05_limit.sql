-- limit
-- limit 절은 select 문의 결과 집합에서 반환할 행의 수를 제한하는데 사용된다.

select
	*
from
	tbl_menu
order by 
	menu_price desc;
    
select
	*
from
	tbl_menu
order by
	menu_price desc
limit 5;								-- 5개 행만 나오게 제한걸음

-- * 형식: limit [offset, ] row_count
-- offset : 시작할 행의 번호(인덱스 체계)
-- row_count : 이후 행부터 반환 받을 행의 개수

select
	menu_code,
    menu_name,
    menu_price
from
	tbl_menu
order by 
	menu_price desc
limit 1, 4;						-- 1번째(0인덱스) 인덱스삭제후, 4개의 행까지로만 만들기


    
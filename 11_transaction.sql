-- transaction 
-- 트랜젝션이란?
-- 시작, 진행, 종료 단계를 가지며 만약 중간에 오류가 발생하면
-- rollback(시작 이전의 단계로 돌아가는 작업) 을 수행하고 
-- 데이터 베이스에 제대로 반영하기 위해서는 commit 을 진행한다.

-- MySQL 기본적으로 자동 커밋 설정이 되어 있다.
-- 따라서 rollback 이 안된다.
-- rollback 을 하기 위해서는 자동 커밋 설정을 off 해주어야 한다.

-- autocommit 활성화
set autocommit = 1;   -- true
set autocommit = ON;

-- autocommit 비활성화
set autocommit = 0;

-- autocommit 을 비활성화하면 transaction 을 명시적으로 commit
-- 해야지만 변경한 사항이 데이터베이스에 영구적으로 반영이 된다.
-- start transaction 구문을 작성하고
-- dml (insert, delete, update) 등 작업 수행후 commit or rollback 을 하면 된다.
start transaction;

-- ### 전체조회
select * from tbl_menu;
rollback;

insert into tbl_menu values(null, '바나나해장국', 9000, 4 , 'Y');
rollback;

delete from tbl_menu;							
rollback;  		-- insert 한게 없어지고, 예전 데이터로 다시 복구 된다.

update tbl_menu 
set
	menu_name = '수정메뉴'
where
	menu_code = 1;

-- commit 이후에 rollback 을 해도 rollback 디 적용되지 않는다.
commit;
rollback;    	-- commit 을 했기 때문에 rollback 안된다~~ (저장후 rollback이 안됨~)



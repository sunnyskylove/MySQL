show databases;
use mysql;
  
-- DDL(Data Definition Language)
-- DDL 은 데이터베이스의 스키마(테이블)를 정의하거나 수정하는데 사용되는 
-- SQL 의 한 부분이다.
 
-- 1-1 create
-- 테이블 생성을 위한 구문
-- if not exists 를 적용하면 기존에 존재하는 테이블이라도 에러가 발생하지 않는다.

-- 테이블의 컬럼 설정 방법
-- 컬럼이름 데이터타입(길이) [not null] [default value][auto_increment] colum_contraint;			-- [숨겨진 데이터] 제약된 조건 ???

-- tb1 예시 테이블 생성하기
 
create table if not exists tb1 (
	pk int primary key,
	fk int,
    col1 varchar(255),
    check(col1 in ('Y', 'N'))
) ENGINE=INNODB;					-- 가장 많이 사용됨. 그냥 뒤에 붙이기~!!

-- ENGINE=INNODB : 테이블을 innodb 라고 불리는 스토리지 엔진으로 생성하겠다는 의미(mysql에서)

describe tb1;							-- 테이블 정보 볼 수 있음

insert into tb1 values(1, 10, 'Y');

select * from tbl1;

-- auto_increment
-- insert 시 primary 키에 해당하는 컬럼에 자동으로 번호를 발생(중복되지 않게) 시켜 저장할 수 있다.

create table if not exists tb2 (
	pk int auto_increment primary key, 					-- pk = primary key 로 식별자 만들어줌
    fk int,
    coll varchar(255),
    check(col1 in ('Y', 'N'))
) ENGINE=InnoDB;

describe tb2;

insert into tb2 values(null,10,'Y');
insert into tb2 values(null,10,'Y');

select * from tb2;

-- alter
-- 테이블에 추가/변경/수정/삭제 하는 모든 것은 alter 명령어를 사용하여 적용한다.

-- 열 추가 (컬럼)
-- alter table 테이블명 add 컬럼명 컬럼정의
-- tb2 테이블에 col2 라는 컬럼 추가 (int 형, not null 제약조건 존재)
alter table tb2
add col2 int not null;			-- col2 추가하고, 비어있는 값이 존재할 수 없다.

describe tb2;

-- 열 삭제
-- alter table 테이블명 drop column 컬럼명
-- col2 컬럼 삭제
alter table tb2
drop column col2;

describe tb2;

-- 열 이름 및 데이터 형식 변경
-- alter table 테이블명 chane column 기존컬럼명 바꿀 컬럼명 컬럼정의
-- fk -> change_fk 컬럼으로 변경 not null 제약조건 추가
alter table tb2
change column fk change_fk int not null;

describe tb2;

-- 열 제약조건 추가 및 삭제
-- alter table 테이블명 drop 제약조건
-- tb2 테이블의 primary key 제약조건 제거

alter table tb2
drop primary key;					-- 안됨~~!! 따라서 속성 삭제해야함

-- auto_increment 가 걸려 있는 컬럼은 primary key 제거가 안된다.
-- 따라서 modify 명령어로 제거한다.
alter table tb2
modify pk int;						-- 수정 후, ▽
describe tb2;

-- 수정 후 primary key 삭제
alter table tb2
drop primary key;					-- 삭제됨.
describe tb2;

-- 다시 tbl 테이블의 pk 컬럼에 primary key 추가하기
-- add
alter table tb2
add primary key(pk);
describe tb2;

-- 컬럼 여러개 추가하기
alter table tb2
add col3 date not null,
add col4 tinyint not null;

-- date 형이 추가가 안 되는 것은 MySQL 이 5.7 버전 이후 
-- 0으로 채워진 date 컬럼이 존재하면 안되기 때문이다.

select @@global.sql_mode;

describe tb2;

-- 테이블을 삭제하기 위한 구문
create table if not exists tb3 (
	pk int auto_increment primary key,
	fk int,
    col1 varchar(255),
    check(col1 in ('Y', 'N'))
) ENGINE=INNODB;

-- drop table tb3
drop table if exists tb3;				-- tb3 테이블 삭제

drop table if exists tb1, tb2;			-- 한번에 여러 테이블 삭제

-- truncate
-- 논리적으로는 where 절이 없는 delete 구문과 큰 차이가 없어 보인다.
-- 하지만 어차피 데이터를 다 삭제할 경우 행마다 하나씩 지워지는 delete 보다
-- drop 이후 바로 테이블을 재생성 해주는 truncate 가 훨씬 효율적으로
-- 한번에 테이블을 초기화 시켜준다.
create table if not exists tb1 (
	pk int auto_increment primary key,
	fk int,
    col1 varchar(255),
    check(col1 in ('Y', 'N'))
) ENGINE=INNODB;

insert into tb1 values (null, 10, 'Y');
insert into tb1 values (null, 20, 'Y');
insert into tb1 values (null, 30, 'Y');
insert into tb1 values (null, 40, 'Y');

select * from tb1;

-- 테이블 초기화 
-- truncate table tb1;
truncate tb1;				-- table 키워드 생략 가능
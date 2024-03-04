-- build in functions
-- MySQL 은 문자열, 숫자, 날짜, 시간에 관한 다양한 작업 수행에 많은 
-- 내장 함수를 제공하고 있다.

-- concat(문자열 1, 문자열2, ...)
-- concat_ws(구분자, 문자열1, 문자열2, ...)

select concat('호랑이','기린','토끼');
select concat_ws('-', '2024', '03', '04');

-- elt : 해당 위치의 문자열 반환
-- field : 찾을 문자열 위치 반환
-- find_in_set : 찾을 문자열의 위치 반환
-- instr : 기준 문자열에서 부분 문자열의 시작 위치 반환
-- locate : instr 과 동일하고 순서만 반대

select
	elt(2, '사과', '딸기', '바나나'),			-- 2번쨰의 값이므로 딸기가 출력됨
    field('딸기','사과','딸기','바나나'),		-- 얘는 2가 출력?????
    
    find_in_set('바나나','사과, 딸기, 바나나'),
    instr('사과딸기바나나','딸기'),
    locate('딸기','사과딸기바나나');

-- format(숫자, 소수점 자리수)       // 반올림 하는 함수
-- 1000 단위마다 콤마(,) 표시를 해주며 소수점 아래 자리수 까지 반올림 표현한다.
select format(12387648.71648761, 3);		-- 1000단위마다 콤마표시하고, 3번째 소수점 아래 자리수까지 반올림 한다는 말~~

-- insert(기준 문자열, 위치, 길이, 삽입할 문자열)
select insert('내 이름은 아무개 입니다.',7,3,'조평훈');			-- 사용할 문자열,현재의 문자수길이(개수),변경할 문자열의 개수,삽입할 문자열

-- left, right
-- left : 왼쪽에서 문자열의 길이만큼을 반환
-- right : 오른쪽에서 문자열의 길이만큼을 반환
select left('Hello World!', 3), right('Hello World!',3);

-- upper(대문자로), lower(소문자로)
select upper('Hello World!'), lower('Hello World!');

-- lpad(문자열, 길이, 채울 문자열), rpad(문자열, 길이, 채울 문자열)
-- lpad:문자열을 길이만큼 왼쪽으로 늘린 후에 빈 곳을 문자열로 채운다. / rpad는 반대(오른쪽으로~~)
-- 001313-1*****
select lpad('왼쪽', 6, '@'), rpad('오른쪽', 6, '@');

-- ltrim(문자열), rtrim(문자열)
-- △ 왼쪽 공백제거, △오른쪽 공백 제거
select ltrim('     왼쪽');

-- trim(문자열), trim(방향 자를문자열 from 문자열)					// 여기에선 실제로도 콤마를 안쓴다.
-- 방향 : leading (앞), both(양쪽), trailing(뒤) 해당 방향에 대한 지정한 문자열을 제거할 수 있다.
select trim(both '@' from '@@@MySQL@@@@@');

-- repeat(문자열, 횟수), replace(문자열, 찾을 문자여르 바꿀 문자열), reverse(문자열)
select replace('마이SQL', '마이', 'My');

-- substring(문자열, 시작위치, 길이)
-- 시작 위치부터 길이 만큼의 문자를 반환(길이를 생략하면 시작 위치부터 끝까지 반환)

select substring('안녕하세요 반갑습니다.', 7, 2);	 -- 7번째 글자부터 2개를 출력해서 반갑 이 뜬다!
select substring('안녕하세요 반갑습니다.', 7, 2), substring('안녕하세요 반갑습니다.', 7);

-- substring_index(문자열, 구분자, 횟수)
-- 구분자가 왼쪽부터 횟수 번째 나오면 그 이후의 오른쪽은 버린다.
-- 횟수가 음수일 때는 오른쪽 부터 세고, 왼쪽을 버린다.
select substring_index('hong.test@gmail.com', '.', 2);		-- 2번째의 . 부터는 제거한다는 말~
select substring_index('hong.test@gmail.com', '.', -2);		-- 음수라서, 왼쪽부터 버린다~

-- 수학 관련 함수
-- abs(숫자) : 절대값 반환
select abs(-1234);
 





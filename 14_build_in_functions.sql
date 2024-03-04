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

-- *format(숫자, 소수점 자리수)       // 반올림 하는 함수
-- 1000 단위마다 콤마(,) 표시를 해주며 소수점 아래 자리수 까지 반올림 표현한다.
select format(12387648.71648761, 3);		-- 1000단위마다 콤마표시하고, 3번째 소수점 아래 자리수까지 반올림 한다는 말~~

-- insert(기준 문자열, 위치, 길이, 삽입할 문자열)
select insert('내 이름은 아무개 입니다.',7,3,'조평훈');			-- 사용할 문자열,현재의 문자수길이(개수),변경할 문자열의 개수,삽입할 문자열

-- left, right
-- left : 왼쪽에서 문자열의 길이만큼을 반환
-- right : 오른쪽에서 문자열의 길이만큼을 반환
select left('Hello World!', 3), right('Hello World!',3);

-- *upper(대문자로), *lower(소문자로)
select upper('Hello World!'), lower('Hello World!');

-- lpad(문자열, 길이, 채울 문자열), rpad(문자열, 길이, 채울 문자열)
-- lpad:문자열을 길이만큼 왼쪽으로 늘린 후에 빈 곳을 문자열로 채운다. / rpad는 반대(오른쪽으로~~)
-- 001313-1*****
select lpad('왼쪽', 6, '@'), rpad('오른쪽', 6, '@');

-- ltrim(문자열), rtrim(문자열)
-- △ 왼쪽 공백제거, △오른쪽 공백 제거
select ltrim('     왼쪽');

-- *trim(문자열), trim(방향 자를문자열 from 문자열)					// 여기에선 실제로도 콤마를 안쓴다.
-- 방향 : leading (앞), both(양쪽), trailing(뒤) 해당 방향에 대한 지정한 문자열을 제거할 수 있다.
select trim(both '@' from '@@@MySQL@@@@@');

-- *repeat(문자열, 횟수), *replace(문자열, 찾을 문자여르 바꿀 문자열), reverse(문자열)
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

-- ceiling(숫자) : 올림값 반환
-- floor(숫자) : 버림값 반환
-- round(숫자) : 반올림값 반환
select ceiling(1234.36), floor(1234.56), round(1234.56);

-- mod(숫자1, 숫자2) or 숫자1 % 숫자2 or 숫자1 mod 숫자2
-- 숫자1을 숫자 2로 나눈 나머지를 추출
select mod(75,10), 75 % 10, 75 mod 10;		-- 이렇게 3가지 경우의 수로 조회할 수 있다.

-- *pow(숫자1, 숫자2) : 거듭제곱값   //숫자1의 숫자2승 같은 느낌~~
-- *sqrt(숫자) : 제곱근을 추출     // 루트 16은 4와 같은 느낌~~ ( sqrt 가 루트 같다.)

select pow(2,4), sqrt(16);

-- *rand() : 0 이상 1 미만의 실수를 구한다.     // = 랜덤
-- m <= 임의의 정수 < n 을 구하고 싶다면,
-- 공식: floor( (rand() * (n -m) + m )
-- 1부터 10까지 난수 : floor(rand() * (11-1) + 1 )

select rand(), floor(rand() * (11-1) + 1 );					-- 자바의 난수(랜덤)와 식 같아서 출력할때마다 바뀐 랜덤숫자 계속 나옴~

-- sign(숫자)
-- 양수면 1, 0이면 0, 음수면 -1 을 반환
select sign(10.1), sign(0), sign(-10);

-- truncate(숫자, 정수);			-- 숫자는 실수도 포함!
-- 소수점을 기준으로 정수 위치까지 구하고 나머지 버림
select truncate(12345.1235, 2);				-- (양수시) 소수점 기준으로 2번째까지만 구하고, 나머지는 버림 : 12345.12
select truncate(12345.1235, -2);			-- (음수시) 소수점 정수 기준으로 2번째까지만 구하고, 나머지는 버림 : 12300

-- 날짜 및 시간 관련 함수
-- * adddate(날짜, 차이) : 날짜를 기준으로 차이를 더함
-- * subdate(날짜, 차이) : 날짜를 기준으로 날짜를 뺌
select adddate('2024-03-04', interval 30 day);			-- 오늘날짜 기준으로 30일 후 확인 (더하기)
select adddate('2024-03-04', interval 6 month);			-- 오늘날짜로 6개월 뒤 확인
select adddate('2024-03-04', interval 6 year);			-- 오늘날짜로 6년 뒤 확인

select subdate('2024-03-04', interval 30 day);			-- 오늘날짜 기준으로 30일 전 확인 (뺴기)
select subdate('2024-03-04', interval 6 month);			-- 오늘날짜 기준으로 6개월 전 확인 (뺴기)
select subdate('2024-03-04', interval 6 year);			-- 오늘날짜 기준으로 6년 전 확인 (뺴기)

-- * addtime(날짜/시간, 시간)
-- * subtime(날짜/시간, 시간)
select addtime('2024-03-04 17:42:00', '0:30:0');   -- 날짜와 시간까지 입력 가능하고, 시간을 더한다.
select subtime('2024-03-04 17:42:00', '0:30:0');   -- 날짜와 시간까지 입력 가능하고, 시간을 뺀다.

-- * curdate : 현재 연-월-일
-- * curtime : 현재 시:분:초
-- * now() or sysdate() : 현재 연-월-일 시:분:초alter
select curdate(), curtime(), now(), sysdate();

-- * year(날짜), * month(날짜), * day(날짜)
-- 연 월 일 시 분 초 밀리초 까지 전부 가능하다!
select year(curdate()), month(curdate()), microsecond(curdate());

-- * datediff(날짜1, 날짜2)
-- * timediff(날짜1, 시간1, 날짜2 또는 시간2)
-- datediff : 날짜1 - 날짜2 의 일수를 반환
-- timediff : 시간1 - 시간2 의 결과

select datediff('2024-03-07', now()), timediff('17:05:11', '13:00:10');			-- 뺀 날짜, 뺀 시간

-- * dayofweek(날짜) : 요일 반환(일요일이 1)
-- * monthname : 해당 달의_이름 반환
-- * dayofyear : 해당 년도에서_몇 일이 흘렀는 지 

select dayofweek(curdate()), monthname(curdate()), dayofyear(curdate());

-- * last_day(날짜)
-- 해당 날짜의 달에서_마지막 날의 날짜를 구한다.
select last_day('20240201');
select last_Day(curdate());

-- quarter(날짜) : 해당 날짜의_분기를 구한다.
select quarter(curdate());

-- * time_to_sec(시간) : 시간을 초 단위로 구함
select time_to_sec('1:1:1');			-- 1시간 1분 1초 : 3600초+600초+1초??   (초단위로 나옴)


 





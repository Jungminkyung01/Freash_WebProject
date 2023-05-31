-- mariaDB를 이용하여 구현하였습니다.

create user 'cos3'@'%' identified by 'cos31234';
GRANT ALL PRIVILEGES ON *.* TO 'cos3'@'%';
CREATE DATABASE fresh3;
-- table 
SHOW TABLES;
SELECT * FROM user;
SELECT * FROM subscribe;
SELECT * FROM image;
SELECT * FROM likes;
DESC image;
SELECT * FROM step;
SELECT * FROM comment;

-- 구독 수
SELECT COUNT(*) FROM subscribe WHERE fromUserId = 3;

--구독 여부
SELECT * FROM subscribe WHERE fromUserId = 1 AND toUserId = 2;

-- user 구독 
-- 현재 구독되어 있는 명단 인기 리스트 
SELECT * FROM user WHERE id IN (SELECT toUserId FROM (SELECT toUserId, COUNT(toUserId) subCount FROM subscribe GROUP BY toUserId ORDER BY subCount DESC) c);

SELECT * FROM subscribe WHERE id ;
SELECT DISTINCT toUserId FROM subscribe;
SELECT toUserId, 1 likeCount FROM subscribe;
SELECT toUserId, COUNT(toUserId) subCount FROM subscribe GROUP BY toUserId ORDER BY subCount DESC;
SELECT toUserId FROM (SELECT toUserId, COUNT(toUserId) subCount FROM subscribe GROUP BY toUserId ORDER BY subCount DESC) c;

SELECT * 
FROM user i INNER JOIN (SELECT toUserId, COUNT(toUserId) subCount FROM subscribe GROUP BY toUserId) c
ON i.id = c.toUserId
ORDER BY subCount DESC;

SELECT i.* FROM user i INNER JOIN (SELECT toUserId, COUNT(toUserId) subCount FROM subscribe GROUP BY toUserId) c ON i.id = c.toUserId ORDER BY subCount DESC;

-- 대표 이미지 & 소개
SELECT * FROM image;

SELECT * FROM image WHERE mainMenu='채소류' ORDER BY id DESC;

SELECT * FROM image WHERE mainMenu='고기'ORDER BY id DESC;

SELECT * FROM image WHERE mainMenu='해산물'ORDER BY id DESC;

SELECT * FROM image WHERE mainMenu='유제품/계란'ORDER BY id DESC;

SELECT * FROM image WHERE mainMenu='과일'ORDER BY id DESC;

-- 해당 id값의 정보들을 불러와야 한다. id 3번=> 3
SELECT * FROM image, step WHERE image.id=3 AND step.id=3;

SELECT id FROM image WHERE image.id=1;

-- like 인기 페이지 
SELECT i.* FROM image i INNER JOIN (SELECT imageId, COUNT(imageId) likeCount FROM likes GROUP BY imageId) c ON i.id = c.imageId ORDER BY likeCount DESC;

-- 상세페이지 정보를 위해 
SELECT * FROM step i INNER JOIN (SELECT * FROM image WHERE id=1 GROUP BY id) c ON i.id = c.id;

SELECT id FROM image GROUP BY id;

SELECT * FROM image,step WHERE image.id = step.id;

SELECT * FROM image WHERE id=1;

-- SELECT * FROM image WHERE userId IN (SELECT toUserId(상대방) FROM subscribe WHERE fromUserId(나) = :principalId) ORDER BY id DESC
-- 이미지 접속 했을 때 -> 상세 정보
SELECT * FROM image WHERE userId IN (SELECT toUserId FROM subscribe WHERE fromUserId = 1) ORDER BY id DESC;
SELECT * FROM image WHERE 

SELECT * FROM image WHERE image.id=2 IN (SELECT toUserId FROM subscribe WHERE fromUserId) ORDER BY id DESC;
SELECT * FROM image  i INNER JOIN (SELECT * FROM step WHERE id=1 GROUP BY id) c ON i.id = c.id;
SELECT * FROM image WHERE image.id=3 AND userId IN (SELECT toUserId FROM subscribe WHERE fromUserId) ORDER BY id DESC;

-- like
SELECT * FROM image WHERE mainMenu='채소류' AND userId IN (SELECT id FROM user WHERE id = 1) ORDER BY id DESC;

-- 3. 마이페이지에서 내가 등록한 게시물보기
SELECT * FROM image WHERE userId IN (SELECT id FROM user WHERE id=1)ORDER BY id DESC;

-- 4. 마이페이지에서 내가 찜한 게시물 보기
SELECT * FROM image WHERE userId IN (SELECT imageId FROM likes WHERE userId = 1) ORDER BY id DESC;

SELECT * FROM comment;

-- imageId가 1인 곳의 댓글
SELECT * FROM comment WHERE imageId=1;

-- 보여주는 것은 cout으로 보여주면 되고 
DELETE FROM image WHERE id=26;
SELECT * FROM image;
SELECT * FROM user;

-- update
UPDATE image SET title='안녕',subTitle='안녕',ingredient='안녕',mainMenu='안녕',person='안녕',cookTime='안녕',difficult='안녕',cookTip='안녕' WHERE id=29;

INSERT INTO subscribe(fromUserId, toUserId, createDate) VALUES(:fromUserId, :toUserId, NOW());

SELECT * FROM user order by id DESC;

SELECT * FROM add1;

-- test프로시저 생성 
DELIMITER $$

CREATE PROCEDURE testDataInsert()
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= 120 DO
        INSERT INTO ADD1(title, content1)
          VALUES(concat('제목',i), concat('내용',i));
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER $$

CALL testDataInsert;
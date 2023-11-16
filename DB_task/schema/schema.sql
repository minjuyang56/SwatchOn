USE pokemon;

-- Category 테이블 (1개, 필수값o, 추가o) ex.불 / 물 / 풀 / 전기
CREATE TABLE Category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) UNIQUE NOT NULL
);

-- Fabric 테이블 ex.피카츄 / 라이츄 / 파이리 / 꼬부기
CREATE TABLE Fabric (
    fabric_id INT AUTO_INCREMENT PRIMARY KEY,
    fabric_name VARCHAR(255) UNIQUE NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

-- Pattern 테이블 생성 (2개 이상, 필수값x, 추가o) ex.솔리드 / 스트라이프 / 체크 / 아가일 / 하운즈투스 / 페이즐리
CREATE TABLE Pattern (
    pattern_id INT AUTO_INCREMENT PRIMARY KEY,
    pattern_name VARCHAR(255) UNIQUE NOT NULL
);

-- Content 테이블 생성 (2개 이상, 필수값o, 추가o) ex.체력 / 정신력 / 민첩성 / 지혜 / 운
CREATE TABLE Content (
    content_id INT AUTO_INCREMENT PRIMARY KEY,
    content_name VARCHAR(255) UNIQUE NOT NULL
);

-- Fabric_Pattern 테이블 생성 (Fabric과 Pattern의 다대다 관계 테이블)
CREATE TABLE Fabric_Pattern (
    fabric_pattern_id INT AUTO_INCREMENT PRIMARY KEY,
    fabric_id INT,
    pattern_id INT,
    FOREIGN KEY (fabric_id) REFERENCES Fabric(fabric_id),
    FOREIGN KEY (pattern_id) REFERENCES Pattern(pattern_id),
    UNIQUE (fabric_id, pattern_id) -- Fabric에 중복된 패턴이 들어가지 않도록 UNIQUE 설정
);

-- Fabric_Content 테이블 생성 (Fabric과 Content의 다대다 관계 테이블)
CREATE TABLE Fabric_Content (
    fabric_content_id INT AUTO_INCREMENT PRIMARY KEY,
    fabric_id INT NOT NULL,
    content_id INT NOT NULL,
    percentage INT NOT NULL,
    FOREIGN KEY (fabric_id) REFERENCES Fabric(fabric_id),
    FOREIGN KEY (content_id) REFERENCES Content(content_id),
    UNIQUE (fabric_id, content_id) -- Fabric에 중복된 혼용률이 들어가지 않도록 UNIQUE 설정
);

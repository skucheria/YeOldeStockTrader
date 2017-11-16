DROP DATABASE IF EXISTS YeOldeStockTrader;
CREATE DATABASE YeOldeStockTrader;
USE YeOldeStockTrader; 
 
 CREATE TABLE User  (
	userID VARCHAR(25)  PRIMARY KEY, -- username = userID
    email VARCHAR(25) NOT NULL,  
    password VARCHAR(32) NOT NULL, -- password is MD5 hashed 
	firstName VARCHAR(25) NOT NULL,  
	lastName VARCHAR(25) NOT NULL,  
	profilePicture VARBINARY(50000)
   
);

 CREATE TABLE Post  (
	postID int(10)  PRIMARY KEY AUTO_INCREMENT, 
    stockName VARCHAR(25) NOT NULL,  
	direction VARCHAR(1000) NOT NULL, 
    ticker VARCHAR(10) NOT NULL, 
    date VARCHAR(11) NOT NULL,
    time VARCHAR(11) NOT NULL,
    userID VARCHAR(25) NOT NULL,
	category VARCHAR(25) NOT NULL,
	CONSTRAINT fk_user FOREIGN KEY (userID) REFERENCES User(userID) ON DELETE CASCADE ON UPDATE CASCADE
);

 CREATE TABLE Answer  (
	answerID int(10)  PRIMARY KEY AUTO_INCREMENT, 
    response VARCHAR(1000) NOT NULL,  
    date VARCHAR(11) NOT NULL,
    time VARCHAR(11) NOT NULL,
    postID int(10) NOT NULL,
	userID VARCHAR(25) NOT NULL,-- , --  author
	CONSTRAINT foreign key fk1(postID) references Post(postID) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT foreign key fk2(userID) references User(userID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Answer_Rating  (
	upvote int(255), 
	downvote int(255), 
    userID VARCHAR(25) NOT NULL,
    answerID int(10) NOT NULL,
	CONSTRAINT foreign key fk1(userID) references User(userID) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT foreign key fk2(answerID) references Answer(answerID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Bookmark(
	postID int(10) NOT NULL,
	userID VARCHAR(25) NOT NULL,-- , --  author
	CONSTRAINT foreign key fk1(postID) references Post(postID) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT foreign key fk2(userID) references User(userID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Overall_Rating(
	answerID int(10) NOT NULL,
	rating int(10) NOT NULL,
	CONSTRAINT foreign key fk1(answerID) references Answer(answerID) ON DELETE CASCADE ON UPDATE CASCADE
);


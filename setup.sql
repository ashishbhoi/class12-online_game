DROP TABLE IF EXISTS Words_in_Category;
DROP TABLE IF EXISTS Category;
CREATE TABLE Category (
    Category_Id TEXT PRIMARY KEY,
    Category_Name TEXT NOT NULL UNIQUE
);
CREATE TABLE Words_in_Category (
    Word_Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Word TEXT NOT NULL,
    Category_Id TEXT,
    FOREIGN KEY (Category_Id) REFERENCES Category(Category_Id) ON DELETE CASCADE
);
INSERT INTO Category (Category_Id, Category_Name) VALUES
('C1', 'Countries'),
('C2', 'Animals'),
('C3', 'Fruits'),
('C4', 'Vegetables'),
('C5', 'Capitals');
INSERT INTO Words_in_Category (Word, Category_Id) VALUES
('INDIA', 'C1'),
('CANADA', 'C1'),
('JAPAN', 'C1'),
('BRAZIL', 'C1'),
('AUSTRALIA', 'C1'),
('EGYPT', 'C1'),
('FRANCE', 'C1'),
('GERMANY', 'C1'),
('ITALY', 'C1'),
('MEXICO', 'C1');
INSERT INTO Words_in_Category (Word, Category_Id) VALUES
('LION', 'C2'),
('TIGER', 'C2'),
('ELEPHANT', 'C2'),
('GIRAFFE', 'C2'),
('ZEBRA', 'C2'),
('PENGUIN', 'C2'),
('KANGAROO', 'C2'),
('MONKEY', 'C2'),
('DOLPHIN', 'C2'),
('CROCODILE', 'C2');
INSERT INTO Words_in_Category (Word, Category_Id) VALUES
('APPLE', 'C3'),
('MANGO', 'C3'),
('BANANA', 'C3'),
('ORANGE', 'C3'),
('STRAWBERRY', 'C3'),
('GRAPES', 'C3'),
('PINEAPPLE', 'C3'),
('WATERMELON', 'C3'),
('CHERRY', 'C3'),
('PEACH', 'C3');
INSERT INTO Words_in_Category (Word, Category_Id) VALUES
('CARROT', 'C4'),
('BROCCOLI', 'C4'),
('SPINACH', 'C4'),
('POTATO', 'C4'),
('TOMATO', 'C4'),
('ONION', 'C4'),
('CUCUMBER', 'C4'),
('PUMPKIN', 'C4'),
('CABBAGE', 'C4'),
('LETTUCE', 'C4');
INSERT INTO Words_in_Category (Word, Category_Id) VALUES
('DELHI', 'C5'),
('TOKYO', 'C5'),
('OTTAWA', 'C5'),
('CAIRO', 'C5'),
('CANBERRA', 'C5'),
('PARIS', 'C5'),
('BERLIN', 'C5'),
('ROME', 'C5'),
('MOSCOW', 'C5'),
('LONDON', 'C5');
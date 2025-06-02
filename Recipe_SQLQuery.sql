CREATE DATABASE RecipeDB
USE RecipeDB

CREATE TABLE Client (
	ClientID int NOT NULL PRIMARY KEY,
	ClientName varchar(255),
	Email varchar(255),
	Registration_Date datetime,
	Password char(12)
);
CREATE TABLE Category (
	CategoryID int NOT NULL PRIMARY KEY,
	CategoryName varchar(255)
);
CREATE TABLE Recipe (
	RecipeID int NOT NULL PRIMARY KEY,
	Title varchar(255),
	Description text,
	Instructions text,
	CreationDate datetime,
	ClientID int NOT NULL FOREIGN KEY REFERENCES Client(ClientID),
	CategoryID int NOT NULL FOREIGN KEY REFERENCES Category(CategoryID)
);
CREATE TABLE Ingredient (
	IngredientID int NOT NULL PRIMARY KEY,
	IngredientName varchar(255),
);
CREATE TABLE Recipe_Ingredient (
	RecipeID int NOT NULL FOREIGN KEY REFERENCES Recipe(RecipeID),
	IngredientID int NOT NULL FOREIGN KEY REFERENCES Ingredient(IngredientID),
	Quantity decimal,
	Unit varchar(150)
);
Select * from Recipe_Ingredient
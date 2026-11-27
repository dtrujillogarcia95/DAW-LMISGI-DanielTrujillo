USE GYM;
CREATE TABLE CLIENT(
  client_id INT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  registration_date DATE NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  phone VARCHAR(20) NOT NULL
);
CREATE TABLE EQUIPMENT(
  equipment_id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  brand VARCHAR(50) NOT NULL,
  category VARCHAR(30) NOT NULL,
  availability BOOLEAN NOT NULL DEFAULT TRUE,
  quantity INT NOT NULL,
  CHECK (quantity > 0),
  CHECK (category IN ('Free Weight', 'Cardio', 'Strength'))  
);
CREATE TABLE RENT(
  rent_id INT PRIMARY KEY,
  client_id INT NOT NULL,
  equipment_id INT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE,
  FOREIGN KEY (client_id) REFERENCES CLIENT(client_id),
  FOREIGN KEY (equipment_id) REFERENCES EQUIPMENT(equipment_id)
);

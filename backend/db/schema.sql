SELECT id, nome, valore * 10 AS valore_crediti FROM piloti;
=======
CREATE DATABASE IF NOT EXISTS fantaf1;
USE fantaf1;

CREATE TABLE piloti (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  valore DECIMAL(8,2) NOT NULL
);

INSERT INTO piloti (nome, valore) VALUES
  ('Verstappen', 30.00), ('Leclerc', 25.50),
  ('Norris', 28.00), ('Hamilton', 22.50);

CREATE TABLE iscrizioni (
  id INT AUTO_INCREMENT PRIMARY KEY,
  utente VARCHAR(100) NOT NULL,
  totale DECIMAL(10,2) NOT NULL,
  creato_il TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- un'iscrizione con 3 piloti = 3 righe qui
CREATE TABLE righe_iscrizione (
  id INT AUTO_INCREMENT PRIMARY KEY,
  iscrizione_id INT NOT NULL,
  pilota_id INT NOT NULL,
  FOREIGN KEY (iscrizione_id) REFERENCES iscrizioni(id),
  FOREIGN KEY (pilota_id) REFERENCES piloti(id)
);
>>>>>>> 2f4dfbd5c96e68528c898dd8027d6256782c719c

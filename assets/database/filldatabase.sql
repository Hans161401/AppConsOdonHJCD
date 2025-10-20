USE tiendaonline;

INSERT INTO roles VALUES
(1, 'Administrador'),
(2, 'Secretaria'),
(3, 'Usuario');

INSERT INTO usuarios VALUES
('100', 'Juan Peréz', 'soyjuan@nada.com', 'Calle 1 #2-23', '3112121', '1234', 1),
('101', 'María Paz', 'soymaria@nada.com', 'Calle 2 #3-34', '3122218', '1234', 2),
('102', 'Martha Olave', 'soymartha@nada.com', 'Calle 3 #4-45', '3132183', '1234', 3),
('103', 'Mario Fernandez', 'soymario@nada.com', 'Calle 4 #5-53', '3132585', '1234', 2);

INSERT INTO marcas VALUES
(1, 'Acer'),
(2, 'Asus'),
(3, 'HP'),
(4, 'Lenovo'),
(5, 'Mac');

INSERT INTO productos VALUES
(null, 'Acer Aspire 16', 'Portatil Acer 16 pulgadas', 2500000, 3, 1),
(null, 'Asus Vivo Book', 'Asus Vivo Book 16 pulgadas', 2700000, 5, 2),
(null, 'HP 15', 'HP 15 pulgadas', 2450000, 4, 3),
(null, 'Lenovo 153', 'Lenovo IdeaPad 15,3 pulgadas', 2750000, 5, 4),
(null, 'Lenovo Slim 3', 'Portatil Lenovo Slim 14 pulgadas', 2600000, 4, 4),
(null, 'Macbook Air', 'Mac Book Air 13 pulgadas', 3200000, 3, 5);

INSERT INTO imagenes VALUES
('aceraspire16.png', 1),
('asusvivobook16.png', 2),
('hp15.png', 3),
('lenovo153.png', 4),
('lenovoslim3.png', 5),
('macbookair13.png', 6);

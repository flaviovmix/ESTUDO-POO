CREATE TABLE fase (
	codigo SERIAL PRIMARY KEY,
	
	quebra_cabeca_1 VARCHAR(25),
	quebra_cabeca_1_ativo SMALLINT,

	quebra_cabeca_2 VARCHAR(25),
	quebra_cabeca_2_ativo SMALLINT,

	quebra_cabeca_3 VARCHAR(25),
	quebra_cabeca_3_ativo SMALLINT,

	quebra_cabeca_4 VARCHAR(25),
	quebra_cabeca_4_ativo SMALLINT,

	quebra_cabeca_5 VARCHAR(25),
	quebra_cabeca_5_ativo SMALLINT
	
);

INSERT INTO fase (
    quebra_cabeca_1, quebra_cabeca_1_ativo,
    quebra_cabeca_2, quebra_cabeca_2_ativo,
    quebra_cabeca_3, quebra_cabeca_3_ativo,
    quebra_cabeca_4, quebra_cabeca_4_ativo,
    quebra_cabeca_5, quebra_cabeca_5_ativo
) VALUES
('1.1', 0, '1.2', 0, '1.3', 0, '1.4', 0, '1.5', 0),
('2.1', 0, '2.2', 0, '2.3', 0, '2.4', 0, '2.5', 0),
('3.1', 0, '3.2', 0, '3.3', 0, '3.4', 0, '3.5', 0),
('4.1', 0, '4.2', 0, '4.3', 0, '4.4', 0, '4.5', 0),
('5.1', 0, '5.2', 0, '5.3', 0, '5.4', 0, '5.5', 0),
('6.1', 0, '6.2', 0, '6.3', 0, '6.4', 0, '6.5', 0),
('7.1', 0, '7.2', 0, '7.3', 0, '7.4', 0, '7.5', 0),
('8.1', 0, '8.2', 0, '8.3', 0, '8.4', 0, '8.5', 0),
('9.1', 0, '9.2', 0, '9.3', 0, '9.4', 0, '9.5', 0),
('10.1', 0, '10.2', 0, '10.3', 0, '10.4', 0, '10.5', 0),
('11.1', 0, '11.2', 0, '11.3', 0, '11.4', 0, '11.5', 0),
('12.1', 0, '12.2', 0, '12.3', 0, '12.4', 0, '12.5', 0),
('13.1', 0, '13.2', 0, '13.3', 0, '13.4', 0, '13.5', 0),
('14.1', 0, '14.2', 0, '14.3', 0, '14.4', 0, '14.5', 0);

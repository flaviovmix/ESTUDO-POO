select * from personagem_fase;

CREATE TABLE personagem_fase (
    codigo SERIAL PRIMARY KEY,
    personagem INTEGER NOT NULL,
    fase INTEGER NOT NULL,
    FOREIGN KEY (personagem) REFERENCES personagem (codigo) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fase) REFERENCES fase (codigo) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO personagem_fase (personagem, fase) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14);
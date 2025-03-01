DROP TABLE personagem;
TRUNCATE TABLE personagem;
select * from personagem;

CREATE TABLE personagem (
	codigo SERIAL PRIMARY KEY,
	ativo SMALLINT NOT NULL,
	nome VARCHAR(99) NOT NULL,
	nome_arquivo VARCHAR(255),
	nacionalidade VARCHAR(99),
	pais VARCHAR(99),
	orientacao_sexual VARCHAR(25),
	estado_civil VARCHAR(25),
	data_nascimento DATE,
	quant_filhos INTEGER,
	peso NUMERIC(4,1) CHECK (peso >= 0),
	quadril SMALLINT CHECK (quadril >=0), 
	cintura SMALLINT CHECK (cintura >=0), 
	busto SMALLINT CHECK (busto >=0),
	altura NUMERIC(3,2) CHECK (altura >=0),
	hobbie VARCHAR(50),
	ultimo_acesso TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
	obs TEXT
);


INSERT INTO personagem (
    ativo, nome, nome_arquivo, nacionalidade, pais, orientacao_sexual, estado_civil, 
    data_nascimento, quant_filhos, peso, quadril, cintura, busto, altura, hobbie, obs
) VALUES
-- 1
(1, 'Amanda Beatriz de Castro', '1', 'Brasileira', 'Brasil', 'Heterossexual', 'Solteira', 
 '1995-03-12', 0, 60.2, 95, 70, 98, 1.67, 'Dança', 'Ama festas e dança profissionalmente.'),
 
-- 2
(0, 'Sofia Ruiz Mendez', '2', 'Espanhola', 'Espanha', 'Bissexual', 'Solteira', 
 '1993-07-25', 0, 62.0, 96, 72, 100, 1.70, 'Yoga', 'Instrutora de yoga e bem-estar.'),
 
-- 3
(0, 'Mia Carter Johnson', '3', 'Americana', 'EUA', 'Pansexual', 'Solteira', 
 '1998-05-09', 0, 58.5, 92, 68, 95, 1.65, 'Música', 'DJ conhecida por tocar em festivais.'),
 
-- 4
(0, 'Valentina Rossi Lombardi', '4', 'Chinesa', 'China', 'Heterossexual', 'Namorando', 
 '1994-11-15', 0, 64.1, 98, 74, 102, 1.72, 'Culinária', 'Gosta de cozinhar e experimentar receitas exóticas.'),
 
-- 5
(0, 'Emma Dubois Laurent', '5', 'Francesa', 'França', 'Bissexual', 'Casada', 
 '1990-06-30', 1, 65.3, 100, 75, 104, 1.68, 'Fotografia', 'Ama capturar momentos íntimos e naturais.'),
 
-- 6
(0, 'Aiko Tanaka Fujimoto', '6', 'Mexicana', 'México', 'Heterossexual', 'Solteira', 
 '1996-09-18', 0, 54.7, 89, 66, 92, 1.60, 'Cosplay', 'Faz cosplays e frequenta eventos geek.'),
 
-- 7
(0, 'Camila Fernández Lopez', '7',  'Japonesa', 'Japão', 'Heterossexual', 'Solteira', 
 '1997-04-22', 0, 61.5, 97, 73, 101, 1.69, 'Dança', 'Ama salsa e danças latinas.'),
 
-- 8
(0, 'Natalia Petrova Ivanova', '8', 'Russa', 'Rússia', 'Bissexual', 'Solteira', 
 '1995-08-10', 0, 59.8, 94, 70, 97, 1.71, 'Pintura', 'Adora pintar nus artísticos.'),
 
-- 9
(0, 'Elena Kovács Szabó', '9', 'Húngara', 'Hungria', 'Heterossexual', 'Solteira', 
 '1992-12-05', 0, 63.4, 99, 76, 103, 1.73, 'Esportes radicais', 'Curte paraquedismo e escalada.'),
 
-- 10
(0, 'Isabella Moretti Bianchi', '10', 'Brasileira', 'Brasil', 'Pansexual', 'Solteira', 
 '1999-02-28', 0, 56.9, 91, 67, 94, 1.66, 'Teatro', 'Atriz que adora explorar papéis sensuais.'),
 
-- 11
(0, 'Lena Bauer Schmidt', '11', 'Alemã', 'Alemanha', 'Heterossexual', 'Divorciada', 
 '1988-07-16', 2, 67.2, 102, 78, 106, 1.74, 'Motociclismo', 'Ama andar de moto e viajar sozinha.'),
 
-- 12
(0, 'Eva Lindström Andersson', '12', 'Sueca', 'Suécia', 'Bissexual', 'Solteira', 
 '1996-01-29', 0, 58.0, 93, 69, 96, 1.70, 'Natação', 'Passa horas nadando e relaxando em spas.'),
 
-- 13
(0, 'Jade Williams Clarke', '13', 'Britânica', 'Reino Unido', 'Heterossexual', 'Solteira', 
 '1993-10-05', 0, 62.7, 98, 74, 101, 1.68, 'Leitura', 'Gosta de literatura erótica e escrita criativa.'),
 
-- 14
(0, 'Riley Adams Bennett', '14', 'Canadense', 'Canadá', 'Bissexual', 'Solteira', 
 '1994-12-20', 0, 60.5, 96, 71, 99, 1.69, 'Videogames', 'Streamer famosa de jogos adultos e interativos.');

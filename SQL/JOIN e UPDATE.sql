SELECT 
    p.codigo AS id_personagem,
    p.nome AS nome_personagem,
    f.codigo AS id_fase,
    f.quebra_cabeca_1,
    f.quebra_cabeca_1_ativo,
    f.quebra_cabeca_2,
    f.quebra_cabeca_2_ativo,
    f.quebra_cabeca_3,
    f.quebra_cabeca_3_ativo,
    f.quebra_cabeca_4,
    f.quebra_cabeca_4_ativo,
    f.quebra_cabeca_5,
    f.quebra_cabeca_5_ativo
FROM personagem_fase pf
JOIN personagem p ON pf.personagem = p.codigo
JOIN fase f ON pf.fase = f.codigo
ORDER BY p.codigo, f.codigo;


UPDATE fase
SET quebra_cabeca_1_ativo = 1
WHERE codigo = (
    SELECT pf.fase 
    FROM personagem_fase pf
    JOIN personagem p ON pf.personagem = p.codigo
    WHERE p.nome = 'Amanda Beatriz de Castro'
);
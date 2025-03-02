DO $$ 
DECLARE 
  personagem_id INT;
  fase_id INT;
BEGIN
  -- Loop para cada personagem de 1 a 14
  FOR personagem_id IN 1..14 LOOP
      
    -- Loop para pegar todas as fases do personagem atual
    FOR fase_id IN (SELECT pf.fase 
      FROM personagem_fase pf 
      WHERE pf.personagem = personagem_id) 
    LOOP

      -- Desativa todas as partes do quebra-cabeça da fase do personagem atual
      UPDATE fase SET quebra_cabeca_1_ativo = 0 WHERE codigo = fase_id;
      UPDATE fase SET quebra_cabeca_2_ativo = 0 WHERE codigo = fase_id;
      UPDATE fase SET quebra_cabeca_3_ativo = 0 WHERE codigo = fase_id;
      UPDATE fase SET quebra_cabeca_4_ativo = 0 WHERE codigo = fase_id;
      UPDATE fase SET quebra_cabeca_5_ativo = 0 WHERE codigo = fase_id;

    END LOOP;

    -- Desativa o personagem
    UPDATE personagem SET ativo = 0 WHERE codigo = personagem_id;

  END LOOP;
END $$;

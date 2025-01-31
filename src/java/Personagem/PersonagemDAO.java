package Personagem;

import app.core.Conexao;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PersonagemDAO {
    private Conexao db;
    
    public PersonagemDAO() {
        db = new Conexao();
        db.abrirConexao();
    }
    
    public void adicionarPersonagem(PersonagemBean personagem) throws SQLException {
        PreparedStatement ps;
        ps = db.getConn().prepareStatement(
            "INSERT INTO personagem "
                    + "(nome, nomeArquivo, nacionalidade, orientacaoSexual, civil, peso, quadil, busto, altura, hobbie, obs) VALUES "
                    + "(   ?,           ?,             ?,                ?,     ?,    ?,      ?,     ?,      ?,      ?,   ?)"
        );
        
        ps.setString(1, personagem.getNome());
        ps.setString(2, personagem.getNomeArquivo());
        ps.setString(3, personagem.getNacionalidade());
        ps.setString(4, personagem.getOrientacaoSexual());
        ps.setString(5, personagem.getEstadoCivil());
        ps.setDouble(6, personagem.getPeso());
        ps.setDouble(7, personagem.getQuadil());
        ps.setDouble(8, personagem.getBusto());
        ps.setDouble(9, personagem.getAltura());
        ps.setString(10, personagem.getHobbie());
        ps.setString(11, personagem.getObs());
        
        ps.executeUpdate();
    }
}

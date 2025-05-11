package Personagem;

import app.core.Conexao;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PersonagemDAO {

    private Conexao dataBase;

    public PersonagemDAO() {
        dataBase = new Conexao("banco");
        dataBase.abrirConexao();
    }

    public void adicionarPersonagem(PersonagemBean personagem) throws SQLException {
        PreparedStatement ps = null;
        try {
            ps = dataBase.getConexao().prepareStatement(
                    "INSERT INTO personagem "
                    + "(nome, nome_arquivo, nacionalidade, pais, orientacao_sexual, estado_civil, data_nascimento, quant_filhos, peso, quadil, cintura, busto, altura, hobbie, ultimo_acesso, obs) VALUES "
                    + "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
            );

            ps.setString(1, personagem.getNome());
            ps.setString(2, personagem.getNomeArquivo());
            ps.setString(3, personagem.getNacionalidade());
            ps.setString(4, personagem.getPais());
            ps.setString(5, personagem.getOrientacaoSexual());
            ps.setString(6, personagem.getEstadoCivil());
            ps.setDate(7, (Date) personagem.getData_nascimento());
            ps.setInt(8, personagem.getQuant_filhos());
            ps.setDouble(9, personagem.getPeso());
            ps.setDouble(10, personagem.getQuadril());
            ps.setDouble(11, personagem.getCintura());
            ps.setDouble(12, personagem.getBusto());
            ps.setDouble(13, personagem.getAltura());
            ps.setString(14, personagem.getHobbie());
            ps.setDate(15, (Date) personagem.getUltimo_acesso());
            ps.setString(16, personagem.getObs());

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                try {
                    ps.close(); // fecha o PreparedStatement
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            dataBase.fecharConexao(); // fecha a conexão
        }
    }

}

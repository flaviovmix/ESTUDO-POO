package Garotas;

import app.core.Conexao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GarotaDAO {

    private Conexao bancoDados;

    public GarotaDAO() {
        bancoDados = new Conexao("banco");
        bancoDados.abrirConexao();
    }

    public List<GarotaBean> listarGarotas(String sql1) throws SQLException {
        List<GarotaBean> garotas = new ArrayList<>();
        bancoDados.abrirConexao();

        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Primeira consulta
            ps = bancoDados.getConexao().prepareStatement(sql1);
            rs = ps.executeQuery();
            while (rs.next()) {
                GarotaBean g = new GarotaBean();
                g.setNome(rs.getString("nome"));
                garotas.add(g);
            }
            rs.close();
            ps.close();
            //fim primeira consulta

            // Segunda consulta
            
            //fim segunda consulta
           
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            bancoDados.fecharConexao();
        }

        return garotas;
    }

}

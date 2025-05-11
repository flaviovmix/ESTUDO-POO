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

    public List<GarotaBean> listarGArotas(String busca) throws SQLException {
        List<GarotaBean> garotas = new ArrayList<>();
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String sql = busca;
            ps = bancoDados.getConexao().prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                GarotaBean garota = new GarotaBean();
                garota.setNome(rs.getString("nome"));
                garotas.add(garota);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            bancoDados.fecharConexao();
        }

        return garotas;
    }

}

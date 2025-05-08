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
        try {
            String sql = busca;

            PreparedStatement ps = bancoDados.getConexao().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                GarotaBean garota = new GarotaBean();
                
                garota.setNome(rs.getString("nome"));
                
                garotas.add(garota);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }      
        return garotas;
    }
    
}

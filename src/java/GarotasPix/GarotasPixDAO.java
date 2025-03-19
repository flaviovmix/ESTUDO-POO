package GarotasPix;

import app.core.ConectagarotasPixs;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GarotasPixDAO {
    
    private ConectagarotasPixs bancoDados;
    
    public GarotasPixDAO() {
        bancoDados = new ConectagarotasPixs();
        bancoDados.abrirConexao();
    }
    
    public void adicionarGarotasPix() {
        
    }
    
    public void editarGarotasPix() {
        
    }
    
    public void excluirGarotasPixDAO() {
        
    }
    
    public List<GarotasPixBean> listarGarotasPix(String query) {
        List<GarotasPixBean> garotasPixs = new ArrayList<>();
        
        try {
            String sql = query;
            PreparedStatement ps = bancoDados.getConexao().prepareStatement(sql);    
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                GarotasPixBean garotasPix = new GarotasPixBean();
                
                garotasPix.setNome(rs.getString("nome"));
                garotasPix.setNomeArquivo(rs.getString("nome_arquivo"));
                garotasPix.setDiretorio(rs.getString("diretorio"));
                garotasPix.setThumb(rs.getString("thumb"));
                garotasPix.setDiretorio(rs.getString("diretorio"));
                garotasPix.setPais(rs.getString("pais"));
                garotasPix.setNacionalidade(rs.getString("nacionalidade"));
                garotasPix.setPersonalidade(rs.getString("personalidade"));
                garotasPix.setPeso(rs.getInt("peso"));
                garotasPix.setCor_pele(rs.getString("cor_pele"));
                garotasPix.setCor_olhos(rs.getString("cor_olhos"));
                garotasPix.setCor_cabelo(rs.getString("cor_cabelo"));
                garotasPix.setBusto(rs.getInt("busto"));
                garotasPix.setCintura(rs.getInt("cintura"));
                garotasPix.setQuadril(rs.getInt("quadril"));
                garotasPix.setAltura(rs.getInt("altura"));
                garotasPix.setTatuagem(rs.getString("tatuagem"));
                garotasPix.setObs(rs.getString("obs"));
                
                garotasPixs.add(garotasPix);
            }
            
        } catch (SQLException e) {
            System.out.println("Erro ao listar garotasPixs = " + e.getMessage());
        }
                
        return garotasPixs;
    }
    
}

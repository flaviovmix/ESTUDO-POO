package Vegetal;

import app.core.ConectaVegetais;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VegetalDAO {
    
    private ConectaVegetais bancoDados;
    
    public VegetalDAO() {
        bancoDados = new ConectaVegetais();
        bancoDados.abrirConexao();
    }
    
    public void adicionarVegetal() {
        
    }
    
    public void editarVegetal() {
        
    }
    
    public void excluirVegetal() {
        
    }
    
    public List<VegetalBean> listarVegetais(String query) {
        List<VegetalBean> vegetais = new ArrayList<>();
        
        try {
            String sql = query;
            PreparedStatement ps = bancoDados.getConexao().prepareStatement(sql);    
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                VegetalBean vegetal = new VegetalBean();
                
                vegetal.setNome(rs.getString("nome"));
                vegetal.setNomeArquivo(rs.getString("nome_arquivo"));
                vegetal.setDiretorio(rs.getString("diretorio"));
                vegetal.setThumb(rs.getString("thumb"));
                vegetal.setDiretorio(rs.getString("diretorio"));
                vegetal.setPais(rs.getString("pais"));
                vegetal.setPapel(rs.getString("papel"));
                
                vegetais.add(vegetal);
            }
            
        } catch (SQLException e) {
            System.out.println("Erro ao listar vegetais = " + e.getMessage());
        }
                
        return vegetais;
    }
    
}

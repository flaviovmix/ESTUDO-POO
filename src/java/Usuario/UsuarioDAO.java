package Usuario;

import app.core.Conexao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioDAO {
    
    private Conexao dataBase;
    
    public UsuarioDAO() {
        dataBase = new Conexao("banco");
        dataBase.abrirConexao();
    }
    
    public void adicionarUsuario(UsuarioBean usuario) throws SQLException {
        PreparedStatement ps;
        String sql;
        
        sql = (
                "INSERT INTO usuario " 
                + "(primeiroNomeOuApelido, usuario, email, password)"
                + "VALUES (?,?,?,?)"
            );
        
        ps = dataBase.getConexao().prepareStatement(sql);
        ps.setString(1, usuario.getPrimeiroNomeOuApelido());
        ps.setString(2, usuario.getUsuario());
        ps.setString(3, usuario.getEmail());
        ps.setString(4, usuario.getPassword());
        
        ps.executeUpdate();
    }
    
public UsuarioBean buscarUsuario(String busca) throws SQLException {
    UsuarioBean usuario = null; 
    
    PreparedStatement ps = dataBase.getConexao().prepareStatement(busca);
    ResultSet rs = ps.executeQuery();
    
    if (rs.next()) {
        usuario = new UsuarioBean();
        usuario.setUsuario(rs.getString("usuario"));
        usuario.setPassword(rs.getString("password"));
    }
    
    return usuario;
}

}

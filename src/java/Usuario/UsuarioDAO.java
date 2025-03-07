package Usuario;

import app.core.Conexao;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UsuarioDAO {
    
    private Conexao dataBase;
    
    public UsuarioDAO() {
        dataBase = new Conexao();
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
    }
    
}

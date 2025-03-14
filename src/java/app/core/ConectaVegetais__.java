package app.core;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConectaVegetais__ {

    private Connection conexao; 
    
    public void abrirConexao() {

        try {
            Class.forName("org.postgresql.Driver");
            this.conexao = DriverManager.getConnection("jdbc:postgresql://localhost:5432/kids", "postgres", "masterkey"); 
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void fecharConexao() throws SQLException {
        try {
            this.conexao.close(); 
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Connection getConexao() {
        return conexao;
    }

    public void setConexao(Connection conexao) {
        this.conexao = conexao;
    }

}

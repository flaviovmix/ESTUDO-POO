package app.core;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConectagarotasPixs {
    
    private Connection conexao;
    
    public void abrirConexao() {
        String driver = "org.postgresql.Driver"; 
        String host = "localhost";
        String porta = "5432";
        String banco = "garotaspix";
        
        String usuario = "postgres";
        String senha = "masterkey";
        
        String url = "jdbc:postgresql://" + host + ":" + porta + "/" + banco;
        
        try {
            Class.forName(driver);
            this.conexao = DriverManager.getConnection(url, usuario, senha);
        } catch (Exception e) {
            System.out.print("Erro ao conectar ao banco: " + e.getMessage());
            e.printStackTrace();
        }
                
    }
    
    public void fecharConexao() {
        try {
             if (this.conexao != null && !this.conexao.isClosed()) {
                this.conexao.close();
            }
        } catch (Exception e) {
            System.out.print("Erro ao fechar ao banco: " + e.getMessage());
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
package Aluno;

import app.core.Conexao;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AlunoDAO {
    
    private Conexao db;

    public AlunoDAO() {
        db = new Conexao();
        db.abrirConexao();
    }
    
    public void adicionarAluno(AlunoBean aluno) throws SQLException {
        PreparedStatement ps;
        ps = db.getConn().prepareStatement(
            "INSERT INTO cliente (nome, conjuge, cpf, telefone, email, cep, cidade, estado, endereco, numero, obs) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
        );     
        ps.setString(1, aluno.getNome());
        ps.setString(2, aluno.getConjuge());
        ps.setString(3, aluno.getCpf());
        ps.setString(4, aluno.getTelefone());
        ps.setString(5, aluno.getEmail());
        ps.setString(6, aluno.getCep());
        ps.setString(7, aluno.getCidade());
        ps.setString(8, aluno.getEstado());
        ps.setString(9, aluno.getEndereco());
        ps.setString(10, aluno.getNumero());
        ps.setString(11, aluno.getObs());
        
        ps.executeUpdate();
    }
    
}

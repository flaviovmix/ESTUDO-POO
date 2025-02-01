package Aluno;

import app.core.Conexao;
import static java.lang.System.out;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AlunoDAO {

    private Conexao db;

    public AlunoDAO() {
        db = new Conexao();
        db.abrirConexao();
    }

    public void adicionarAluno(AlunoBean aluno) throws SQLException {
        
        PreparedStatement ps;
        String sql;

        sql = ("INSERT INTO aluno "
                + "(nome, conjuge, cpf, telefone, email, cep, cidade, estado, endereco, numero, obs) VALUES "
                + "(   ?,       ?,   ?,        ?,     ?,   ?,      ?,      ?,        ?,      ?,   ?)"
            );

        ps = db.getConn().prepareStatement(sql);
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
    
    public void editarAluno(AlunoBean aluno) throws SQLException {
        
        PreparedStatement ps;
        String sql;
        sql = ("UPDATE aluno set "
                + "nome = ?, conjuge = ?, cpf = ?, telefone = ?, email = ?, cep = ?, cidade = ?, "
                + "estado = ?, endereco = ?, numero = ?, obs = ?  "
                + "WHERE codigo=?"
            );
        
            ps = db.getConn().prepareStatement(sql);
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
            ps.setInt(12, aluno.getCodigo());
            ps.executeUpdate();        
        
    }


    public List<AlunoBean> listarAlunos(String busca) throws SQLException {
        List<AlunoBean> alunos = new ArrayList<>();
        try {
            String sql = busca;

            PreparedStatement ps = db.getConn().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                AlunoBean aluno = new AlunoBean();
                aluno.setCodigo(rs.getInt("codigo"));
                aluno.setNome(rs.getString("nome"));
                aluno.setCpf(rs.getString("cpf"));
                aluno.setEmail(rs.getString("email"));
                aluno.setTelefone(rs.getString("telefone"));
                alunos.add(aluno);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }      
        return alunos;
    }

}

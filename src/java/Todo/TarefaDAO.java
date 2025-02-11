package Todo;

import app.core.Conexao;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class TarefaDAO {
    
    private Conexao db;
    
    public TarefaDAO() {
        db = new Conexao();
        db.abrirConexao();
    }
    
    public void adicionarTarefa(TarefaBean tarefa) throws SQLException {
        PreparedStatement ps;
        String sql;
        
        sql = (
                "INSERT INTO todo "
                + "(tarefa, data, ativa) VALUES (?,?,?)"
            );
        
        ps = db.getConn().prepareStatement(sql);
        ps.setString(1, tarefa.getTarefa());
        ps.setDate(2, (Date) tarefa.getData());
        ps.setInt(3, tarefa.getAtiva());
        ps.executeUpdate();
    }
    
    public List<TarefaBean> listarTarefas(String busca) throws SQLException {
        List<TarefaBean> tarefas = new ArrayList<>();
        try {
            String sql = busca;

            PreparedStatement ps = db.getConn().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                TarefaBean tarefa = new TarefaBean();
                tarefa.setTarefa(rs.getString("tarefa"));
                tarefa.setData(rs.getDate("data"));
                tarefa.setAtiva(rs.getInt("ativa"));
                tarefas.add(tarefa);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }      
        return tarefas;
    }    
    
}

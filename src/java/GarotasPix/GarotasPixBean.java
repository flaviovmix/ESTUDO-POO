package GarotasPix;

public class GarotasPixBean extends Pessoa.Pessoa{
    private String diretorio;

    public String getDiretorio() {
        return diretorio;
    }

    public void setDiretorio(String diretorio) {
        this.diretorio = diretorio;
    }
    
    private String cor_pele;
    private String cor_olhos;
    private String cor_cabelo;
    private String estilo_cabelo;
    private String tatuagem;
    
    public String getCor_pele() {
        return cor_pele;
    }

    public void setCor_pele(String cor_pele) {
        this.cor_pele = cor_pele;
    }

    public String getCor_olhos() {
        return cor_olhos;
    }

    public void setCor_olhos(String cor_olhos) {
        this.cor_olhos = cor_olhos;
    }

    public String getCor_cabelo() {
        return cor_cabelo;
    }

    public void setCor_cabelo(String cor_cabelo) {
        this.cor_cabelo = cor_cabelo;
    }

    public String getEstilo_cabelo() {
        return estilo_cabelo;
    }

    public void setEstilo_cabelo(String estilo_cabelo) {
        this.estilo_cabelo = estilo_cabelo;
    }

    public String getTatuagem() {
        return tatuagem;
    }

    public void setTatuagem(String tatuagem) {
        this.tatuagem = tatuagem;
    }
}

package Pessoa;

import java.time.LocalTime;
import java.util.Date;

public class Pessoa {

    private int ativo;
    private int codigo;
    private String nome;
    
    private String primeiroNomeOuApelido;
    private String usuario;
    private String email;
    private String password;
    
    private String especie;
    private String cor_principal;
    private String personalidade;
    private String papel; // heroi ou viao
    private int nivel_energia;
    private int forca;
    private int inteligencia;
    private int velocidade;
    private int acessorio;
    private String frase_de_efeito;
    
    private String nomeArquivo;
    private String thumb;
    private String nacionalidade;
    private String pais;
    private String orientacaoSexual;
    private String estadoCivil;
    private double peso;
    private double quadil;
    private double cintura;
    private double busto;
    private double altura;
    private String hobbie;
    private int quant_filhos;
    private double valor_mensalidade;
    private LocalTime hora_aula;
    private Date matriculado_em;
    private Date data_do_registro;
    private String telefone;
    private double salario;
    private String cep;
    private String cidade;
    private String estado;
    private String endereco;
    private String numero;
    private Date data_nascimento;
    private Date ultimo_acesso;
    private int matricula;
    private String pai;
    private String mae;
    private String turma;
    private String serie;
    private int ano;
    private String conjuge;
    private String cpf;
    private String religiao;
    private String raca_cor;
    private String formacaoAcademica;
    private String obs;

    public int getAtivo() {
        return ativo;
    }

    public void setAtivo(int ativo) {
        this.ativo = ativo;
    }
    
    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getPrimeiroNomeOuApelido() {
        return primeiroNomeOuApelido;
    }

    public void setPrimeiroNomeOuApelido(String primeiroNomeOuApelido) {
        this.primeiroNomeOuApelido = primeiroNomeOuApelido;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEspecie() {
        return especie;
    }

    public void setEspecie(String especie) {
        this.especie = especie;
    }

    public String getCor_principal() {
        return cor_principal;
    }

    public void setCor_principal(String cor_principal) {
        this.cor_principal = cor_principal;
    }

    public String getPersonalidade() {
        return personalidade;
    }

    public void setPersonalidade(String personalidade) {
        this.personalidade = personalidade;
    }

    public String getPapel() {
        return papel;
    }

    public void setPapel(String papel) {
        this.papel = papel;
    }

    public int getNivel_energia() {
        return nivel_energia;
    }

    public void setNivel_energia(int nivel_energia) {
        this.nivel_energia = nivel_energia;
    }

    public int getForca() {
        return forca;
    }

    public void setForca(int forca) {
        this.forca = forca;
    }

    public int getInteligencia() {
        return inteligencia;
    }

    public void setInteligencia(int inteligencia) {
        this.inteligencia = inteligencia;
    }

    public int getVelocidade() {
        return velocidade;
    }

    public void setVelocidade(int velocidade) {
        this.velocidade = velocidade;
    }

    public int getAcessorio() {
        return acessorio;
    }

    public void setAcessorio(int acessorio) {
        this.acessorio = acessorio;
    }

    public String getFrase_de_efeito() {
        return frase_de_efeito;
    }

    public void setFrase_de_efeito(String frase_de_efeito) {
        this.frase_de_efeito = frase_de_efeito;
    }

    public String getThumb() {
        return thumb;
    }

    public void setThumb(String thumb) {
        this.thumb = thumb;
    }
    
    
    
    
    
    

    public String getNomeArquivo() {
        return nomeArquivo;
    }

    public void setNomeArquivo(String nomeArquivo) {
        this.nomeArquivo = nomeArquivo;
    }

    public String getNacionalidade() {
        return nacionalidade;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public void setNacionalidade(String nacionalidade) {
        this.nacionalidade = nacionalidade;
    }

    public String getOrientacaoSexual() {
        return orientacaoSexual;
    }

    public void setOrientacaoSexual(String orientacaoSexual) {
        this.orientacaoSexual = orientacaoSexual;
    }

    public String getEstadoCivil() {
        return estadoCivil;
    }

    public void setEstadoCivil(String estadoCivil) {
        this.estadoCivil = estadoCivil;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    public double getQuadil() {
        return quadil;
    }

    public void setQuadil(double quadil) {
        this.quadil = quadil;
    }

    public double getCintura() {
        return cintura;
    }

    public void setCintura(double cintura) {
        this.cintura = cintura;
    }

    public double getBusto() {
        return busto;
    }

    public void setBusto(double busto) {
        this.busto = busto;
    }

    public double getAltura() {
        return altura;
    }

    public void setAltura(double altura) {
        this.altura = altura;
    }

    public String getHobbie() {
        return hobbie;
    }

    public void setHobbie(String hobbie) {
        this.hobbie = hobbie;
    }

    public int getQuant_filhos() {
        return quant_filhos;
    }

    public void setQuant_filhos(int quant_filhos) {
        this.quant_filhos = quant_filhos;
    }

    public double getValor_mensalidade() {
        return valor_mensalidade;
    }

    public void setValor_mensalidade(double valor_mensalidade) {
        this.valor_mensalidade = valor_mensalidade;
    }

    public LocalTime getHora_aula() {
        return hora_aula;
    }

    public void setHora_aula(LocalTime hora_aula) {
        this.hora_aula = hora_aula;
    }

    public Date getMatriculado_em() {
        return matriculado_em;
    }

    public void setMatriculado_em(Date matriculado_em) {
        this.matriculado_em = matriculado_em;
    }

    public Date getData_do_registro() {
        return data_do_registro;
    }

    public void setData_do_registro(Date data_do_registro) {
        this.data_do_registro = data_do_registro;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public Date getData_nascimento() {
        return data_nascimento;
    }

    public void setData_nascimento(Date data_nascimento) {
        this.data_nascimento = data_nascimento;
    }

    public Date getUltimo_acesso() {
        return ultimo_acesso;
    }

    public void setUltimo_acesso(Date ultimo_acesso) {
        this.ultimo_acesso = ultimo_acesso;
    }
    
    

    public int getMatricula() {
        return matricula;
    }

    public void setMatricula(int matricula) {
        this.matricula = matricula;
    }

    public String getPai() {
        return pai;
    }

    public void setPai(String pai) {
        this.pai = pai;
    }

    public String getMae() {
        return mae;
    }

    public void setMae(String mae) {
        this.mae = mae;
    }

    public String getTurma() {
        return turma;
    }

    public void setTurma(String turma) {
        this.turma = turma;
    }

    public String getSerie() {
        return serie;
    }

    public void setSerie(String serie) {
        this.serie = serie;
    }

    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }

    public String getConjuge() {
        return conjuge;
    }

    public void setConjuge(String conjuge) {
        this.conjuge = conjuge;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getReligiao() {
        return religiao;
    }

    public void setReligiao(String religiao) {
        this.religiao = religiao;
    }

    public String getRaca_cor() {
        return raca_cor;
    }

    public void setRaca_cor(String raca_cor) {
        this.raca_cor = raca_cor;
    }

    public String getFormacaoAcademica() {
        return formacaoAcademica;
    }

    public void setFormacaoAcademica(String formacaoAcademica) {
        this.formacaoAcademica = formacaoAcademica;
    }

    public String getObs() {
        return obs;
    }

    public void setObs(String obs) {
        this.obs = obs;
    }

    
    

    
}
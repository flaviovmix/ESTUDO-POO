package MontarCard;

import Vegetal.VegetalBean;

public class Nascionalidade {
    
    public static String gerar(VegetalBean bean) {
        
        StringBuilder sb = new StringBuilder();
        
        sb.append("<div class='img-nome-personagem'>");
            sb.append("<img class='bandeira ativo' src='../../assets/" + bean.getDiretorio() + "/" + bean.getPais() + ".png' />");
            sb.append("<img class='imagem-circular ativo' src='../../assets/" + bean.getDiretorio() + "/r-" + bean.getNomeArquivo() + ".png' alt='' />");
            sb.append("<div><h2 class='ativo'>Mandioca</h2><p class='ativo'>Brasileira</p></div>");
        sb.append("</div>");
        
        return sb.toString();
    }
    
}
package MontarCard;

import GarotasPix.GarotasPixBean;
//import Vegetal.VegetalBean;

public class Nascionalidade {
    
    public static String gerar(GarotasPixBean bean) {
        
        StringBuilder sb = new StringBuilder();
        
        sb.append("<div class='img-nome-personagem'>");
            sb.append("<img class='bandeira ativo' src='../../assets/" + bean.getDiretorio() + "/" + bean.getPais() + ".png' />");
            sb.append("<img class='imagem-circular ativo' src='../../assets/" + bean.getDiretorio() + "/r-" + bean.getNomeArquivo() + ".png' alt='' />");
            sb.append("<div><h2 class='ativo'>" + bean.getTatuagem() + "</h2><p class='ativo'>" + bean.getNacionalidade() + "</p></div>");
        sb.append("</div>");
        
        return sb.toString();
    }
    
}
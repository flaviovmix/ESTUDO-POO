package MontarCard;

import GarotasPix.GarotasPixBean;
//import Vegetal.VegetalBean;

class LinksParaFases {

    public static String gerar(GarotasPixBean bean) {
        
        StringBuilder sb = new StringBuilder();
        
            sb.append("<div class='area-estrelas'>");
                sb.append("<a href='#'>");
                    sb.append("<img class='ativo' src='../../assets/img/emoje-1.png' />");
                sb.append("</a>");

                sb.append("<a href='#'>");
                    sb.append("<img class='ativo' src='../../assets/img/emoje-2.png' />");
                sb.append("</a>");

                sb.append("<a href='#'>");
                    sb.append("<img class='ativo' src='../../assets/img/emoje-3.png' />");
                sb.append("</a>");

                sb.append("<a href='#'>");
                    sb.append("<img class='ativo' src='../../assets/img/emoje-4.png' />");
                sb.append("</a>");

                sb.append("<a href='#'>");
                    sb.append("<img class='ativo' src='../../assets/img/emoje-5.png' />");
                sb.append("</a>");

            sb.append("</div>");
        
        return sb.toString();
    }
    
}

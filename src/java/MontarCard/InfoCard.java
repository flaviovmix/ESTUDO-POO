package MontarCard;

import Vegetal.VegetalBean;

public class InfoCard {
    public static String InfoCard(VegetalBean vegetal, String diretorio) {
        
        StringBuilder sb = new StringBuilder();
        
        sb.append("<div class= 'info-personagem'>");
            sb.append(EscolherThumb.gerarThumb(vegetal, diretorio));
        sb.append("</div>");
        
        
        return sb.toString();
    }
}

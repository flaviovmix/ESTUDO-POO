package MontarCard;

import Vegetal.VegetalBean;

public class InfoCard {
    public static String InfoCard(VegetalBean bean) {
        
        StringBuilder sb = new StringBuilder();
        
        sb.append("<div class= 'info-personagem'>");
            sb.append(EscolherThumb.gerarThumb(bean));
        sb.append("</div>");
        
        
        return sb.toString();
    }
}

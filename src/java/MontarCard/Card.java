package MontarCard;

import Vegetal.VegetalBean;

public class Card {
    public static String DesenharCard(VegetalBean bean) {
        
        StringBuilder sb = new StringBuilder();
        sb.append("<div class='card'>");
            
            sb.append(AreaImagemInfo.imgInfo(bean));
            
            sb.append("<div class='area-links'>");
                sb.append("");
            sb.append("</div>");
            
        sb.append("</div>");
        
        return sb.toString();
        
    }
}

package MontarCard;

import Vegetal.VegetalBean;

public class InfoCard {
    public static String InfoCard(VegetalBean bean) {
        
        StringBuilder sb = new StringBuilder();
        
        sb.append("<div class= 'info-personagem'>");
            
            sb.append(Thumb.gerarThumb(bean));
            sb.append(Nascionalidade.gerar(bean));
            
        sb.append("</div>");
        
        return sb.toString();
    }
    
}


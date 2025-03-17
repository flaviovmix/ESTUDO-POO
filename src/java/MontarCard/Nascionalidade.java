package MontarCard;

import Vegetal.VegetalBean;

public class Nascionalidade {
    
    public static String gerar(VegetalBean bean) {
        
        StringBuilder sb = new StringBuilder();
        
        sb.append("<div class='img-nome-personagem'>");
            
            sb.append(Bandeira.gerar(bean));
            
        sb.append("</div>");
        
        return sb.toString();
    }
    
}
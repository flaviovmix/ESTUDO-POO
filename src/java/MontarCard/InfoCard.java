package MontarCard;

import GarotasPix.GarotasPixBean;
//import Vegetal.VegetalBean;

public class InfoCard {
    public static String InfoCard(GarotasPixBean bean) {
        
        StringBuilder sb = new StringBuilder();
        
        sb.append("<div class= 'info-personagem'>");
            
            sb.append(Thumb.gerarThumb(bean));
            sb.append(Nascionalidade.gerar(bean));
            sb.append(TabelaDados.gerar(bean));
            
            sb.append("<h3 class='ativo'>")
                .append(bean.getTatuagem())
              .append("</h3>");
            
        sb.append("</div>");
        
        return sb.toString();
    }
    
}


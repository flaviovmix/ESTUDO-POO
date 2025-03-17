package MontarCard;

import Vegetal.VegetalBean;

public class Card {
    
    public static String DesenharCard(VegetalBean bean) {
        //SE FOR CRIAR UM CAST AQUI PARA NÃO CHEGAR SOMENTE VEGETA
        //PRECISO APRENDER A FAZER
        StringBuilder sb = new StringBuilder();
        sb.append("<div class='card'>");
            
            sb.append(ImagemInfo.imgInfo(bean));
            
            sb.append("<div class='area-links'>");
                sb.append(LinksParaFases.gerar(bean));
            sb.append("</div>");
            
        sb.append("</div>");
        
        return sb.toString();
        
    }
}

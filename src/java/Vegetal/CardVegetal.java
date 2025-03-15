package Vegetal;

import DesenharCard.EscolherThumb;
import DesenharCard.ImagemPrincipal;


public class CardVegetal {
    public static String gerarCard(VegetalBean vegetal) {
        
        String imagemCard = vegetal.getNomeArquivo() + "." + vegetal.getThumb();
        StringBuilder classesimagemCard =  new StringBuilder();
        classesimagemCard.append("area-img-info");
                
        StringBuilder sb = new StringBuilder();
        sb.append("<div class='card'>");
        sb.append("<div class= " + classesimagemCard.toString() + ">");
        
            sb.append(ImagemPrincipal.SetImagem(imagemCard));
            
            sb.append("<div class= 'info-personagem'>");
                sb.append(EscolherThumb.gerarThumb());
            sb.append("</div>");
            
        sb.append("</div>");
        sb.append("<div class='area-links'>");
        sb.append("</div>");
        sb.append("</div>");
        
        
        return sb.toString();
        
    }    
}

package MontarCard;

import Vegetal.VegetalBean;

public class AreaImagemInfo {
    public static String imgInfo(VegetalBean vegetal, String diretorio) {
            
        StringBuilder sb = new StringBuilder();
        sb.append("<div class= 'area-img-info'>");

            sb.append(ImagemPrincipal.SetImagem(vegetal, diretorio));
            
            sb.append(InfoCard.InfoCard(vegetal, diretorio));

        sb.append("</div>");
            
        return sb.toString();
                    
    }
    

    
    
}

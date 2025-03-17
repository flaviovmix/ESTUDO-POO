package MontarCard;

import Vegetal.VegetalBean;

public class ImagemInfo {
    public static String imgInfo(VegetalBean bean) {
            
        StringBuilder sb = new StringBuilder();
        sb.append("<div class= 'area-img-info'>");

            sb.append(ImagemPrincipal.SetImagem(bean));
            
            sb.append(InfoCard.InfoCard(bean));

        sb.append("</div>");
            
        return sb.toString();
                    
    }
    

    
    
}

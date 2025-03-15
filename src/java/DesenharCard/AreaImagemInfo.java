package DesenharCard;

public class AreaImagemInfo {
    public static String imgInfo(String img, String diretorio, String pais) {
            
        StringBuilder sb = new StringBuilder();
        sb.append("<div class= 'area-img-info'>");

            sb.append(ImagemPrincipal.SetImagem(img, diretorio));
            
            sb.append(InfoCard.InfoCard(diretorio, pais));

        sb.append("</div>");
            
        return sb.toString();
                    
    }
    

    
    
}

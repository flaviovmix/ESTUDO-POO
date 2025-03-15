package DesenharCard;

public class Card {
    public static String DesenharCard(String img, String diretorio, String pais) {
        
        StringBuilder sb = new StringBuilder();
        sb.append("<div class='card'>");
            
            sb.append(AreaImagemInfo.imgInfo(img, diretorio, pais));
            
            sb.append("<div class='area-links'>");
                sb.append("");
            sb.append("</div>");
            
        sb.append("</div>");
        
        return sb.toString();
        
    }
}

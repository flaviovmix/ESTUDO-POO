package DesenharCard;

public class InfoCard {
    public static String InfoCard(String diretorio, String pais) {
        
        StringBuilder sb = new StringBuilder();
        
        sb.append("<div class= 'info-personagem'>");
            sb.append(EscolherThumb.gerarThumb(diretorio, pais));
        sb.append("</div>");
        
        
        return sb.toString();
    }
}

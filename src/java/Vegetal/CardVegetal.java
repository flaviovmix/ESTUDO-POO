package Vegetal;

public class CardVegetal {
    public static String gerarCard(VegetalBean vegetal) {
        StringBuilder sb = new StringBuilder();
        sb.append("<div class='card'>");
        sb.append("<div class='area-img-info'>");
        sb.append("<img src='../../assets/img/" + vegetal.getNomeArquivo() + "." + vegetal.getThumb() + ".png" + "' alt='" + vegetal.getNome() + "'>");
        sb.append("<p>" + vegetal.getNome() + "</p>");
        sb.append("</div>");
        sb.append("<div class='area-links'>");
        sb.append("</div>");
        sb.append("</div>");
        return sb.toString();
    }    
}

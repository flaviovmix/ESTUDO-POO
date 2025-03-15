package DesenharCard;

public class EscolherThumb {
        public static String gerarThumb() {
        
        StringBuilder sb = new StringBuilder();

                sb.append("<div class='ecolha-thumb'>");
                
                    sb.append("<a href='#'>");
                        sb.append("<img class='img-principal ativo' src='../../assets/img/t-1.png' />");
                    sb.append("</a>");
                    
                    sb.append("<a href='#'>");
                        sb.append("<img class='img-principal ativo' src='../../assets/img/t-2.png' />");
                    sb.append("</a>");
                    
                    sb.append("<a href='#'>");
                        sb.append("<img class='img-principal ativo' src='../../assets/img/t-3.png' />");
                    sb.append("</a>");
                    
                    sb.append("<a href='#'>");
                        sb.append("<img class='img-principal ativo' src='../../assets/img/t-4.png' />");
                    sb.append("</a>");
                    
                    sb.append("<a href='#'>");
                        sb.append("<img class='img-principal ativo' src='../../assets/img/t-5.png' />");
                    sb.append("</a>");
                    
                sb.append("</div>");
                  
        return sb.toString();
        
    }    
}

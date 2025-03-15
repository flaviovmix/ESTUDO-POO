
package DesenharCard;


public class ImagemPrincipal {
    
    public static String SetImagem(String img, String diretorio) {
        StringBuilder sb = new StringBuilder();

            sb.append("<img class='img-principal ativo' src='../../assets/"+ diretorio +"/" + img + ".png'" + " />");
                
        return sb.toString();
    }

    
}
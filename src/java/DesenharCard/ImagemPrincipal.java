
package DesenharCard;


public class ImagemPrincipal {
    
    public static String SetImagem(String img) {
        StringBuilder sb = new StringBuilder();

            sb.append("<img class='img-principal ativo' src='../../assets/img/" + img + ".png'" + " />");
                
        return sb.toString();
    }

    
}
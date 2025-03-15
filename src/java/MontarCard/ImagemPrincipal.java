
package MontarCard;

import Vegetal.VegetalBean;

public class ImagemPrincipal {
    
    public static String SetImagem(VegetalBean vegetal, String diretorio) {
        StringBuilder sb = new StringBuilder();

            sb.append("<img class='img-principal ativo'");
            sb.append("src='../../assets/"+ diretorio +"/");
            sb.append(vegetal.getNomeArquivo() + "." + vegetal.getThumb() +".png'" + " />");
            
        return sb.toString();
    }

}
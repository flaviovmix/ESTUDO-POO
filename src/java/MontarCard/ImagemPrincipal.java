
package MontarCard;

import GarotasPix.GarotasPixBean;
//import Vegetal.VegetalBean;

public class ImagemPrincipal {
    
    public static String SetImagem(GarotasPixBean bean) {
        StringBuilder sb = new StringBuilder();

            sb.append("<img class='img-principal img-principal-ativa'");
            sb.append("src='../../assets/"+ bean.getDiretorio() +"/");
            sb.append(bean.getNomeArquivo() + "." + bean.getThumb() +".png'" + " />");
            
        return sb.toString();
    }

}

package MontarCard;

import Vegetal.VegetalBean;

public class ImagemPrincipal {
    
    public static String SetImagem(VegetalBean bean) {
        StringBuilder sb = new StringBuilder();

            sb.append("<img class='img-principal ativo'");
            sb.append("src='../../assets/"+ bean.getDiretorio() +"/");
            sb.append(bean.getNomeArquivo() + "." + bean.getThumb() +".png'" + " />");
            
        return sb.toString();
    }

}
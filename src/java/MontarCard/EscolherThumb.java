package MontarCard;

import Vegetal.VegetalBean;

public class EscolherThumb {
        public static String gerarThumb(VegetalBean bean) {
        
        StringBuilder sb = new StringBuilder();

                sb.append("<div class='ecolha-thumb'>");
                
                    sb.append("<a href='#'>");
                        sb.append("<img class='img-principal ativo' src='../../assets/" + bean.getDiretorio() + "/t-1.png' />");
                    sb.append("</a>");
                    
                    sb.append("<a href='#'>");
                        sb.append("<img class='img-principal ativo' src='../../assets/" + bean.getDiretorio() + "/t-2.png' />");
                    sb.append("</a>");
                    
                    sb.append("<a href='#'>");
                        sb.append("<img class='img-principal ativo' src='../../assets/" + bean.getDiretorio() + "/t-3.png' />");
                    sb.append("</a>");
                    
                    sb.append("<a href='#'>");
                        sb.append("<img class='img-principal ativo' src='../../assets/" + bean.getDiretorio() + "/t-4.png' />");
                    sb.append("</a>");
                    
                    sb.append("<a href='#'>");
                        sb.append("<img class='img-principal ativo' src='../../assets/" + bean.getDiretorio() + "/t-5.png' />");
                    sb.append("</a>");
                    
                    sb.append("<img class='bandeira ativo' src='../../assets/" + bean.getDiretorio() + "/" + bean.getPais() + ".png' />" );
                    
                sb.append("</div>");
                  
        return sb.toString();
        
    }    
}

package MontarCard;

import Vegetal.VegetalBean;

public class TabelaDados {

    public static String gerar(VegetalBean bean) {
        
        StringBuilder sb = new StringBuilder();
        
        sb.append("<table class='ativo'>");

            sb.append("<tr>");
                sb.append("<td><strong>Escécie:</strong></td>");
                sb.append("<td>").append(bean.getEspecie()).append("</td>");
            sb.append("</tr>");
            sb.append("<tr>");
                sb.append("<td><strong>Personalidade:</strong></td>");
                sb.append("<td>").append(bean.getPersonalidade()).append("</td>");
            sb.append("</tr>");
            sb.append("<tr>");
                sb.append("<td><strong>Papel:</strong></td>");
                sb.append("<td>").append(bean.getPapel()).append("</td>");
            sb.append("</tr>");
            sb.append("<tr>");
                sb.append("<td><strong>Energia:</strong></td>");
                sb.append("<td>").append(bean.getEnergia()).append("</td>");
            sb.append("</tr>");
            sb.append("<tr>");
                sb.append("<td><strong>Inteligência:</strong></td>");
                sb.append("<td>").append(bean.getInteligencia()).append("</td>");
            sb.append("</tr>");
            sb.append("<tr>");
                sb.append("<td><strong>Velocidade:</strong></td>");
                sb.append("<td>").append(bean.getVelocidade()).append("</td>");
            sb.append("</tr>");
            sb.append("<tr>");
                sb.append("<td><strong>Acessório:</strong></td>");
                sb.append("<td>").append(bean.getAcessorio()).append("</td>");
            sb.append("</tr>");
            sb.append("<tr class='obs'>");
                sb.append("<td colspan='2' class='obs'>").append(bean.getObs()).append("</td>");
            sb.append("</tr>");

        sb.append("</table>");        
        
        return sb.toString();
    }
    
}

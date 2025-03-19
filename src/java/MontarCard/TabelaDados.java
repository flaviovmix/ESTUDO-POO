package MontarCard;

import GarotasPix.GarotasPixBean;
//import Vegetal.VegetalBean;

public class TabelaDados {

    public static String gerar(GarotasPixBean bean) {
        
        StringBuilder sb = new StringBuilder();
        
        sb.append("<table class='ativo'>");

            sb.append("<tr>");
                sb.append("<td><strong>Escécie:</strong></td>");
                sb.append("<td>").append(bean.getCor_cabelo()).append("</td>");
            sb.append("</tr>");
            sb.append("<tr>");
                sb.append("<td><strong>Personalidade:</strong></td>");
                sb.append("<td>").append(bean.getPersonalidade()).append("</td>");
            sb.append("</tr>");
            sb.append("<tr>");
                sb.append("<td><strong>Papel:</strong></td>");
                sb.append("<td>").append(bean.getCor_olhos()).append("</td>");
            sb.append("</tr>");
            sb.append("<tr>");
                sb.append("<td><strong>Energia:</strong></td>");
                sb.append("<td>").append(bean.getCor_pele()).append(" calorias</td>");
            sb.append("</tr>");
            sb.append("<tr>");
                sb.append("<td><strong>Inteligência:</strong></td>");
                sb.append("<td>").append(bean.getCor_cabelo()).append(" de QI</td>");
            sb.append("</tr>");
            sb.append("<tr>");
                sb.append("<td><strong>Velocidade:</strong></td>");
                sb.append("<td>").append(bean.getAltura()).append(" colheradas</td>");
            sb.append("</tr>");
            sb.append("<tr>");
                sb.append("<td><strong>Acessório:</strong></td>");
                sb.append("<td>").append(bean.getPeso()).append("</td>");
            sb.append("</tr>");
            sb.append("<tr class='obs'>");
                sb.append("<td colspan='2' class='obs'>").append(bean.getObs()).append("</td>");
            sb.append("</tr>");

        sb.append("</table>");        
        
        return sb.toString();
    }
    
}

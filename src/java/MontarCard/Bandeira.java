package MontarCard;

import Vegetal.VegetalBean;

public class Bandeira {
    public static String gerar(VegetalBean bean) {
        StringBuilder sb = new StringBuilder();
            sb.append("<img class='bandeira ativo' src='../../assets/");
            sb.append(bean.getDiretorio() + "/" + bean.getPais() + ".png' />" );
        return sb.toString();
    }
}
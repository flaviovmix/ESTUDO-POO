package Vegetal;

import GarotasPix.GarotasPixBean;
import GarotasPix.GarotasPixDAO;
import MontarCard.Card;
import java.util.List;


public class CardGarotaPix {
    
    public static String gerar() {
        String query = "SELECT * FROM garotaspixs";
        GarotasPixDAO dao = new GarotasPixDAO();
        List<GarotasPixBean> garotasPixs = dao.listarGarotasPix(query);
        
        StringBuilder cards = new StringBuilder();
        for (GarotasPixBean bean : garotasPixs) {
            cards.append(Card.DesenharCard(bean));
        }
        
        return cards.toString();
    }
}

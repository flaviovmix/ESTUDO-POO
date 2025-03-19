package GarotasPix;

import Vegetal.*;
import MontarCard.Card;
import java.util.List;

public class CardGarotasPixs {
    
    public static String gerar() {
        String query = "SELECT * FROM garotaspix";
        GarotasPixDAO dao = new GarotasPixDAO();
        List<GarotasPixBean> garotasPixs = dao.listarGarotasPix(query);
        
        StringBuilder cards = new StringBuilder();
        for (GarotasPixBean bean : garotasPixs) {
            cards.append(Card.DesenharCard(bean));
        }
        
        return cards.toString();
    }
}

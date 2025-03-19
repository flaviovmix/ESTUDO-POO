//package Vegetal;
//
//
//public class CardVegetais {
    
//    public static String gerar() {
//        String query = "SELECT * FROM vegetais";
//        GarotasPixDAO dao = new VegetalDAO();
//        List<VegetalBean> vegetais = dao.listarVegetais(query);
//        
//        StringBuilder cards = new StringBuilder();
//        for (VegetalBean bean : vegetais) {
//            cards.append(Card.DesenharCard(bean));
//        }
//        
//        return cards.toString();
//    }
//}

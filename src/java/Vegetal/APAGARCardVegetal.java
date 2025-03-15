package Vegetal;

import MontarCard.Card;

public class APAGARCardVegetal {
    public static String gerarCard(VegetalBean vegetal, String diretorio) {
        
        return Card.DesenharCard(vegetal, diretorio);
        
    }    
}

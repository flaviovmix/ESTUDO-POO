package Vegetal;

import DesenharCard.Card;

public class CardVegetal {
    public static String gerarCard(VegetalBean vegetal, String diretorio) {
        
        String imagemCard = vegetal.getNomeArquivo() + "." + vegetal.getThumb();
        String pais = vegetal.getPais();
        return Card.DesenharCard(imagemCard, diretorio, pais);
        
    }    
}

<%@page import="GarotasPix.CardGarotasPixs"%>
<%@page import="MontarCard.Card"%>
<%@page import="Vegetal.VegetalBean"%>
<%@page import="Vegetal.VegetalDAO"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html lang="pt-BR">
    
    <%@ include file="../../interface/headerVegetais.jsp" %>
    
    <body>
    
        <%@ include file="../../interface/navbarAzul.jsp" %>

        <main>

            <div id="estilo-card">
                <div  class="container-xl">
                    <%out.print(CardGarotasPixs.gerar());%>
                </div>
            </div>

        </main>

    </body>
</html>
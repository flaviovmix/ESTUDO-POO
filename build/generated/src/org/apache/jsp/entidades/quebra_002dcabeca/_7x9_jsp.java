package org.apache.jsp.entidades.quebra_002dcabeca;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class _7x9_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>Quebra-Cabeça</title>\n");
      out.write("    <style>\n");
      out.write("        body {\n");
      out.write("            display: flex;\n");
      out.write("            justify-content: center;\n");
      out.write("            align-items: center;\n");
      out.write("            height: 100vh;\n");
      out.write("            margin: 0;\n");
      out.write("            background-color: #f3f3f3;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        canvas {\n");
      out.write("            border: 2px solid #333;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        #game-container {\n");
      out.write("            position: relative;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .piece {\n");
      out.write("            position: absolute;\n");
      out.write("            cursor: grab;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("    <div id=\"game-container\">\n");
      out.write("        <canvas id=\"puzzleCanvas\" width=\"1700\" height=\"940\"></canvas>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <script>\n");
      out.write("        const canvas = document.getElementById(\"puzzleCanvas\");\n");
      out.write("        const ctx = canvas.getContext(\"2d\");\n");
      out.write("\n");
      out.write("        const rows = 1;\n");
      out.write("        const cols = 1;\n");
      out.write("\n");
      out.write("        const imageWidth = 700;\n");
      out.write("        const imageHeight = 900;\n");
      out.write("\n");
      out.write("        const pieceWidth = imageWidth / cols;\n");
      out.write("        const pieceHeight = imageHeight / rows;\n");
      out.write("\n");
      out.write("        const offsetXTarget = (canvas.width - imageWidth) / 2;\n");
      out.write("        const offsetYTarget = (canvas.height - imageHeight) / 2;\n");
      out.write("\n");
      out.write("        const image = new Image();\n");
      out.write("        image.src = \"C:\\ESTUDO-POO\\web\\assets\\pixel_ai\\personagens\\mai\\1\\1.png\"; // imagem de 700x900\n");
      out.write("\n");
      out.write("        let pieces = [];\n");
      out.write("        let draggingPiece = null;\n");
      out.write("        let offsetX, offsetY;\n");
      out.write("\n");
      out.write("        class Piece {\n");
      out.write("            constructor(imgX, imgY, canvasX, canvasY) {\n");
      out.write("                this.imgX = imgX;\n");
      out.write("                this.imgY = imgY;\n");
      out.write("                this.canvasX = canvasX;\n");
      out.write("                this.canvasY = canvasY;\n");
      out.write("                this.width = pieceWidth;\n");
      out.write("                this.height = pieceHeight;\n");
      out.write("                this.locked = false;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            draw() {\n");
      out.write("                ctx.drawImage(\n");
      out.write("                    image,\n");
      out.write("                    this.imgX,\n");
      out.write("                    this.imgY,\n");
      out.write("                    this.width,\n");
      out.write("                    this.height,\n");
      out.write("                    this.canvasX,\n");
      out.write("                    this.canvasY,\n");
      out.write("                    this.width,\n");
      out.write("                    this.height\n");
      out.write("                );\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            isClicked(x, y) {\n");
      out.write("                return (\n");
      out.write("                    !this.locked &&\n");
      out.write("                    x > this.canvasX &&\n");
      out.write("                    x < this.canvasX + this.width &&\n");
      out.write("                    y > this.canvasY &&\n");
      out.write("                    y < this.canvasY + this.height\n");
      out.write("                );\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            isInCorrectPosition() {\n");
      out.write("                const expectedX = this.imgX + offsetXTarget;\n");
      out.write("                const expectedY = this.imgY + offsetYTarget;\n");
      out.write("                return (\n");
      out.write("                    Math.abs(this.canvasX - expectedX) < 30 &&\n");
      out.write("                    Math.abs(this.canvasY - expectedY) < 30\n");
      out.write("                );\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            lockPosition() {\n");
      out.write("                this.canvasX = this.imgX + offsetXTarget;\n");
      out.write("                this.canvasY = this.imgY + offsetYTarget;\n");
      out.write("                this.locked = true;\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        function shuffle(array) {\n");
      out.write("            for (let i = array.length - 1; i > 0; i--) {\n");
      out.write("                const j = Math.floor(Math.random() * (i + 1));\n");
      out.write("                [array[i], array[j]] = [array[j], array[i]];\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        image.onload = function () {\n");
      out.write("            for (let row = 0; row < rows; row++) {\n");
      out.write("                for (let col = 0; col < cols; col++) {\n");
      out.write("                    pieces.push(\n");
      out.write("                        new Piece(\n");
      out.write("                            col * pieceWidth,\n");
      out.write("                            row * pieceHeight,\n");
      out.write("                            Math.random() * (canvas.width - pieceWidth),\n");
      out.write("                            Math.random() * (canvas.height - pieceHeight)\n");
      out.write("                        )\n");
      out.write("                    );\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            shuffle(pieces);\n");
      out.write("            drawAll();\n");
      out.write("        };\n");
      out.write("\n");
      out.write("        function drawAll() {\n");
      out.write("            ctx.clearRect(0, 0, canvas.width, canvas.height);\n");
      out.write("\n");
      out.write("            // Área de montagem exata (700x900)\n");
      out.write("            ctx.fillStyle = 'rgba(0, 0, 0, 0.1)';\n");
      out.write("            ctx.fillRect(offsetXTarget, offsetYTarget, imageWidth, imageHeight);\n");
      out.write("\n");
      out.write("            pieces.forEach(piece => piece.draw());\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        canvas.addEventListener(\"mousedown\", (e) => {\n");
      out.write("            const rect = canvas.getBoundingClientRect();\n");
      out.write("            const mouseX = e.clientX - rect.left;\n");
      out.write("            const mouseY = e.clientY - rect.top;\n");
      out.write("\n");
      out.write("            for (let i = pieces.length - 1; i >= 0; i--) {\n");
      out.write("                if (pieces[i].isClicked(mouseX, mouseY)) {\n");
      out.write("                    draggingPiece = pieces[i];\n");
      out.write("                    offsetX = mouseX - draggingPiece.canvasX;\n");
      out.write("                    offsetY = mouseY - draggingPiece.canvasY;\n");
      out.write("\n");
      out.write("                    pieces.splice(i, 1);\n");
      out.write("                    pieces.push(draggingPiece);\n");
      out.write("                    drawAll();\n");
      out.write("                    break;\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        });\n");
      out.write("\n");
      out.write("        canvas.addEventListener(\"mousemove\", (e) => {\n");
      out.write("            if (draggingPiece) {\n");
      out.write("                const rect = canvas.getBoundingClientRect();\n");
      out.write("                const mouseX = e.clientX - rect.left;\n");
      out.write("                const mouseY = e.clientY - rect.top;\n");
      out.write("\n");
      out.write("                draggingPiece.canvasX = mouseX - offsetX;\n");
      out.write("                draggingPiece.canvasY = mouseY - offsetY;\n");
      out.write("\n");
      out.write("                drawAll();\n");
      out.write("            }\n");
      out.write("        });\n");
      out.write("\n");
      out.write("        canvas.addEventListener(\"mouseup\", () => {\n");
      out.write("            if (draggingPiece) {\n");
      out.write("                if (draggingPiece.isInCorrectPosition()) {\n");
      out.write("                    draggingPiece.lockPosition();\n");
      out.write("                }\n");
      out.write("                draggingPiece = null;\n");
      out.write("                drawAll();\n");
      out.write("            }\n");
      out.write("        });\n");
      out.write("    </script>\n");
      out.write("</body>\n");
      out.write("\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

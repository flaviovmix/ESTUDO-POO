package funcoes;

public class icones {
    
    public static String editar() {

        StringBuilder svg = new StringBuilder();

        svg
            .append("<svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' class='bi bi-pencil-square' viewBox='0 0 16 16'>")
            .append("<path d='M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z'/>")
            .append("<path fill-rule='evenodd' d='M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z'/>")
            .append("</svg>")
        ;
        
        String svgContent = svg.toString();
        System.out.println(svgContent);
        
        return svgContent;
    }
    
    public static String deletar() {

        StringBuilder svg = new StringBuilder();

        svg
            .append("<svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' class='bi bi-trash' viewBox='0 0 16 16'>")
            .append("<path d='M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z'/>")
            .append("<path d='M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z'/>")
            .append("</svg>")
        ;
        
        String svgContent = svg.toString();
        System.out.println(svgContent);
        
        return svgContent;
    }

    public static String estrela() {

        StringBuilder svg = new StringBuilder();

        svg
            .append("<svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' class='bi bi-trash' viewBox='0 0 20 20'>")
            .append("<path d='M4.29981 16.125C3.91648 16.425 3.52481 16.4333 3.12481 16.15C2.72481 15.8666 2.59148 15.4916 2.72481 15.025L4.14981 10.4L0.524809 7.82498C0.124809 7.54164 0.00414245 7.16664 0.162809 6.69998C0.320809 6.23331 0.641476 5.99998 1.12481 5.99998H5.59981L7.04981 1.19998C7.13314 0.966642 7.26248 0.787309 7.43781 0.661976C7.61248 0.537309 7.79981 0.474976 7.99981 0.474976C8.19981 0.474976 8.38714 0.537309 8.56181 0.661976C8.73714 0.787309 8.86648 0.966642 8.94981 1.19998L10.3998 5.99998H14.8748C15.3581 5.99998 15.6791 6.23331 15.8378 6.69998C15.9958 7.16664 15.8748 7.54164 15.4748 7.82498L11.8498 10.4L13.2748 15.025C13.4081 15.4916 13.2748 15.8666 12.8748 16.15C12.4748 16.4333 12.0831 16.425 11.6998 16.125L7.99981 13.3L4.29981 16.125Z'/>")
            .append("</svg>")
        ;
        
        String svgContent = svg.toString();
        System.out.println(svgContent);
        
        return svgContent;
    }
    
    public static String chama() {

        StringBuilder svg = new StringBuilder();

        svg
            .append("<svg xmlns=\'http://www.w3.org/2000/svg\' width='20' height='20' viewBox=\"0 0 448 512\">")
            .append("<path d=\'M159.3 5.4c7.8-7.3 19.9-7.2 27.7 .1c27.6 25.9 53.5 53.8 77.7 84c11-14.4 23.5-30.1 37-42.9c7.9-7.4 20.1-7.4 28 .1c34.6 33 63.9 76.6 84.5 118c20.3 40.8 33.8 82.5 33.8 111.9C448 404.2 348.2 512 224 512C98.4 512 0 404.1 0 276.5c0-38.4 17.8-85.3 45.4-131.7C73.3 97.7 112.7 48.6 159.3 5.4zM225.7 416c25.3 0 47.7-7 68.8-21c42.1-29.4 53.4-88.2 28.1-134.4c-4.5-9-16-9.6-22.5-2l-25.2 29.3c-6.6 7.6-18.5 7.4-24.7-.5c-16.5-21-46-58.5-62.8-79.8c-6.3-8-18.3-8.1-24.7-.1c-33.8 42.5-50.8 69.3-50.8 99.4C112 375.4 162.6 416 225.7 416z\'/>")
            .append("</svg>")
        ;
        
        String svgContent = svg.toString();
        System.out.println(svgContent);
        
        return svgContent;
    }
    
    

}
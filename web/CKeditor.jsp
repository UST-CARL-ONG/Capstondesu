<%-- 
    Document   : CKeditor
    Created on : May 8, 2020, 12:07:05 PM
    Author     : JoshuaDC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CKEditor</title>
        <script src="js/ckeditor5-build-classic/ckeditor.js"></script>
    </head>
    <body>
        <h1>Hello World!</h1>
        <div id="editor"></div>
        <script>
            ClassicEditor
                    .create(document.querySelector('#editor'))
                    .catch (error => {
                        console.error(error);
                    });
        </script>
    </body>
</html>

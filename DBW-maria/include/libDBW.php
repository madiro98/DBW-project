<?php

function headerDBW($title) {
    return "<html lang=\"en\">
<head>
<meta charset=\"utf-8\">
    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
<title>$title</title>
       <!-- Bootstrap styles -->
    <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\" integrity=\"sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u\" crossorigin=\"anonymous\">
  
    <!-- IE 8 Support-->
    <!--[if lt IE 9]>
      <script src=\"https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js\"></script>
      <script src=\"https://oss.maxcdn.com/respond/1.4.2/respond.min.js\"></script>
    <![endif]--> 
        <link rel=\"stylesheet\" href=\"DataTable/jquery.dataTables.min.css\"/>
        <script type=\"text/javascript\" src=\"DataTable/jquery-2.2.0.min.js\"></script>
        <script type=\"text/javascript\" src=\"DataTable/jquery.dataTables.min.js\"></script>

</head>
<body bgcolor=\"#ffffff\">
<div class= \"container\">
<h1>Execution failed - $title</h1>
";
}

function footerDBW() {
    return '
        </div>
</body>
</html>';
}

function errorPage($title, $text) {
    return headerDBW($title) . $text . footerDBW();
}

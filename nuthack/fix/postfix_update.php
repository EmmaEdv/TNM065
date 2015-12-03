<?php 
    // spara content buffert skrivit ut till string och sedan rensa
    $xmlContetnStr = ob_get_contents();
    ob_end_clean();

    // ladd in contet i ett dom element
    $xml = new DOMDocument;
    $xml->loadXML($xmlContetnStr);
    
    // Skapa ett dom element för stylesheet
    $xsl = new DOMDocument;

    // kolla vilken user agent och sätt rätt styletsheet
    $UA = getenv('HTTP_USER_AGENT');
    if (preg_match("/iPhone/i", $UA)) 
    {
        header("Content-type:text/html;charset=utf-8");
        $xsl->load('view/update_view_mobile.xsl');
    } else {
        header("Content-type:text/html;charset=utf-8");
        $xsl->load('view/update_view.xsl');
    }

    // Make the transformation and print the result
    $proc = new XSLTProcessor;
    $proc->importStyleSheet($xsl); // attach the xsl rules
    echo utf8_decode($proc->transformToXML($xml));
?>
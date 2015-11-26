<?php 
    // spara content buffert skrivit ut till string och sedan rensa
    $xmlContetnStr = ob_get_contents();
    ob_end_clean();

    // ladd in contet i ett dom element
    $xml = new DOMDocument;
    $xml->loadXML($xmlContetnStr);
    
    // Skapa ett dom element för stylesheet
    $xsl = new DOMDocument;

    // TODO: kolla vilken user agent och sätt rätt styletsheet

    // skall bytas ut när ovan är löst
    header("Content-type:text/html;charset=utf-8");
    $xsl->load('main_view.xsl');

    // Make the transformation and print the result
    $proc = new XSLTProcessor;
    $proc->importStyleSheet($xsl); // attach the xsl rules
    echo utf8_decode($proc->transformToXML($xml));
    
?>
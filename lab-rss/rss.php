<?php header("Content-type:text/xml;charset=utf-8");?>
<rss version="2.0" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:atom="http://www.w3.org/2005/Atom">

	<channel>
	
	<title>Bokkatalog</title>
	<link>http://www.itn.liu.se/</link>
	<description>En bokkatalog.</description>
	<atom:link href="http://www.student.itn.liu.se/~phibu125/TNM065/lab-rss/rss.php" rel="self" type="application/rss+xml" />
    <dc:language>en</dc:language>
    <dc:publisher>LiU/ITN</dc:publisher>
    <dc:creator>Emma och Philip</dc:creator>

	
 <?php  
    // koppla upp mot databasen med med användarnamn "rsslab", utan lösenord
    $link = mysql_connect("mysql.itn.liu.se", "rsslab")
        or die("Could not connect");
    // välj databasen rsslab
    mysql_select_db("rsslab")
        or die("Could not select database");
	$returnstring_about ="";
	$currentDate=date("c");
	$returnstring_about = $returnstring_about . "<dc:date>$currentDate</dc:date>";
    // en sql-fråga som väljer ut alla rader sorterade fallande på år och vecka
    $query = "SELECT  *
            FROM bookcatalog
            ORDER BY publish_date DESC";

    // utför själva frågan. Om du har fel syntax får du felmeddelandet query failed
    $result = mysql_query($query)
        or die("Query failed");
        
    // loopa över alla resultatrader och skriv ut en motsvarande tabellrad
    while ($line = mysql_fetch_object($result)) {
        // lagra innehållet i en tabellrad i variabler
        $title = $line->title; 
        $link = $line->link;
        $author = $line->author;
        $description = $line->description;
        $title = preg_replace("/&/","&amp;", $title);
		$link = preg_replace("/&/","&amp;", $link);
		$link = preg_replace("/\s+/","%20;", $link);
		$description = preg_replace("/&/","&amp;", $description);
		$publish_date = date("c",strtotime($line->publish_date));
        // bygg upp en sträng innehållande det resultat vi vill ha
        // slå ihop två strängar med ".".	
        $returnstring_about = $returnstring_about . "<item><title>$title</title><guid>$link</guid><link>$link</link><description>$description</description><dc:creator>$author</dc:creator>"; 
        $returnstring_about = $returnstring_about . "<dc:date>$publish_date</dc:date></item>"; 
    }
    // koda för säkerhets skull om till utf-8 innan resultatet
    // skrivs ut.
	
	print utf8_encode($returnstring_about); 
?>
	</channel>
</rss>
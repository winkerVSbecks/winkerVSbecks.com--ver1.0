 <?php
	if ($_POST['Submit'])
{
echo "Thanks, your message has been sent.";



// This creates local PHP variables from the info the user gave in the form
$senderName   = $_POST['name'];
$senderEmail     = $_POST['email'];
$senderMessage = $_POST['message'];

// This cleans up the formatting of the variables
$senderName   = stripslashes($senderName);
$senderEmail     = stripslashes($senderEmail);
$senderMessage   = stripslashes($senderMessage); 


//!!!!!!!!!!!!!!!!!!!!!!!!!     change this to your email     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    $to = "varunvachhar@gmail.com";
//!!!!!!!!!!!!!!!!!!!!!!!!!     change this to your email     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



     // change this to reflect your site
    $from = "$senderEmail";
    $subject = "mail from winkerVSbecks";
	
    //Begin HTML Email Message
    $message = <<<EOF
<html>
  <body bgcolor="#FFFFFF">
<b>Name</b> = $senderName<br /><br />
<b>Email</b> = <a href="mailto:$senderEmail">$senderEmail</a><br /><br />
<b>Message</b> = $senderMessage<br />
  </body>
</html>
EOF;
   //end of message
    $headers  = "From: $from\r\n";
    $headers .= "Content-type: text/html\r\n";
    $to = "$to";

    mail($to, $subject, $message, $headers);
	
exit();
}
	?>

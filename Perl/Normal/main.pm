print "Enter string to encode:\n";
$to_encode = <STDIN>;
chomp $to_encode;
$to_encode =~ tr/a-mA-Mn-zN-Z/n-zN-Za-mA-M/;
print "Encoded string:\n$to_encode\n";

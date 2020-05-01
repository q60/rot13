<?php

echo "Enter string to encode: ";
$s = readline();

$s = str_split($s);
foreach($s as &$c) {
	$c = ord($c);
	if(ord('A') <= $c && $c <= ord('Z')) {
		$c = ($c - ord('A') + 13) % 26 + ord('A');
	}
	elseif(ord('a') <= $c && $c <= ord('z')) {
		$c = ($c - ord('a') + 13) % 26 + ord('a');
	}
	$c = chr($c);
}
$s = implode('', $s);

echo "Encoded string: $s\n";

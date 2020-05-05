#! /bin/bash
echo "Enter string to encode:";read TO_ENCODE;echo "Encoded string:";echo $TO_ENCODE|tr "[a-mn-zA-MN-Z]" "[n-za-mN-ZA-M]"

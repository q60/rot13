#! /bin/bash
echo "Enter string to encode:";read TO_ENCODE;echo -e "Encoded string:\n$(echo $TO_ENCODE|tr "[a-mn-zA-MN-Z]" "[n-za-mN-ZA-M]")"

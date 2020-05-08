'Enter string to encode:'
TOENCODE ← ⍞
BYTESVEC ← ⎕UCS TOENCODE
∇ ROTATE BYTESVEC
  'Encoded string:'
  ENCODED ← ''
  :For CHAR :In BYTESVEC
    :If CHAR≥97
      :If CHAR≤109
        ENCODED ← ENCODED, CHAR+13
      :Else
        :If CHAR≥110
          :If CHAR≤122
            ENCODED ← ENCODED, CHAR-13
          :EndIf
        :EndIf
      :EndIf
    :Else
      :If CHAR≥65
        :If CHAR≤77
          ENCODED ← ENCODED, CHAR+13
        :Else
          :If CHAR≥78
            :If CHAR≤90
              ENCODED ← ENCODED, CHAR-13
            :EndIf
          :EndIf
        :EndIf
      :EndIf
    :EndIf
  :EndFor
  ENCODEDSTRING ← ⎕UCS ENCODED
  ENCODEDSTRING
∇
ROTATE BYTESVEC
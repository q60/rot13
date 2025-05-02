⍝ This is a ROT13 encoding program in Dyalog APL
⍝ You can load this function using Dyalog interpreter entering this:
⍝ ⎕SE.SALT.Load 'main.dyalog'
⍝ or this:
⍝ ]load 'main.dyalog'
⍝ After this, the function will be loaded in environment and you will be able
⍝ to call it simply entering #.ROT13.ROTATE
:Namespace ROT13
  ∇ ROTATE
    'Enter string to encode:'
    BYTESVEC ← ⎕UCS ⍞
    'Encoded string:'
    ENCODED ← ''
    :For CHAR :In BYTESVEC
      :If (((CHAR≥97)∧(CHAR≤109))∨((CHAR≥65)∧(CHAR≤77)))
        ENCODED ← ENCODED, CHAR+13
      :ElseIf (((CHAR≥110)∧(CHAR≤122))∨((CHAR≥78)∧(CHAR≤90)))
        ENCODED ← ENCODED, CHAR-13
      :Else
        ENCODED ← ENCODED, CHAR
      :EndIf
    :EndFor
    ENCODEDSTRING ← ⎕UCS ENCODED
    ENCODEDSTRING
  ∇
:EndNamespace

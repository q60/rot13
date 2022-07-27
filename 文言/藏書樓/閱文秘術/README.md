# 閱文秘術 stdin

Reads stdin.

# Usage

    吾嘗觀『閱文秘術』之書。方悟「閱行」「閱字」「閱白」「閱言」「閱數」「閱畢乎」之義。

Read line (returns string including EOL):

    閱一行。名之曰「子」。

Read character:

    閱一字。名之曰「丑」。

Scan whitespace (returns string but mostly useless):

    閱一白。噫。

Scan whitespace-terminated word:

    閱一言。名之曰「寅」。

Scan JSON number:

    閱一數。名之曰「卯」。

(to read Hanzi-based numbers, use [解析整數].)

Scan multiple values at a time (up to 9):

    閱三數。名之曰「甲」曰「乙」曰「丙」。

The above methods return `undefined` on EOF or format mismatch. 

To test if EOF has been encountered:

    若已閱畢者。
      ...
    也。
    若未閱畢者。
      ...
    也。

[解析整數]: https://github.com/alainsaas/zh_parseint-wy/tree/master

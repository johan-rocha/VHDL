# Neste documento, encontra-se as formulas da seguinte tabela verdade:

|p0|p1|p2|p3  |  x1|x2|int|
|1 |X |X |X   |  0 |0 |1  |
|0 |1 |X |X   |  0 |1 |1  |
|0 |0 |1 |X   |  1 |0 |1  |
|0 |0 |0 |1   |  1 |1 |1  |
|0 |0 |0 |0   |  1 |1 |0  |

`int = p0 or p1 or p2 or p3`

`x1 = ((not p0) and (not p1) and p2) or p3 or (not(p0 and p1 and p2 and p3))`

`x2 = ((not p0) and p1 and p2) or p3 or (not(p0 and p1 and p2 and p3))`
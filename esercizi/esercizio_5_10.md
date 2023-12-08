### Modificare il comparatore per numeri con segno della Figura 5.12 in modo che calcoli correttamente A < B per qualsiasi valore dei due numeri a N bit A e B.

Un modo per far funzionare il comparatore anche in caso di overflow è sostituire al sottrattore un sommatore, in modo da poter prendere r_out, e fare la somma tra il primo numero e il secondo col complemento a due.

Il complemento di r_out sarà A < B.
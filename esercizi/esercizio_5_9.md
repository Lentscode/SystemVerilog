### Si consideri il comparatore per numeri con segno della Figura 5.12.

### (a) Mostrare un esempio di due numeri a 4 bit A e B per i quali un comparatore a 4 bit fornisce il corretto risultato per A < B.

Un esempio potrebbe essere A = 1101 e B = 0001. Questo perché A - B sarebbe 1101 + 1111 = 1100, con un 1 come overflow.

### (b) Mostrare un esempio di due numeri a 4 bit A e B per i quali un comparatore a 4 bit fornisce un risultato errato per A < B.

Un esempio potrebbe essere A = 1101 e B = 0111. Questo perché A - B sarebbe 1101 + 1001 = 0010, un numero positivo, il che significa che A > B, anche se non è vero.

### (c) In generale, quando un comparatore per numeri con segno a N bit non funziona correttamente?

In generale, quando i due numeri sono uno molto più piccolo dell'altro, questo causa la comparsa dell'overflow quando si va a fare la sottrazione. (?)
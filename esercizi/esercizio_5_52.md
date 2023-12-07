## La lingua italiana ha un buon livello di ridondanza che consente di ricostruire trasmissioni alterate. Anche i dati binari possono essere trasmessi utilizzando codifiche ridondanti per consentire la correzione di errori. Per esempio, il numero 0 potrebbe essere codificato 00000 e il numero 1 diventare 11111. Tali codifiche potrebbero poi essere trasmesse in un canale disturbato che potrebbe alterare il valore di uno o due bit. In queste ipotesi, il ricevitore sarebbe in grado di ricostruire il dato originale perché lo 0 avrebbe ancora almeno tre bit a 0, e l’1 almeno tre bit a 1.

### Proporre una codifica per spedire 00, 01, 10 o 11 usando cinque bit in modo tale che errori che modifichino un bit siano correggibili. Attenzione: le codifiche 00000 per 0 e 11111 per 1 non funzionano.

- La codifica ideata è la seguente: 00 → 00011, 01 → 11001, 10 → 10110, 11 → 01100. Questo perché vogliamo una distanza di Hemming maggiore di 3 tra tutte le codifiche. La distanza di Hemming è il numero di bit che cambiano tra un numero e l'altro.
Infatti, una volta ricevuto il numero modificato, ci sarà una codifica con una distanza di Hemming minore al numero modificato rispetto agli altri.

### Progettare un circuito che riceve un codice di cinque bit e restituisce uno dei quattro valori 00, 01, 10 o 11 anche in presenza di un bit errato.

- Il circuito sarà composto in questo modo: 

1) L'input entra in uno XOR con la codifica per vedere per quanti bit differiscono uno dall'altro.
2) Gli output degli XOR tra l'input e la codifica vengono sommati per calcolare la distanza di Hemming.
3) Si confrontano le distanze con dei comparatori per prendere la distanza minore, corrispondente alla codifica del numero originale.
Attori: Addetto alla sala

Scopo: Registrazione delle ordinazioni dei clienti

Precondizioni: L'addetto alla sala ha accesso al sistema di registrazione delle ordinazioni e conosce l'identificativo del tavolo di riferimento.

Flusso degli eventi:

1. L'addetto alla sala accede al sistema di registrazione delle ordinazioni.
2. L'addetto alla sala seleziona il tavolo di riferimento, inserendo il suo identificativo nel sistema.
3. Il sistema visualizza il menù disponibile per il tavolo selezionato.
4. L'addetto alla sala seleziona gli elementi del menù desiderati dall'utente.
5. L'addetto alla sala inserisce le eventuali note aggiuntive per ogni elemento selezionato (es. ingredienti da evitare, cottura preferita, ecc.).
6. L'addetto alla sala conferma l'ordinazione.

Postcondizioni: L'ordinazione viene registrata nel sistema e può essere visualizzata dagli altri membri del personale per la preparazione e la consegna del cibo.

A1: Identificativo del tavolo non valido
  1. Nel punto 3 del flusso principale, l'addetto alla sala inserisce un identificativo del tavolo non valido. 
  2. Il sistema mostra un messaggio di errore e richiede di inserire nuovamente l'identificativo del tavolo.
  3. Si ritorna al punto 3 del flusso principale.

A2: Elemento del menù non disponibile
  1. Nel punto 5 del flusso principale, l'addetto alla sala seleziona un elemento del menù che non è disponibile al momento dell'ordinazione.
  2. Il sistema mostra un messaggio di errore e richiede di selezionare nuovamente gli elementi del menù.
  3. Si ritorna al punto 4 del flusso principale.

A3: Annullamento dell'ordinazione
  1. In qualsiasi momento durante il flusso principale, l'addetto alla sala decide di annullare l'ordinazione.
  2. Il sistema annulla l'ordinazione e ritorna alla schermata principale.

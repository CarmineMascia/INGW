Titolo del caso d'uso
Un addetto alla cucina (o un amministratore, o un supervisore) possono associare, a ciascun elemento presente nel menù, un elenco di ingredienti presenti in dispensa necessari alla preparazione. Per ciascun ingrediente, è necessario indicare la quantità necessaria alla preparazione.

Attori principali

Addetto alla cucina: persona responsabile di preparare i piatti.
Amministratore: persona responsabile di gestire il sistema e le informazioni ad esso associate.
Supervisore: persona responsabile di supervisionare il lavoro dell'addetto alla cucina.
Pre-condizioni

L'attore ha accesso al sistema di gestione del menù e degli ingredienti in dispensa.
Post-condizioni

Il menù viene associato all'elenco degli ingredienti necessari alla preparazione.
Flusso principale

1. L'attore seleziona la funzione "gestisci menù" nel sistema.
2. Il sistema mostra l'elenco dei piatti presenti nel menù.
3. L'attore seleziona un piatto.
4. Il sistema mostra l'elenco degli ingredienti necessari alla preparazione del piatto.
5. L'attore associa un elenco di ingredienti in dispensa necessari alla preparazione del piatto.
6. L'attore indica la quantità necessaria di ciascun ingrediente per la preparazione del piatto.
7. L'attore conferma le modifiche al menù nel sistema.
8. Il sistema aggiorna il menù e l'elenco degli ingredienti necessari alla preparazione del piatto.

Flussi alternativi
A1: Quantità di ingredienti non valida
1. Nel punto 6 del flusso principale, l'attore inserisce una quantità di ingredienti non valida.
2. Il sistema mostra un messaggio di errore e richiede di inserire nuovamente la quantità necessaria per ciascun ingrediente.
3. Si ritorna al punto 6 del flusso principale.

A2: Ingrediente non disponibile in dispensa
1. Nel punto 5 del flusso principale, l'attore associa un ingrediente non disponibile in dispensa per la preparazione del piatto.
2. Il sistema mostra un messaggio di errore e richiede di selezionare un ingrediente disponibile in dispensa.
3. Si ritorna al punto 5 del flusso principale.

A3: Annullamento delle modifiche al menù
1. In qualsiasi momento durante il flusso principale, l'attore decide di annullare le modifiche al menù.
2. Il sistema annulla le modifiche e ritorna alla schermata principale.

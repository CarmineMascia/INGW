# INGW

Ratatouille23 è  un   sistema  finalizzato  al  supporto  alla  gestione  e  all’operatività  di  attività  di ristorazione. Il sistema consiste in un’applicazione performante e affidabile,  attraverso  cui  gli  utenti possono fruire delle funzionalità del sistema in modo intuitivo, rapido e piacevole. Le principali funzionalità offerte da Ratatouille23 sono indicate di seguito:


1. Un **amministratore** può **creare utenze** per i propri dipendenti (sia addetti alla sala, che addetti alla  cucina,  che  supervisori).  Al  primo  accesso,  ogni  utente  deve  re-impostare  la  password inserita dall’amministratore, scegliendo una password diversa.
3. Un **amministratore** (o un **supervisore**) può **personalizzare il menù** dell’attività di ristorazione. In particolare,  l’utente  può  creare  e/o  eliminare  elementi  dal  menù.  Ciascun  elemento  è caratterizzato da un nome, un costo, una descrizione, e un elenco di allergeni comuni. Inoltre, è possibile organizzare gli elementi del menù in categorie personalizzabili (e.g.: primi, dessert, primi di pesce, bibite, etc.), e definire l’ordine con cui gli elementi compaiono nel menù. In fase di  inserimento,  è  richiesto  l’autocompletamento    di    alcuni    prodotti    (e.g.:    bibite    o preconfezionati) utilizzando open data come quelli disponibili in https://it.openfoodfacts.org/data.
6. Un **addetto alla sala** può **registrare ordinazioni** indicando l’identificativo del tavolo egli elementi del menù desiderati.
8. Un **supervisore** può **visualizzare (in formato PDF) il conto** di ciascun tavolo in un determinato momento. Inoltre, quando gli avventori seduti ad un certo tavolo vanno via, il supervisore può chiudere il conto e visualizzare la versione finale da sottoporre al cliente.
9. Un  **addetto  alla  cucina**  (o  un  **supervisore**)  può  inoltre tenere traccia dell’**inventario della dispensa**. In particolare, l’utente può inserire/rimuovere prodotti dalla dispensa. Ciascun prodotto  è  caratterizzato  da  un  costo  di  acquisto,  da  un  nome,  da  una  descrizione,  e  da  una quantità (in Kg oppure in Litri, a seconda della tipologia di prodotto). In fase di inserimento, è apprezzato  l’autocompletamento  di  alcuni  prodotti  (e.g.:  bibite  o  altri  preconfezionati) utilizzando open data come quelli disponibili in https://it.openfoodfacts.org/data.
10. Un  **addetto  alla  cucina** (o  un  **amministratore**, o  un  **supervisore**)  possono  **associare**,  a  ciascun elemento  presente  nel  menù, **un  elenco  di  ingredienti**  presenti  in  dispensa  necessari  alla preparazione.  Per  ciascun  ingrediente,  è  necessario  indicare  la  quantità  necessaria  alla preparazione.
12. Quando  la  quantità  di  un  dato  prodotto  presente  in  dispensa  scende  al  di  sotto  di  una  certa soglia personalizzabile per ciascun prodotto, **il sistema invia un messaggio di avvertimento agli amministratori e ai supervisori**.
17. Un  **amministratore**  può  **visualizzare  statistiche** sugli introiti dell’attività di ristorazione. In particolare, dato un certo intervallo di tempo personalizzabile, è possibile visualizzare l’incasso medio, il valore medio di ciascun conto, l’incasso complessivo. È apprezzata la presenza di grafici interattivi.


In particolare, le funzionalità riservate al personale di sala e di cucina saranno fruite su tablet, mentre  le funzionalità  destinate  ad  amministratori  e  supervisori  saranno  fruite  principalmente  attraverso notebook o PC.Dal momento che l’hardware (tablet e notebook) non è stato ancora acquistato, si può assumere  che  su  entrambi  sia  installato  un  sistema  operativo  a  scelta  dei  contraenti  (e.g.:  Linux, Windows, Android, iOS, etc.).Dato  questo  insieme  di  funzionalità,  il  Committente  assegnerà  un  sottoinsieme non  negoziabiledi caratteristiche da modellare, implementare e verificare, tenendo in dovuta considerazione il numero di partecipanti al Gruppo di Lavoro contraente.

# Requisiti

Per le attività sopracitate, il Committente richiede i seguenti output:


- [ ] Documento dei Requisiti Software
  - [ ] Analisi dei Requisiti
    - [X] Modellazione di tutti i casi d'uso.
    - [ ] Individuazione del target degli utenti. (solo gruppi “Nuovo Ordinamento”)
    - [X] Descrizioni Testuali Strutturate per almeno quattro casi d’uso significativi (autenticazione esclusa) a scelta dei contraenti tra quelli richiesti.
    - [X] Prototipazione visuale via Mock-up dell’interfaccia utente per tutti i casi d’uso assegnati.Si raccomanda caldamente l’uso del tool “Figma”.
    - [ ] Valutazione dell’usabilità a priori. (solo gruppi “Nuovo Ordinamento”)
    - [ ] Glossario.
  - [ ] Specifica dei Requisiti.
    - [ ] Classi, oggetti e relazioni di analisi.
    - [ ] Diagrammi di sequenza di analisi per due casi d’uso significativi a scelta dei contraenti tra quelli assegnati.
    - [ ] Prototipazione funzionale via statechart dell’interfaccia grafica, relativamente ai casi d’uso individuati.
- [ ] Documento di Design del sistema.
  - [ ] Analisi dell’architettura con esplicita definizione dei criteri di design.
  - [ ] Descrizione/motivazione delle scelte tecnologiche adottate.
  - [ ] Diagramma delle classi di design.
  - [ ] Diagrammi di sequenza di design per i casi d’uso identificati al punto 1.a.iii.
- [ ] Codice Sorgente sviluppato, comprensivo di eventuale Dockerfile.
- [ ] Testing e valutazione sul campo dell’usabilità.
  - [ ] Codice xUnit per unit testingdi quattro metodi non banali, che abbiano almeno due parametri.In aggiunta al codice, una apposita sezione della documentazione deve descrivere le strategie adottate per la progettazione dei test dei duemetodi (e.g.: classi di equivalenza individuate e coperte, criteri di copertura strutturale, etc.).
  - [ ] Valutazione dell’usabilità sul campo, realizzata sul prodotto finito sia con tecniche simili a quelle messe in atto al punto 1.a.v, sia mediante analisi di file di log. È necessario allegare anche i file di log utilizzati nell’analisi. (solo gruppi “Nuovo Ordinamento”)
  
Si  noti  che  i  Punti  1,  2  e  4  vanno  realizzati  come  un  unico  documento,  di  seguito  indicato  come “documentazione”.


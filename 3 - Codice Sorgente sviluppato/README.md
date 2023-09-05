## Versions
- **python-version**: Python 3.11.4
- **django-version**: Django 4.2.1
- **postgres-version**: PostgreSQL 15.3 (Homebrew) on aarch64-apple-darwin22.4.0, compiled by Apple clang version 14.0.3 (clang-1403.0.22.14.1), 64-bit

## TODO 
- Un **amministratore** può **creare utenze** per i propri dipendenti (sia addetti alla sala, che addetti alla cucina, che supervisori). Al **primo accesso**, ogni utente deve **re-impostare la password** inserita dall’amministratore, scegliendo una password diversa.
- Un **amministratore** (o un **supervisore**) può **personalizzare il menù** dell’attività di ristorazione. In particolare, l’utente può creare e/o eliminare elementi dal menù. Ciascun elemento è caratterizzato da un nome, un costo, una descrizione, e un elenco di allergeni comuni. Inoltre, è possibile **organizzare gli elementi del menù in categorie** personalizzabili (e.g.: primi, dessert, primi di pesce, bibite, etc.), e definire l’**ordine** con cui gli elementi compaiono nel menù. In fase di inserimento, è richiesto l’**autocompletamento** di alcuni prodotti (e.g.: bibite o preconfezionati) utilizzando open data come quelli disponibili in https://it.openfoodfacts.org/data.
- Un **addetto alla sala** può **registrare ordinazioni** indicando l’identificativo del tavolo egli elementi del menù desiderati.
- Un **supervisore** può **visualizzare (in formato PDF) il conto** di ciascun tavolo in un determinato momento. Inoltre, quando gli avventori seduti ad un certo tavolo vanno via, il supervisore può chiudere il conto e visualizzare la versione finale da sottoporre al cliente.
- Un **addetto alla cucina (o un supervisore)** può inoltre tenere traccia dell’**inventario della dispensa**. In particolare, l’utente può inserire/rimuovere prodotti dalla dispensa. Ciascun prodotto è caratterizzato da un costo di acquisto, da un nome, da una descrizione, e da una quantità (in Kg oppure in Litri, a seconda della tipologia di prodotto). In fase di inserimento, è apprezzato l’**autocompletamento** di alcuni prodotti (e.g.: bibite o altri preconfezionati) utilizzando open data come quelli disponibili in https://it.openfoodfacts.org/data.
- Un **addetto alla cucina (o un amministratore, o un supervisore**) possono **associare**, a ciascun **elemento presente nel menù**, un **elenco di ingredienti** presenti in dispensa necessari alla preparazione. Per ciascun ingrediente, è necessario indicare la quantità necessaria alla preparazione.
- Quando la **quantità di un dato prodotto** presente in dispensa scende al di sotto di una certa soglia personalizzabile per ciascun prodotto, il sistema invia un **messaggio** di avvertimento agli amministratori e ai supervisori.
- Un amministratore può visualizzare statistiche sugli introiti dell’attività di ristorazione. In particolare, dato un certo intervallo di tempo personalizzabile, è possibile visualizzare l’incasso medio, il valore medio di ciascun conto, l’incasso complessivo. È apprezzata la presenza di grafici interattivi.

## Check list
- [ ] Ingredients in dish + testing del threshold
- [ ] Autocompletamento, autenticazione, pdf

## Server's views
```
Ratatouille
|- managementApp
|  |- statisticsAPI
|  |- ingredientsAPI
|  |- dishAPI
|  |- orderAPI
|  |- dishOfOrderAPI 
|  |- ingredientsInDishAPI
|
|- usersApp
|  |- userApi
|  |- login_view
|  |- updatePassword_view
```

## How to use server's api
Se non è specificato che JSON una view ritorna, allora essa ritornerà un JSON contenente l'esito dell'operazione (Esempio {"Added successfully"}). Per sapere come si chiamano gli attributi da mettere nei JSON vedere il model. 

- **ManagementApp**
  - **statisticsAPI**
    - Questa view supporta il metodo GET;
    - Riceve in input un JSON del tipo {"start": "x", "end": "y"} dove x,y sono date del formato AAAA-MM-GG;
    - Ritorna un oggetto JSON contenente il totale guadagno, la media dei conti e la media del guadagno.
  - **ingredientsAPI**
    - Questa view supporta i metodi GET, PUT, POST e DELETE;
    - Il metodo GET non riceve nessun JSON, e ritorna tutti gli ingredienti;
    - Il metodo PUT riceve un JSON contenente almeno l'id dell'ingrediente e opzionalmente gli attributi da modificare;
    - Il metodo POST riceve un JSON contenente le informazioni necessarie per creare un nuovo ingrediente;
    - Il metodo DELETE non riceve nessun JSON, ma ha bisogno dell'id dell'ingrediente inserito nell'url.
  - **dishAPI**
    - Questa view supporta i metodi GET, PUT, POST e DELETE;
    - Il metodo GET non riceve nessun JSON, e ritorna tutti i piatti;
    - Il metodo PUT riceve un JSON contenente almeno l'id del piatto e opzionalmente gli attributi da modificare;
    - Il metodo POST riceve un JSON contenente le informazioni necessarie per creare un nuovo piatto;
    - Il metodo DELETE non riceve nessun JSON, ma ha bisogno dell'id del piatto inserito nell'url.
  - **orderAPI**
    - Questa view supporta i metodi GET, PUT, e POST;   
    - Il metodo GET riceve un JSON contenente il numero del tavolo, e ritorna tutte le informazioni appartenenti al conto;
    - Il metodo PUT riceve un JSON contenente il numero del tavolo, questo metodo deve essere chiamato alla fine, quando il cliente se n'è andato. E deve essere chiamato DOPO aver preso le informazioni del conto (order-dish info).
    - Il metodo POST riceve un JSON contenente il numero del tavolo, questo metodo deve essere chiamato solo quando un tavolo viene occupato, e deve essere fatto prima di ordinare qualsiasi cosa.
  - **dishOfOrderAPI**
    - Questa view supporta il metodo POST;
    - Riceve un JSON contenente il numero del tavolo, e l'id del piatto;
    - Controlla inoltre se un certo ingrediente sta per finire.
  - **ingredientsInDishAPI**
    - Questa view supporta il metodo POST;
    - Riceve un JSON che è una tupla di ingredientsInDish.
 
- **UsersApp**
  - **userApi**
    - Questa view supporta i metodi GET e POST;
    - Il metodo GET non riceve alcun JSON e ritorna un JSON contenente tutti gli utenti;
    - Il metodo POST riceve un JSON contenente tutte le informazioni di un nuovo utente.
  - **login_view**
    -  Questa view supporta il metodo POST;
    -  Riceve un JSON contenente name e password, e ritorna un JSON contenente tutte le informazioni di quell'utente.
  - **updatePassword_view**
    -  Questa view supporta il metodo PUT;
    -  Riceve un JSON con l'id dell'utente, e la nuova password.

| Caratteristiche | Descrizione |
| --------------- | ----------- |
| Titolo | Creazione Utenza Dipendente |
| Attore principale | Amministratore |
| Scopo | L'Amministratore può creare utenze per i propri dipendenti (sia addetti alla sala, che addetti alla cucina, che supervisori) nel sistema. Al primo accesso, ogni dipendente deve re-impostare la password temporanea inserita dall'Amministratore, scegliendo una password diversa. |
| Precondizioni | L'Amministratore ha accesso all'interfaccia di amministrazione del sistema. |

| Passo | Amministratore | Sistema | Dipendente | 
| ---- | -------------- | ------ | ---------- |
| 1 | Seleziona l'opzione "Creazione Utenza Dipendente" |  |  |
| 2 |  | Richiede all'Amministratore di inserire le informazioni del dipendente, inclusi nome, cognome, ruolo e una password temporanea generata dal sistema. 
| 3 | Inserisce le informazioni richieste e conferma la creazione dell'utenza | | |
| 4 | | Crea l'utenza del dipendente e invia una notifica all'Amministratore e al dipendente | |
| 5 | | | Al primo accesso, deve re-impostare la password temporanea inserita dall'Amministratore, scegliendo una password diversa |
| 6 | | | Inserisce la nuova password e accede al sistema |

| Estensione | Passo | Amministratore | 
| ---------- | ----- | -------------- |
| | 3.1 | Può annullare la creazione dell'utenza, tornando alla pagina precedente |

| Estensione | Passo | Sistema | 
| ---------- | ----- | -------------- |
| Se il dipendente non riesce a re-impostare la password | 5.1 | Il sistema notifica l'Amministratore e il dipendente per risolvere il problema |

| Estensione | Passo | Sistema |
| ---------- | ----- | ------- |
| Se il dipendente inserisce una password non valida | 6.1 | Il sistema notifica l'utente e richiede una nuova password |

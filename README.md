# winpe_creator
uno script per ottenere windows preinstallation environiment da una iso windows 



NOTA QUESTO NON è UN PROGETTO UFFICIALE MICROSOFT E POTREBBE NON FUNZIONARE CON TE.
IO NON MI PRENDO RESPONSABILITà SU QUESTA COSA.
QUESTO SOFTWARE NON è PROGETTATO PER UTILIZZI IN AMBIENTI ENTERPRISE O MISSION-CRITICAL
PER UTILIZZARE WINDOWS PE NEGLI AMBIENTI QUI DETTI SI CONSIGLIA L'UTILIZZO DI UN SOFTWARE FIDATO COME WINDOWS ADK O WAIK 
IO NON SONO IN NESSUN MODO ASSOCIATO A MICROSOFT CORPORATION

faq

come lo uso ?
---------------------------------------------------------------------------------------------------------------
ottieni una iso windows 10 da qui ==> https://www.microsoft.com/it-it/software-download/windows10 
estrai la zipped folder nella radice c:\ e rinomina la cartella in: windows_setup
estrai la tua immagine disco nella cartella ISO
ottieni il tuo file boot.wim e copialo nella cartella principale. 
usa gimagex dentro la cartella x64 
seleziona la scheda change
seleziona il tuo file boot.wim e settalo sul index 1. importante !!! abilita il flag boot !!!
una volta configurato esegui il file bake.cmd come amministratore
una volta finito il file sarà utilizzabile
avrai ottenuto ora un nuovo file ISO. che andra masterizzato con rufus (scaricabile da rufus.ie) o usato con vmware,virtualbox o un altro software di macchine virtuali.
-------------------------------------------------------------------------------------------------------------------------
è sicuro :
yep :) 
----------------------------------
è utilizzabile su mac os :
no. perchè i componenti dism e gimagex non sono disponibili
-------------------------------------------------------------
c'è una guida "user friendly" :
farò un video a riguardo 
-------------------------------------------------
a cosa serve windows preinstallation environiment?
-----------------------------------------------------------------------------------------------------------------------
(preso dal sito microsoft) 
Windows PE (WinPE) è un piccolo sistema operativo usato per installare, distribuire e ripristinare Windows desktop edition, Windows Server e altri sistemi operativi Windows desktop. Da Windows PE è possibile:
Configurare il disco rigido prima di installare Windows.
Installare Windows usando app o script da una rete o da un'unità locale.
Acquisire e applicare Windows immagini.
Modificare il Windows sistema operativo mentre non è in esecuzione.
Configurare gli strumenti di ripristino automatico.
Ripristinare i dati da dispositivi non ripristinabili.
Aggiungere una shell o un'interfaccia utente grafica personalizzata per automatizzare questi tipi di attività.
versione completa su ==> https://docs.microsoft.com/it-it/windows-hardware/manufacture/desktop/winpe-intro?view=windows-11
-----------------------------------------------------------------------------------------------------------------------
non mi fido dei file inclusi o il mio antivirus li ha contrassegnati come non sicuri.
sto tuttora lavorando per rendere lo script indipendente da GimageX ma non ci sono ancora riuscito.
il sito ufficiale di gimageX è questo:https://www.autoitconsulting.com/site/software/gimagex/
nota. io non sono associato in nessun modo a autoitconsulting. sono solo uno youtuber a cui piace programmare 
-----------------------------------------------------------------------------------------------------------------------
farai un sito per questo ?????
boh dipende da quanta strada farà il progetto :)
-----------------------------------------------------------------------------------------------------------------------
nota.
Windows PE non è un sistema operativo per utilizzo generico. Non può essere usato per scopi diversi dalla distribuzione e dal ripristino. Non deve essere usato come thin client o un sistema operativo incorporato. Esistono altri prodotti Microsoft, ad esempio Windows Embedded CE, che possono essere usati per questi scopi.

Per impedirne l'uso come sistema operativo di produzione, Windows PE arresta automaticamente l'esecuzione della shell e si riavvia dopo 72 ore di utilizzo continuo. Questo periodo non è configurabile.

Quando Windows pe viene riavviato, tutte le modifiche andranno perse, incluse le modifiche ai driver, alle lettere di unità e al registro WINDOWS PE. Per apportare modifiche permanenti, vedere qui ==> https://docs.microsoft.com/it-it/windows-hardware/manufacture/desktop/winpe-mount-and-customize?view=windows-11

L'Windows pe predefinita usa il formato di file FAT32, che pone le proprie limitazioni, tra cui dimensioni massime di 4 GB di file e dimensioni massime dell'unità di 32 GB. Per altre informazioni, vedere WinPE: Usare una singola chiave USB per WinPE e un file WIM (con estensione wim).

Windows PE non supporta gli elementi seguenti:

Utilizzo del file server o di Terminal Server.
Aggiunta a un dominio di rete.
Connessione a una rete IPv4 da Windows PE in una rete IPv6.
Desktop remoto.
.MSI file di installazione.
Avvio da un percorso che contiene caratteri non inglesi.
Esecuzione di app a 64 bit nella versione a 32 bit di Windows PE.
Aggiunta di pacchetti di app in bundle tramite Gestione e manutenzione immagini distribuzione (pacchetti con estensione appxbundle).
-----------------------------------------------------------------------------------------------------------------------
licenza d'uso. 

questo software è gratuito e open source e seguè i termini della licenza MIT.

alcuni software aggregati ad esempio gimageX sono freeware e non modificabili. 
per ulteriori informazioni sui software vedere 

GimageX site:https://www.autoitconsulting.com/site/software/gimagex/
waik docs:https://docs.microsoft.com/en-us/windows-hardware/get-started/adk-install
un grande Grazie per usare questo software


fatto con ❤️ da star development labs 


copyright 2021 star web & star development labs

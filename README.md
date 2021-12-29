# winpe_creator
uno script per ottenere windows preinstallation environiment da una iso windows 

faq

come lo uso ?
---------------------------------------------------------------------------------------------------------------
ottieni una iso windows 10 da qui ==> https://www.microsoft.com/it-it/software-download/windows10 
estrai la zipped folder nella radice c:\ e rinomina la cartella in: windows_setup
estrai la tua iso nella cartella ISO (facoltativo)
ottieni il tuo file boot.wim e copialo nella cartella principale. 
usa gimagex dentro la cartella x64 
seleziona la scheda change
seleziona il tuo file boot.wim e settalo sul index 1. importante !!! abilita il flag boot !!!
una volta configurato esegui il file bake.cmd come amministratore
una volta finito il file sarà utilizzabile
non abbiamo ancora finito. installa ultraISO da qui https://www.ultraiso.com/
apri la versione di prova e carica una copia del file ISO originale di windows 10
cancella i file setup.exe e i file sources\boot.wim e sources\install(.wim/.esd) 
copia il file boot.wim dentro la cartella sources 
salva il file
avrai ottenuto ora un nuovo file ISO. ora bisogna masterizzarlo con rufus (scaricabile da rufus.ie) o utilizzarlo con vmware,virtualbox o un altro software di macchine virtuali.
-------------------------------------------------------------------------------------------------------------------------
è sicuro :
yep :) 
----------------------------------
è utilizzabile su mac os :
no. perchè i componenti dism e gimagex non sono disponibili
-------------------------------------------------------------
c'è una guida "user friendly" ?
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
non mi fido dei file inclusi o il mio antivirus li ha contrassegnati come non sicuri
sto tuttora lavorando per rendere lo script indipendente da GimageX ma non ci sono ancora riuscito.
il sito ufficiale di gimageX è questo:https://www.autoitconsulting.com/site/software/gimagex/
nota. io non sono associato in nessun modo a autoitconsulting. sono solo uno youtuber a cui piace programmare 
-----------------------------------------------------------------------------------------------------------------------
farai un sito per questo ?????
boh dipende da quanta strada farà il progetto :)
-----------------------------------------------------------------------------------------------------------------------

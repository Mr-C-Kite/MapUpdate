#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

# Funktionsdefinition

startmenue(){
echo ""
echo "(1)   Karten aktualisieren
(2)   Karten herunterladen

(3)   beenden"
echo ""
read -p "Eingabe: " auswahl1
echo ""
if [ $auswahl1 == '1' ]
    then
        mapUpdate
    elif [ $auswahl1 == '2' ]
    then
        mapDownload
    elif [ $auswahl1 == '3' ]
    then
        rm -r temp
        exit 1
    else
        echo "unbekannte Eingabe"
        echo ""
        startmenue
fi
}

update(){

if [ -e IMG/de-topo.img ]
    then
        echo "de-topo ist vorhanden - wird aktualisiert"
        echo ""
        wget http://garmin.opentopomap.org/data/germany/germany_garmin.zip -P temp/
        unzip temp/germany_garmin.zip -d temp/
        mv temp/germany.img temp/de-topo.img
        rm IMG/de-topo.img
        mv temp/de-topo.img IMG/
        rm temp/*
        echo ""
        echo "de-topo wurde aktualisiert"
        echo ""
    else
        echo "de-topo ist nicht vorhanden"
fi

if [ -e IMG/alpen-topo.img ]
    then
        echo "alpen-topo ist vorhanden - wird aktualisiert"
        echo ""
        wget http://garmin.opentopomap.org/data/alps/alps_garmin.zip -P temp/
        unzip temp/alps_garmin.zip -d temp/
        mv temp/alps.img temp/alpen-topo.img
        rm IMG/alpen-topo.img
        mv temp/alpen-topo.img IMG/
        rm temp/*
        echo ""
        echo "alpen-topo wurde aktualisiert"
        echo ""
    else
        echo "alpen-topo ist nicht vorhanden"
fi

if [ -e IMG/de-fzk.img ]
    then
        echo "de-fzk ist vorhanden - wird aktualisiert"
        echo ""
        wget http://download.freizeitkarte-osm.de/garmin/latest/DEU_de_gmapsupp.img.zip -P temp/
        unzip temp/DEU_de_gmapsupp.img.zip -d temp/
        mv temp/gmapsupp.img temp/de-fzk.img
        rm IMG/de-fzk.img
        mv temp/de-fzk.img IMG/
        rm temp/*
        echo ""
        echo "de-fzk wurde aktualisiert"
        echo ""
    else
        echo "de-fzk ist nicht vorhanden"
fi

if [ -e IMG/alpen-fzk.img ]
    then
        echo "alpen-fzk ist vorhanden - wird aktualisiert"
        echo ""
        wget http://download.freizeitkarte-osm.de/garmin/latest/ALPS_de_gmapsupp.img.zip -P temp/
        unzip temp/ALPS_de_gmapsupp.img.zip -d temp/
        mv temp/gmapsupp.img temp/alpen-fzk.img
        rm IMG/alpen-fzk.img
        mv temp/alpen-fzk.img IMG/
        rm temp/*
        echo ""
        echo "alpen-fzk wurde aktualisiert"
        echo ""
    else
        echo "alpen-fzk ist nicht vorhanden"
fi

startmenue
}

downloadOTM(){
    
echo "Welche Region wollen Sie herunterladen?

(1)   Deutschland
(2)   Alpen
(3)   alle

(4)   zur Stilauswahl"
echo ""
read -p "Eingabe: " Regionotm
echo ""
if [ $Regionotm == '1' ]
    then
        echo "es wird die Region -Deutschland- im Stil -opentopomap- heruntergeladen"
        echo ""
        wget http://garmin.opentopomap.org/data/germany/germany_garmin.zip -P temp/
        unzip temp/germany_garmin.zip -d temp/
        mv temp/germany.img temp/de-topo.img
        mv temp/de-topo.img IMG/
        rm temp/*
        startmenue
    elif [ $Regionotm == '2' ]
    then
        echo "es wird die Region -Alpen- im Stil -opentopomap- heruntergeladen"
        echo ""
        wget http://garmin.opentopomap.org/data/alps/alps_garmin.zip -P temp/
        unzip temp/alps_garmin.zip -d temp/
        mv temp/alps.img temp/alpen-topo.img
        mv temp/alpen-topo.img IMG/
        rm temp/*
        startmenue
    elif [ $Regionotm == '3' ]
    then
        echo "es wird die Region -Deutschland- im Stil -opentopomap- heruntergeladen"
        echo ""
        wget http://garmin.opentopomap.org/data/germany/germany_garmin.zip -P temp/
        unzip temp/germany_garmin.zip -d temp/
        mv temp/germany.img temp/de-topo.img
        mv temp/de-topo.img IMG/
        rm temp/*
        echo ""
        echo "es wird die Region -Alpen- im Stil -opentopomap- heruntergeladen"
        echo ""
        wget http://garmin.opentopomap.org/data/alps/alps_garmin.zip -P temp/
        unzip temp/alps_garmin.zip -d temp/
        mv temp/alps.img temp/alpen-topo.img
        mv temp/alpen-topo.img IMG/
        rm temp/*
        startmenue
    elif [ $Regionotm == '4' ]
    then
        mapDownload
    else
        echo "unbekannte Eingabe"
        echo ""
        downloadOTM
fi
    
}

downloadFZK(){

echo "Welche Region wollen Sie herunterladen?

(1)   Deutschland
(2)   Alpen
(3)   alle

(4)   zur Stilauswahl"
echo ""
read -p "Eingabe: " Regionfzk
echo ""
if [ $Regionfzk == '1' ]
    then
        echo "es wird die Region -Deutschland- im Stil -Freizeitkarte- heruntergeladen"
        echo ""
        wget http://download.freizeitkarte-osm.de/garmin/latest/DEU_de_gmapsupp.img.zip -P temp/
        unzip temp/DEU_de_gmapsupp.img.zip -d temp/
        mv temp/gmapsupp.img temp/de-fzk.img
        mv temp/de-fzk.img IMG/
        rm temp/*
        startmenue
    elif [ $Regionfzk == '2' ]
    then
        echo "es wird die Region -Alpen- im Stil -Freizeitkarte- heruntergeladen"
        echo ""
        wget http://download.freizeitkarte-osm.de/garmin/latest/ALPS_de_gmapsupp.img.zip -P temp/
        unzip temp/ALPS_de_gmapsupp.img.zip -d temp/
        mv temp/gmapsupp.img temp/alpen-fzk.img
        mv temp/alpen-fzk.img IMG/
        rm temp/*
        startmenue
    elif [ $Regionfzk == '3' ]
    then
        echo "es wird die Region -Deutschland- im Stil -Freizeitkarte- heruntergeladen"
        echo ""
        wget http://download.freizeitkarte-osm.de/garmin/latest/DEU_de_gmapsupp.img.zip -P temp/
        unzip temp/DEU_de_gmapsupp.img.zip -d temp/
        mv temp/gmapsupp.img temp/de-fzk.img
        mv temp/de-fzk.img IMG/
        rm temp/*
        echo ""
        echo "es wird die Region -Alpen- im Stil -Freizeitkarte- heruntergeladen"
        echo ""
        wget http://download.freizeitkarte-osm.de/garmin/latest/ALPS_de_gmapsupp.img.zip -P temp/
        unzip temp/ALPS_de_gmapsupp.img.zip -d temp/
        mv temp/gmapsupp.img temp/alpen-fzk.img
        mv temp/alpen-fzk.img IMG/
        rm temp/*
        startmenue
    elif [ $Regionfzk == '4' ]
    then
        mapDownload
    else
        echo "unbekannte Eingabe"
        echo ""
        downloadFZK
fi
}

mapUpdate() {
echo "Wollen sie die Dateien im Ordner IMG aktualisieren?

(1)   Ja
(2)   Nein"
echo ""
read -p "Eingabe: " auswahl3
echo ""
if [ $auswahl3 == '1' ]
    then
        update
    elif [ $auswahl3 == '2' ]
    then
        echo "abgebrochen"
        echo ""
        startmenue
    else
        echo "unbekannte Eingabe"
        mapUpdate
fi

}

mapDownload() {
echo "Welchen Kartenstil wollen Sie herunterladen?

(1)   Opentopomap
(2)   Freizeitkarte

(3)   zum Hauptmenue"
echo ""
read -p "Eingabe: " auswahl2
echo ""
if [ $auswahl2 == '1' ]
    then
        downloadOTM
    elif [ $auswahl2 == '2' ]
    then
        downloadFZK
    elif [ $auswahl2 == '3' ]
    then
        startmenue
    else
        echo "unbekannte Eingabe"
        mapDownload
fi
}


# Hauptteil
echo ""
echo "MapUpdater 0.1"
echo ""

mkdir temp

if [ -d IMG ]
    then
        startmenue
    else
        mkdir IMG
        echo "Verzeichnis IMG erstellt, dort werden die Kartendaten gespeichert"
        echo ""
        startmenue
fi

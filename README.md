# Covid-19-Polska
Zebrane i oczyszczone dane [Ministerstwa Zdrowia](https://www.gov.pl/web/koronawirus/wykaz-zarazen-koronawirusem-sars-cov-2) Dane są formacie `csv` i `Rda` na poziomie:

* **powiatów** - kodowanie pliku .csv zostało zmienione na UTF-8.
* **województw** - są to zsumowane dane z powiatów, a nie informacja z województw, które wykłada oddzielnie MZ.
* **Polski** - dla porównania różnicy między zsumowanymi danymi z powiatów/województw oraz całego kraju.

##### Nazwy

MZ w publikowanych raportach używa różnych nazw kolumn. W wersji oczyszczonej nazwy zostały ustandaryzowane w następujący sposób:

* **data** - data publikacji raportu.
* **wojewodztwo** - nazwa województwa
* **teryt** - kod TERYT powiatu.
* **KTS.powiat/KTS.wojewodztwo** - kod [Systemu Kodowania Jednostek Terytorialnych i Statystycznych](https://stat.gov.pl/statystyka-regionalna/jednostki-terytorialne/system-kts/) na poziomie 5 dla powiatów oraz poziomie 2 dla województw. 
* **powiat** - nazwa powiatu.
* **ludnosc** - liczba ludności danej jednostki terytorialnej w 2019 r. pobrana z Banku Danych Lokalnych GUS.
* **zakazenia** - dzienna liczba nowych przypadków koronawirusa w danej jednostce terytorialnej
* **zakazenia.10.tys** - liczba dziennych zakażeń na 10 tys. mieszkańców. Opiera się na danych ludności GUS, a nie MZ, więc mogą występować niewielkie różnice w stosunku do raportów publikowanych przez ministerstwo.
* **zgony** - dzienna całkowita liczba zgonów.
* **zgony.Covid** - dzienna liczba zgonów na Covid pacjentów bez chorób współistniejących.
* **zgony.inne** - dzienna liczba zgonów na Covid pacjentów z chorobami współistniejącymi.
* **zgony.10.tys** - liczba dziennych zgonów na 10 tys. mieszkańców danej jednostki terytorialnej.
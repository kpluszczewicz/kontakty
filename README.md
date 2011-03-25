# Kontakty

Celem niniejszej aplikacji jest umożliwienie użytkownikom zbierania kontaktów, tak aby mieć do nich dostęp przez internet w każdym miejscu, w którym się znajdą. Program powstał na zaliczenie przedmiotu „Architektura serwisów internetowych” w pierwszym semestrze roku akademickiego 2010/2011

# Historia tworzenia aplikacji 

Aplikacja została utworzona od zera, wszystkie modele i kontrolery napisałem samodzielnie. Nie użyłem mechanizmu scaffold, gdyż poprzez systematyczne rozwijanie aplikacji od podstaw mogę lepiej poznawać framework Rails 3. Również mechanizm autentykacji został napisany od podstaw (bazowałem na tutorialu Michael'a Hartl'a)

# Użyte gemy i wtyczki

Idąc za radami prowadzącego zajęcia, wykorzystałem w swojej aplikacji następujące komponenty:
Gemy:

- will\_paginate:  
    Tego używają chyba wszyscy, którym marzy się szybka i prosta paginacja różnego rodzaju kolekcji

- simple\_form:  
    Jak sama nazwa wskazuje ten gem zdecydowanie upraszcza tworzenie jednolitych formularzy w serwisie. Choć może na początku z pewną dozą nieufności do niego podszedłem, to jednak przyznaję, że jest bardzo użyteczny. Jeśli witryna składa się głównie z formularzy może zaoszczędzić dużo pisania. Konfiguracja tego gemu odbywa się poprzez plik config/initializers/simple_form.rb. Jest on bardzo dokładnie skomentowany.
 - gravatar\_image\_tag:  
    Umożliwia wstawianie gravatara poprzez jeden prosty helper.
- inherited\_resources:  
	Z tym gemem jest pewnien problem. Co prawda pomaga zaoszczędzić trochę pisania kodu, ale ja stwierdzam, że trudno się potem połapać w kontrolerze. Następnym razem tego gemu już nie użyję, bo generalnie nie rozjaśnia a zaciemnia.
	
- faker:  
    Ponoć są inne przyjemne narzędzia do produkowania przykładowych danych, to faker'a znajduję bardzo dobrze.

Wtyczki:

- asset\_packager:  
	Ta wtyczka umożliwia skompresowanie skryptów js oraz akruszy stylów css w taki sposób, że będą one serwowane w nawet jednym pliku na rodzaj. Przyznaję, że nie wierzyłem, że to może dać jakieś ciekawe wyniki. Po zmierzeniu czasu ładowania się stron przyznaję z pokorą, że asset_packager pomaga przyspieszyć aplikację w bardzo znaczący sposób. W przypadku Kontaktów, po użyciu mówionej wtyczki, czas serwowania strony głównej spadł z 700ms do 600ms. To aż o 1/7 szybsze ładowanie strony. Rzeczywiście - każdy oddzielny plik do pobrania niesie za sobą dodatkowe dane - nagłówki http, ponadto potrzeba za każdym razem nawiązać połączenie tcp, na którym jest budowana transakcja http. Jeśli aplikacja ma obsługiwać wielu klientów - to asset_packager jest niezbędny!

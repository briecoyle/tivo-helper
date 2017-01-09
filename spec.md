# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application - The interface for users of this application begins in the bin/tivo-helper file. Within this file, the initial call to launch the application occurs by instantiating a new instance of the CLI class and calling the #call method. Within lib/tivo_helper/cli.rb, there is the #call method, which is intentionally brief to allow for code flexibility. The CLI welcomes the user and presents a menu of options to view upcoming premiere information. Users may choose to view premieres by time, by genre, or by network. If a user chooses by genre or by network, the user is presented with a comprehensive list of available genres or networks. From these, they can choose one to view a list of shows that match that criteria.
- [x] Pull data from an external source - This gem pulls information from metacritic's permanent calendar for premieres using nokogiri and open-uri.
- [x] Implement both list and detail views - The user is initially presented with a list of options, and then is allowed to view details about each show based on different criteria.

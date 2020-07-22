# Prerequisites
* Ruby installation 

# About the files
* Data file contains the data required for the application
* GatherData class fetches data from the 42words API using HTTParty
* User class handles the communication between UserGame and WordGame
* WordGame class communicates with GatherData class and perfoms operation on that data
* UserGame class consists of the game to be played by the user 

# Usage
* On commandline type ruby ./UserGame.rb <command> <word>
* For help and detailed Study, type ruby ./UserGame.rb --help
# Codebreaker

This gem contains logic that necessary for codebreaker game console and web versions.

Here represented such classes to inplement logic:
1. **GameStatistic** - contains all information about game (attempts, hints and difficulty)
2. **Player** - contains just information about name
3. **Game** - creates secret number and checks result of the game (win or not)
4. **Constsnts** - module that contains all constants

Console part of the app you can find here: 
https://github.com/etherell/codebreaker_console

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'codebreaker'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install codebreaker

## Usage

To use this game it should be installed in a console or web vesion of the game

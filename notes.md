- As a hangman player, I would like to be able to start a new game of hangman
  - can with `ruby play_hangman.rb` but is there a better way of doing this?
  - with a script command?

- As a hangman player, I would like to see some indication of how many letters there are in the word that I am supposed to guess
  - done ✅

- As a hangman player, I want to submit one letter guesses and be told whether my guess is either in the word, not in the word, or already guessed
  - one letter guesses ❌
    -
  - not in word ✅
  - in the word ✅
  - already guessed ❌
    -

- As a hangman player, I want the game to handle bad input (like numbers, symbols, and letters I've previously guessed & empty string(9)) gracefully and with an appropriate error message so that I am not punished unduly for mistakes 
  - TODO ❌
  - error class
    - handles bad input, returns nice message
    - standard error
    - result object?

- As a hangman player, I want to see the letters I've guessed correctly revealed on the hidden word that I am trying to guess so that I can guess the word more readily
  - done ✅

- As a hangman player, I want to see the letters I've guessed incorrectly so that I don't guess the same wrong letter again
  - TODO ❌

- As a hangman player, I would like to see how many lives are remaining
  - done ✅

- As a hangman player, I must have 1 life deducted every time I make an incorrect guess of a letter that I have not already guessed
  - is still deducting a life if letter has already been used ❌

- As a hangman player, I want the game to end when I have run out of lives
  - done ✅

- As a hangman player, I want the game to end when I have guessed the full word
 - done ✅

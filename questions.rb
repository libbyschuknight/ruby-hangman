## Questions

Hangman

# QUESTION: is it okay doing this
# letter = UserInput.new.letter
# or would it be better to do
# user_input = UserInput.new
# letter = user_input.letter
# or should I do something different in the class?


user_input = UserInput.new
letter = user_input.letter




def remove_life
  # QUESTION: why self instead of @?
  self.lives -= 1
  false
end

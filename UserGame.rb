$LOAD_PATH<<'.'
require 'User.rb'
require 'data.rb'


class UserGame<User
  def initialize    
    @Synonyms=[]
    @Antonyms=[]
    @Definations=[]
    @Word=''
    @Score=0
    @game_data=Hash.new
  end
    
  def play_game
    while true
      begin
        arr=self.get_values
        result=self.play(arr)
        case result
        when true
          puts "HURRAH YOU WON"
        when false
          puts "YOU MISSED THE CHANCE... DON'T WORRY"
        end
        puts "YOUR SCORE IS #{@Score}"
        puts "MOVING TO NEXT QUESTION, TO EXIT PRESS CTRL+C"
      rescue Interrupt 
        print("Exiting game now: Your Final Score is #{@Score}")
        exit
      end
    end
  end

  def get_values
    @Word=self.word_of_the_day
    @Synonyms=self.word_synonym(@Word)
    @Antonyms=self.word_antonym(@Word)
    @Definations=self.word_defination(@Word)
    @game_data={'syn' => @Synonyms,
    'ant' => @Antonyms,
    'def' => @Definations
  };
  arr=['syn','ant','def']
  arr=remove_nil(arr)
  puts arr
  return arr
  end
  
  def remove_nil(arr)
    print '-'*100
    @game_data.each do |k,v|
      if v.size==0
        arr.delete(k)
      end
    end
    return arr
  end

  def play(arr)
    random_selection=arr
    random_hint=arr
    rand_element=random_selection.sample
    random_selection.delete(rand_element)
    rand_val= @game_data[rand_element].sample
    @game_data[rand_element].delete(rand_val)
    puts "\"#{rand_val}\" is the #{Config[:COMMAND_MEANING][rand_element]} now guess the word"
    puts @Word
      #checking the right answer
    check, random_hint=perform_check(random_hint)
    return check
  end

  def perform_check(random_hint)
    loop do
      operation=self.check_answer
      self.edit_score(operation)      
      case operation
      when 0
        return random_hint, true
      when 1
        next
      when 2
        if random_hint.size==0
          puts "All the Hints have been used, showing jumbled word \"#{@Word.split("").shuffle.join}\" please guess the word"
        else
          random_hint=self.show_hint(random_hint)
        end
      when 3
        skip_word
        break
      end
    end
    return random_hint, false
  end

  def skip_word
    puts "The word is #{@Word}"
    puts "The Synonyms are #{@Synonyms}"
    puts "The definations are #{@Definations}"
  end

  def show_hint(hint_type)
    type=hint_type.sample
    hint_type.delete(type)
    type_val=@game_data[type].sample
    @game_data[type].delete(type_val)
    puts "#{type_val} -:is the #{Config[:COMMAND_MEANING][type]} hint now please guess the word"
    return hint_type
  end

  def edit_score(input)
    case input
    when 0
      @Score+=10
      when Config[:GAME_COMMANDS][:QUIT].to_i
        @Score-=4
      when Config[:GAME_COMMANDS][:TRY_AGAIN].to_i
        @Score-=2
      when Config[:GAME_COMMANDS][:HINT].to_i
        @Score-=3
    end
  end

  def check_answer
    print "Guess the word: "
    guess=STDIN.gets.chomp.to_s
    if(guess==@Word || @Synonyms.include?(guess))
      return 0
    end
    puts "Wrong Answer \n \t Select 1 to try again \n \t Select 2 to get help \n\t Select 3 to move to the next word"
    print "Enter Value here: "
    operation=STDIN.gets.chomp.to_s
    if(operation=='1' || operation == '2' || operation=='3')
      return operation.to_i
    else
      puts "Wrong Input Terminating now"
      exit
    end
  end

end

x = UserGame.new
val=x.check_argv(ARGV)
if val
  x.play_game
end
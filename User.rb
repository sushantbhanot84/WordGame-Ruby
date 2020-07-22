$LOAD_PATH << "."
require 'WordGame.rb'
require 'data.rb'

class User<WordGame
  def check_argv(arg)
    len=arg.size
    case len
    when 0
      word=self.word_of_the_day
      self.word_full_dict(word)
    when 1
      unless arg[0]=='play'
        if arg[0]=='--help'
          call_for_help
          return false
        end
        self.word_full_dict(arg[0])
      else
        return true
      end
    when 2
      self.check_ARGV_Len2(arg)
    end
    return false
  end

  def check_ARGV_Len2(arg)
    case(arg[0])
    when 'def'
      self.display_arr(self.word_defination(arg[1]))
    when 'syn'
      self.display_arr(self.word_synonym(arg[1]))
    when 'ant'
      self.display_arr(self.word_antonym(arg[1]))
    when 'dict'
      self.display_arr(self.word_full_dict(arg[1]))
    when 'ex'
      self.display_arr(self.word_example(arg[1]))
    else
      print "ERROR INVALID COMMAND"
    end
  end
  def call_for_help
    file=File.open('AboutTool.txt')
    file_data = file.readlines.map(&:chomp)
    puts(file_data)
    file.close
  end
end
$LOAD_PATH<<"."
require 'data.rb'
require 'GatherData.rb'

class WordGame
  include GatherData

  def word_defination(word)
    words_data= self.get_data(Config[:COMMANDS]['def'], word)
    definations=[]
    words_data.each() do |hash|
      definations<<hash.values[0]
    end
    definations
  end

  def word_synonym(word)
    words=[]
    word_syn= self.get_data(Config[:COMMANDS]['syn'], word)
    word_syn=word_syn.each do |dict| 
      if dict['relationshipType']=='synonym'
        words=dict['words']
        break
      end
    end
    words
  end

  def word_antonym(word)
    words=[]
    word_ant= self.get_data(Config[:COMMANDS]['ant'], word)
    word_ant=word_ant.each do |dict| 
      if dict['relationshipType']=='antonym'
        words=dict['words']
        break
      end
    end
    words
  end

  def word_example(word)
    arr=[]
    word_ex= self.get_data(Config[:COMMANDS]['ex'], word)
    word_ex['examples'].each do |example| 
      arr << example.values[0]
    end
    arr
  end

  def word_full_dict(word)
    defin = self.word_defination(word)
    puts "Here are the Definations of the Following word"
    self.display_arr(defin)
    synon= self.word_synonym(word)
    puts "\nHere are Synonyms of the Following word"
    self.display_arr(synon)
    word_ex=self.word_example(word)
    puts "\nHere are some examples of the word"
    self.display_arr(word_ex)
  end

  def display_arr(arr)
    if(arr.size==0)
      puts "Nothing to display"
      return
    end
    count=0
    print '-'*50
    puts
    arr.each do |v|
      count+=1
      print count,'. ',v,"\n"
    end
    puts
    print '-'*50
  end

  def word_of_the_day
    word_of_day= self.get_data(Config[:COMMANDS]['none'])
    word_of_day['word']
  end

end


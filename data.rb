
Config ={
  APP_NAME: 'Word Game',
  
  API_KEY: 'a98eff3917981ec80a86523e17be5f61287bd0a6595728ef9feb6a9cf50f354db16fe8aa5e96d7405784d4771876d1ff84d8b644c569371bd70ce16fa49d2fff5e15de4c572b47f55792f763df03a2c7',
  
  API_URL: {
   HOST_URL: 'http://fourtytwowords.herokuapp.com',
   DEFINATION_URL: '/word/{word}/definitions?api_key=',
   RANDOM_WORD: '/words/randomWord?api_key=',
   RELATED_WORDS: '/word/{word}/relatedWords?api_key=',
   EXAMPLES: '/word/{word}/examples?api_key='
},
APP: './dict',

COMMANDS: {
'def'=> :DEFINATION_URL,
'syn'=> :RELATED_WORDS,
'ant'=> :RELATED_WORDS,
#ANTONYMS: 'ant',
'ex'=> :EXAMPLES,
HELP: '--help',
'play'=> :RANDOM_WORD,
'none'=> :RANDOM_WORD
},

GAME_COMMANDS: {
  TRY_AGAIN: '1',
  HINT: '2',
  QUIT: '3'
},

COMMAND_MEANING: {
  'syn'=>'Synonym',
  'ant'=>'Antonym',
  'def'=>'Defination'
}
};
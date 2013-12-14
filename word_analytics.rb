require 'pry'

class WordAnalytics
  def initialize(input)
    @input = input
  end

  def seperate_words
    @input.downcase.gsub(/[,'.?"!@#$%&*()]/,'').split(' ')
  end

  def seperate_letters
    @input.downcase.gsub(/\W/,'').split('')
  end

  def seperate_chars
    @input.downcase.gsub(/[\w\s]/,'').split('')
  end

  def get_occurrences(type)
    type_hash = type.group_by{ |i| i }
    number_of_type = {}
    type_hash.each do |k, v|
      number_of_type[k] = v.size
      puts "#{k}: #{number_of_type[k]}"
    end
    number_of_type
  end


  # def get_word_numbers
  #   word_array = seperate_words
  #   word_hash = word_array.group_by{ |i| i }
  #   number_of_words = {}
  #   word_hash.each do |key, word|
  #     number_of_words[key] = word.size
  #     puts "#{key}: #{number_of_words[key]}"
  #   end
  #   number_of_words
  # end

  # def get_letter_numbers
  #   letter_array = seperate_letters
  #   letter_hash = letter_array.group_by{ |i| i }
  #   number_of_letters = {}
  #   letter_hash.each do |key, letter|
  #     number_of_letters[key] = letter.size
  #     puts "#{key}: #{number_of_letters[key]}"
  #   end
  #   number_of_letters
  # end

  # def get_char_numbers
  #   char_array = seperate_chars
  #   char_hash = char_array.group_by{ |i| i }
  #   number_of_chars = {}
  #   char_hash.each do |key, char|
  #     number_of_chars[key] = char.size
  #     puts "#{key}: #{number_of_chars[key]}"
  #   end
  #   number_of_chars
  # end

end

sentence = WordAnalytics.new('Hello, Jeff.')
words = sentence.seperate_words
letters = sentence.seperate_letters
characters = sentence.seperate_chars
sentence.get_occurrences(words)
sentence.get_occurrences(letters)
sentence.get_occurrences(characters)


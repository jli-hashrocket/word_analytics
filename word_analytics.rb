
class WordAnalytics
  def initialize(input)
    @input = input
  end

  def seperate_words
    @input.downcase.gsub(/[,;'.?"!@#$%&*()]/,'').split(' ')
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

  def get_top_three(occurrences)
    top_three = occurrences.sort_by {|type, count| count}.reverse
    puts "Top 3: "
    top_three[0,3].each do |type|
      puts "#{type[0]}: #{type[1]}"
    end
    top_three[0,3]
  end
end

sentence = WordAnalytics.new('What a terrible and horrible and cruel, cruel, cruel world.')
words = sentence.seperate_words
letters = sentence.seperate_letters
characters = sentence.seperate_chars
word_occurrence = sentence.get_occurrences(words)
letter_occurrence = sentence.get_occurrences(letters)
char_occurrence = sentence.get_occurrences(characters)
sentence.get_top_three(letter_occurrence)



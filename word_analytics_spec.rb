require 'rspec'
require_relative 'word_analytics'

describe WordAnalytics do
  let(:analytics) {WordAnalytics.new('Hello, Jeff.')}

  it 'returns an array of strings' do
    expect(analytics.seperate_words).to eql(%w(hello jeff))
  end

  it 'returns an array of letters' do
    expect(analytics.seperate_letters).to eql(%w(h e l l o j e f f))
  end

  it 'returns an array of symobols' do
    expect(analytics.seperate_chars).to eql(%w(, .))
  end

  it 'counts the number of occurrences of each word' do
    words = analytics.seperate_words
    expect(analytics.get_occurrences(words)).to eql({'hello'=>1,'jeff'=>1})
  end

  it 'counts the number of occurrences of each letter' do
    letters = analytics.seperate_letters
    expect(analytics.get_occurrences(letters)).to eql({'h'=>1,'e'=>2,'l'=>2,'o'=>1,'j'=>1,'f'=>2})
  end

  it 'counts the number of occurrences of each char' do
    characters = analytics.seperate_chars
    expect(analytics.get_occurrences(characters)).to eql({','=>1,'.'=>1})
  end

  it 'lists top 3 most common words' do
    analytics = WordAnalytics.new("What a terrible and horrible and cruel, cruel, cruel world.")
    words = analytics.seperate_words
    occurrences = analytics.get_occurrences(words)
    expect(analytics.get_top_three(occurrences)).to eql([["cruel", 3], ["and", 2], ["world", 1]])
  end

  it 'lists top 3 most common letters' do
    analytics = WordAnalytics.new("What a terrible and horrible and cruel, cruel, cruel world.")
    letters = analytics.seperate_letters
    occurrences = analytics.get_occurrences(letters)
    expect(analytics.get_top_three(occurrences)).to eql([["r", 8], ["l", 6], ["e", 6]])
  end
end

# if one word is larger than 10 it returns the first and ast characteres, elese must be return the word, and create the test using minitest and rsepc
# example input: The words Internationalization and Localization are too long
# output "the words I18n and L10n are too long"

def convert(sentence)
  words = sentence.split(' ')

  def check_word(word)
    return word[0] + word[1..-2].length.to_s + word[-1] if word.length > 10

    word
  end

  res = words.map do |sent|
    check_word(sent)
  end

  res.join(' ')
end

input = 'The words Internationalization and Localization are too long'
pp convert(input)

# Tests Using minitest
require 'minitest/autorun'
class TestConverter < Minitest::Test
  def setup
    @input = 'The words Internationalization and Localization are too long'
    @output = "The words I18n and L10n are too long"
  end

  def test_do_the_test_with_the_normal_input
      assert_equal @output, convert(@input)
  end
end

Minitest.run

# test using rspec
require 'rspec'
RSpec.describe 'convert' do
  let(:input) { 'The words Internationalization and Localization are too long' }
  let(:output) { 'The words I18n and L10n are too long' }

  it "test_do_the_test_with_the_normal_input" do
    expect(convert(input)).to eq(output)
  end
end

RSpec::Core::Runner.run([$__FILE__])
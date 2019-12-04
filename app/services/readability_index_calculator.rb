class ReadabilityIndexCalculator
  EN = 'en'.freeze
  UA = 'uk'.freeze
  RU = 'ru'.freeze

  LANGUAGE_CODES = [EN, UA, RU]

  def initialize(text)
    @text = text
  end

  def self.call(*args, &block)
    text, = args
    text_language_code = LanguageDetection.perform(text).code

    if LANGUAGE_CODES.exclude?(text_language_code)
      return OpenStruct.new(success?: false, readability_index: nil, error: 'Undefined language of text!')
    end

    case text_language_code
    when EN
      ReadabilityIndexCalculatorEn.new(*args, &block).execute
    when UA
      ReadabilityIndexCalculatorUa.new(*args, &block).execute
    when RU
      ReadabilityIndexCalculatorRu.new(*args, &block).execute
    end
  end

  def execute
    total_sentences = calculate_sentences_count
    words = parse_to_words
    total_words = words.size
    total_syllables = words.inject(0) { |sum, word| sum + calculate_syllables_count(word.downcase) }

    OpenStruct.new(success?: true, readability_index: calculate_readability_index(total_sentences, total_words, total_syllables), error: nil)
  end

  private

  def parse_to_words
    @text.scan(/[a-zA-Zа-яА-Я]+/)
  end

  def calculate_sentences_count
    @text.scan(/[\.\?\!][ ]+|\z/).size
  end
end

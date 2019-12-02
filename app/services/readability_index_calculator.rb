class ReadabilityIndexCalculator
  EN = 'en'.freeze
  UA = 'uk'.freeze
  RU = 'ru'.freeze

  LANGUAGE_CODES = [EN, UA, RU]

  def initialize(text)
    @text = text
  end

  def self.call(*args, &block)
    new(*args, &block).execute
  end

  def execute
    text_language_code = LanguageDetection.perform(@text).code
    if LANGUAGE_CODES.exclude?(text_language_code)
      return OpenStruct.new(success?: false, readability_index: nil, error: 'Undefined language of text!')
    end
    
    OpenStruct.new(success?: true, readability_index: calculate_readability_index(text_language_code), error: nil)
  end

  private

  def calculate_readability_index(text_language_code)
    total_sentences = calculate_sentences_count
    words = parse_to_words
    total_words = words.size

    case text_language_code
    when UA
      total_syllables = words.inject(0) { |sum, word| sum + calculate_ukrainian_syllables_count(word.downcase) } 
      return 206.835 - 1.35 * (total_words / total_sentences) - 84.6 * (total_syllables / total_words)
    when RU
      total_syllables = words.inject(0) { |sum, word| sum + calculate_russian_syllables_count(word.downcase) }
      return 206.835 - 1.3 * (total_words / total_sentences) - 60.1 * (total_syllables / total_words)
    when EN
      total_syllables = words.inject(0) { |sum, word| sum + calculate_english_syllables_count(word.downcase) }
      return 206.835 - 1.015 * (total_words / total_sentences) - 64.3 * (total_syllables / total_words)
    end
  end

  def parse_to_words
    @text.scan(/[a-zA-Z]+/)
  end

  def calculate_sentences_count
    @text.scan(/[\.\?\!][ ]+|\z/).size
  end

  def calculate_russian_syllables_count(word)
    # TODO: implement for russian language
    calculate_english_syllables_count(word)
  end

  def calculate_ukrainian_syllables_count(word)
    # TODO: implement for ukrainian language
    calculate_english_syllables_count(word)
  end

  def calculate_english_syllables_count(word)
    syllable_count = 0
    vowels = 'aeiouy'
    
    if vowels.include?(word[0])
      syllable_count += 1  
    end
    
    index = 0
    loop do
      index += 1
      
      if word[index].nil?
        break
      end

      if vowels.include?(word[index]) && vowels.exclude?(word[index - 1])
        syllable_count += 1
      end
    end

    if word.ends_with?('e')
      syllable_count -= 1
    end

    if word.ends_with?('le') && word.length > 2 && vowels.exclude?(word[-3])
      syllable_count += 1
    end

    if syllable_count == 0
      syllable_count += 1
    end

    syllable_count
  end 
end

class ReadabilityIndexCalculatorEn < ReadabilityIndexCalculator
  def initialize(text)
    super(text)
  end

  protected

  def calculate_readability_index(total_sentences, total_words, total_syllables)
    return 206.835 - 1.015 * (total_words / total_sentences) - 64.3 * (total_syllables / total_words)
  end

  def calculate_syllables_count(word)
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

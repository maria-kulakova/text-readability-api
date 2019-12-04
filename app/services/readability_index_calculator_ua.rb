class ReadabilityIndexCalculatorUa < ReadabilityIndexCalculator
  def initialize(text)
    super(text)
  end

  private

  def calculate_readability_index(total_sentences, total_words, total_syllables)
    return 206.835 - 1.35 * (total_words / total_sentences) - 84.6 * (total_syllables / total_words)
  end

  def calculate_syllables_count(word)
    # TODO: Implement, remove temporary return
    1
  end
end

class ReadabilityIndexCalculatorRu < ReadabilityIndexCalculator
  def initialize(text)
    super(text)
  end

  private

  def calculate_readability_index(total_sentences, total_words, total_syllables)
    return 206.835 - 1.3 * (total_words / total_sentences) - 60.1 * (total_syllables / total_words)
  end

  def calculate_syllables_count(word)
    # TODO: Implement, remove temporary return
    1
  end
end

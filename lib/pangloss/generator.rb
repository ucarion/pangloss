module Pangloss
  class Generator
    def initialize(args = {})
      @min_length = args[:min_length] || 1
      setup(args[:language] || :english, args[:depth] || 3)
    end

    def get_words(num_words)
      result = []
      num_words.times { result << get_word }
      result
    end

    def get_word
      result = ""
      word = @hash.keys.sample

      until result.end_with?(' ')
        result << word[0]
        word = word[1..-1] << @hash[word].sample
      end

      result.rstrip!

      result.length < @min_length ? get_word : result
    end

    private

    def setup(language, depth)
      dict_path = File.join(File.dirname(__FILE__), '..', '..', 'dictionaries', language.to_s, depth.to_s)

      raise "Dictionary for #{language} at depth #{depth} does not exist!" unless File.exists?(dict_path)

      @hash = eval(IO.read(dict_path))
    end
  end
end
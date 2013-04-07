Pangloss
========

Make up semi-realistic words.

Get yourself a copy with

```
gem install pangloss
```

Then in your code you can generate new words by going:

```ruby
require 'pangloss'

en = Pangloss::Generator.new(min_length: 5)
fr = Pangloss::Generator.new(language: :french, min_length: 5)
es = Pangloss::Generator.new(language: :spanish, min_length: 5)

puts "In the year #{200 + rand(1000)}, the main kings of Europe were:"
puts " * Peter of #{en.get_word.capitalize}, king of England"
puts " * Pierre of #{fr.get_word.capitalize}, king of France"
puts " * Pedro of #{es.get_word.capitalize}, king of Spain"
```

Which produces the output

```
In the year 1034, the main kings of Europe were:
 * Peter of Icalmost, king of England
 * Pierre of Telles, king of France
 * Pedro of Drugitad, king of Spain
```

If you want to generate many words, you can also use the `gen_words(n)` method, which returns an array:

```ruby
en.get_words(10) # ["npresummons", "jocolomone", "esaid", "akfast", "chwome", "syllages", "woked", "amazed", "dihoodman", "fferving"]
fr.get_words(10) # ["joseillitz", "adier", "hropre", "auche", "aoulution", "ongea", "efouit", "myopin", "btendresp", "buons"]
es.get_words(10) # ["rgelindad", "hejan", "osuradero", "ucada", "eugen", "lemas", "feligro", "ambobosotros", "histo", "joteador"]
```

When creating a word generator, you can specify the language, minimum length, and "depth" of the generator with the `:language`, `:min_length`, and `:depth` parameters. The language and minimum length parameters should be self-explanitory, but the depth paramters represents the amount of characters Pangloss looks at to determine what the next character in a word will be. In short, higher values generate more realistic words but oftentimes just repeat words already found in the dictionary. Lower values will be more original but less realistic.

Provided for you are English, French, and Spanish dictionaries for depth 1 through 5, but you can use the provided dictionary builder (`dictionary_generator.rb`) to add more.

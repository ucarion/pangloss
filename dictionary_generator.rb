# Usage: ruby dictionary_generator.rb language file
# i.e. ruby dictionary_generator.rb spanish don_quixote.txt
# Generates dictionary files in dictionaries/"language"

MAX_DEPTH = 5

language = ARGV[0]
file = ARGV[1]

s = IO.read(file)

# first, remove all non-letter characters and assume they represent spaces (ends of words)
# (http://stackoverflow.com/questions/9246142/remove-all-non-alphabetical-non-numerical-characters-from-a-string)
s.gsub!(/[^[:alpha:]]/, ' ')

# then remove all groups of consecutive spaces
s.squeeze!(' ')

# and all to lowercase
s.downcase!

# get an array version of this string
chars = s.chars.to_a

Dir.mkdir("dictionaries/#{language}") unless Dir.exists?("dictionaries/#{language}")

1.upto(MAX_DEPTH) do |depth|
  print "Creating dictionary for depth #{depth} ... "
  result = {}

  chars.each_cons(depth + 1) do |letters|
    key = letters[0...-1]
    result[key] ||= []
    result[key] << letters.last
  end

  File.open(File.join('dictionaries', language, depth.to_s), 'w') do |f|
    f.write(result)
  end

  puts "done."
end
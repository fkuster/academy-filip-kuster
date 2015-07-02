# Write a function that accepts two parameters, i) a string (containing a list of words) and ii) an integer (n).
# The function should alphabetize the list based on the nth letter of each word.
# The length of all words provided in the list will be >= n. The format will be "x, x, x"

def sort_it(list_, n)
 hash={}
 words_array=list_.split(",")
 words_array.each{|word| word.strip!}
 words_array.each{|word| hash[word]=word[n-1]}
 sorted=hash.sort_by{|k, v| v}
 sorted.map{|k,v| "#{k}"}.join(', ')
end

Dir['*/*_test.rb'].each do |test_case|
  puts 'Loading... ' + test_case
  require './'+test_case
end

require 'json'
require 'net/http'
require 'active_support/core_ext/hash'

TEXT        = <<-TEXT.split ' '
Языки праграмирования появляются в атвет на потребност в ришении самых разных задач. Ruby и Rails были созданы, чтобы сделать программистов счасливами!
TEXT
SPELLER = {
  base_url: 'speller.yandex.net',
  path:     '/services/spellservice.json/checkText'
}

def speller_query text
  { text: text }.to_query
end

def spell text
  response = Net::HTTP.get(SPELLER[:base_url], [SPELLER[:path], speller_query(text)].join('?'))
  response = JSON.parse(response).first

  "#{response['word']} => #{response['s']}" unless response.nil?
end

# TEXT.each do |text|
#   if result = spell(text)
#     puts result
#   end
# end
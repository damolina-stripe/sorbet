# typed: __STDLIB_INTERNAL

# Calculates the set of unambiguous abbreviations for a given set of strings.
#
# ```ruby
# require 'abbrev'
# require 'pp'
#
# pp Abbrev.abbrev(['ruby'])
# #=>  {"ruby"=>"ruby", "rub"=>"ruby", "ru"=>"ruby", "r"=>"ruby"}
#
# pp Abbrev.abbrev(%w{ ruby rules })
# ```
#
# *Generates:*
#
# ```ruby
# { "ruby"  =>  "ruby",
#   "rub"   =>  "ruby",
#   "rules" =>  "rules",
#   "rule"  =>  "rules",
#   "rul"   =>  "rules" }
# ```
#
# It also provides an array core extension,
# [`Array#abbrev`](https://docs.ruby-lang.org/en/2.7.0/Array.html#method-i-abbrev).
#
# ```ruby
# pp %w{ summer winter }.abbrev
# ```
#
# *Generates:*
#
# ```ruby
# { "summer"  => "summer",
#   "summe"   => "summer",
#   "summ"    => "summer",
#   "sum"     => "summer",
#   "su"      => "summer",
#   "s"       => "summer",
#   "winter"  => "winter",
#   "winte"   => "winter",
#   "wint"    => "winter",
#   "win"     => "winter",
#   "wi"      => "winter",
#   "w"       => "winter" }
# ```
module Abbrev
  # Given a set of strings, calculate the set of unambiguous abbreviations for
  # those strings, and return a hash where the keys are all the possible
  # abbreviations and the values are the full strings.
  #
  # Thus, given `words` is "car" and "cone", the keys pointing to "car" would be
  # "ca" and "car", while those pointing to "cone" would be "co", "con", and
  # "cone".
  #
  # ```ruby
  # require 'abbrev'
  #
  # Abbrev.abbrev(%w{ car cone })
  # #=> {"ca"=>"car", "con"=>"cone", "co"=>"cone", "car"=>"car", "cone"=>"cone"}
  # ```
  #
  # The optional `pattern` parameter is a pattern or a string. Only input
  # strings that match the pattern or start with the string are included in the
  # output hash.
  #
  # ```ruby
  # Abbrev.abbrev(%w{car box cone crab}, /b/)
  # #=> {"box"=>"box", "bo"=>"box", "b"=>"box", "crab" => "crab"}
  #
  # Abbrev.abbrev(%w{car box cone}, 'ca')
  # #=> {"car"=>"car", "ca"=>"car"}
  # ```
  sig do
    params(
        words: T::Array[String],
    )
    .returns(T::Hash[String, String])
  end
  def self.abbrev(words); end
end

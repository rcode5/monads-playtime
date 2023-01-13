require 'dry/monads'

class MyService

  include Dry::Monads[:maybe, :result, :do]

  VALUES = %w(one two three a b c whatever dude)

  def check_val(val)
    val = Maybe(val)
    val.value_or('got nothing')
  end

  def find(thing)
    found = Maybe(VALUES.find{|v| v == thing})
    puts found
    found ? Success(found) : Failure(:not_found)
  end
end

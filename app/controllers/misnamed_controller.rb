# This is to try and reproduce the call stack overflow described in Exercise 3.1
class NonMatchingNameController < Rulers::Controller
  def foo
    'Foo!'
  end
end

class QuotesController < Rulers::Controller
  def a_quote
    render :a_quote, { noun: :winking, verb: :wishes }
  end

  def exception
    raise "It's a bad one!"
  end
end

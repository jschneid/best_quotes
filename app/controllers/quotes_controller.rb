class QuotesController < Rulers::Controller
  def a_quote
    @jsstest = 'jss1'

    render :a_quote, { noun: :winking, verb: :wishes }
  end

  def quote_1
    quote_1 = Rulers::Model::FileModel.find(1)
    render :quote, { obj: quote_1 }
  end

  def exception
    raise "It's a bad one!"
  end
end

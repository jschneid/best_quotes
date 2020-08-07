class QuotesController < Rulers::Controller
  def index
    quotes = FileModel.all
    render :index, { quotes: quotes }
  end

  def a_quote
    @jsstest = 'jss1'

    render :a_quote, { noun: :winking, verb: :wishes }
  end

  def quote_1
    quote_1 = FileModel.find(1)
    render :quote, { obj: quote_1 }
  end

  def exception
    raise "It's a bad one!"
  end
end

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

  def new_quote
    attrs = {
      'submitter' => 'web user',
      'quote' => 'A picture is worth one k pixels',
      'attribution' => 'Me'
    }
    m = FileModel.create attrs
    render :quote, { obj: m }
  end

  def quotes_by_submitter
    submitter = Rack::Utils.parse_nested_query(@env['QUERY_STRING'])['submitter']

    quotes = FileModel.find_all_by_submitter(submitter)
    render :index, { quotes: quotes }
  end

  def show
    quote = FileModel.find(params['id'])
    render :quote, obj: quote
  end

  def update_quote
    raise 'This action supports only POST.' unless @env['REQUEST_METHOD'] == 'POST'

    # Hard-code updating quote ID 6 for now
    quote = FileModel.find(6)

    # Per the book: We don't have a way to get the POST params yet. Hard-code an update for now.
    quote['attribution'] = 'Someone'

    quote.save!

    render :quote, { obj: quote }
  end

  def exception
    raise "It's a bad one!"
  end
end

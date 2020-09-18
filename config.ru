require './config/application'
require 'rack-google-analytics'
require 'rack/lobster'
use Rack::ContentType

map '/lobster' do
  use Rack::ShowExceptions
  use BenchMarker, 10_000
  run Rack::Lobster.new
end

class BenchMarker
  def initialize(app, runs = 100)
    @app, @runs = app, runs
  end

  def call(env) t = Time.now
    result = nil
    @runs.times do
      result = @app.call(env)
      return result if result[0] >= 300
    end

    t2 = Time.now - t
    STDERR.puts <<OUTPUT
Benchmark:
  #{@runs} runs
  #{t2.to_f.round(3)} seconds total
  #{(t2.to_f * 1000.0 / @runs).round(3)} millisec/run
OUTPUT
    result
  end
end

use BenchMarker, 10_000

# TODO: In a real app I'd use a real GA key here
# use Rack::GoogleAnalytics, :tracker => 'UA-xxxxxx-x'

# use Rack::ContentType

run BestQuotes::Application.new

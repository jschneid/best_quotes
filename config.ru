require './config/application'
require 'rack/lobster'

app = BestQuotes::Application.new

use Rack::ContentType

app.route do
  match '', 'quotes#index'
  match 'sub-app', proc { [200, {}, ['Hello, sub-app!']] }

  # Default routes
  match ':controller/:id/:action'
  match ':controller/:id', default: { 'action' => 'show' }
  match ':controller/:action'
  match ':controller', default: { 'action' => 'index' }
end

map '/lobster' do
  use Rack::ShowExceptions
  run Rack::Lobster.new
end

run app

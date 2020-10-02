require './config/application'
require 'rack/lobster'

app = BestQuotes::Application.new

use Rack::ContentType

app.route do
  match '', 'quotes#index'
  match 'sub-app', proc { [200, {}, ['Hello, sub-app!']] }

  # Default routes
  # NOTE: Contrary to what page 134 claims, this does NOT support paths like "/quotes/a_quote",
  # which is of the pattern :controller/:action
  match ':controller/:id/:action'
  match ':controller/:id', default: { 'action' => 'show' }
  match ':controller', default: { 'action' => 'index' }
end

map '/lobster' do
  use Rack::ShowExceptions
  run Rack::Lobster.new
end

run app

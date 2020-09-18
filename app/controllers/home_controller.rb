class HomeController < Rulers::Controller
  def index
    'Welcome to best_quotes!'
  end

  def delay
    delay_sec = 0.0001
    sleep delay_sec
    "This page rendered to you after a #{delay_sec} second delay!"
  end
end

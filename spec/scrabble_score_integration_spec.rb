require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

include Capybara::DSL

describe('the scrabble score path', {:type => feature}) do
  it('processes user entry and returns its scrabble score') do
    visit('/')
    fill_in('word',:with => 'muffin')
    click_button('Send')
    expect(page).to have_content(14)
  end
end

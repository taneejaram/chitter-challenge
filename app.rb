require 'sinatra/base'
require './lib/chitter'

class ChitterApp < Sinatra::Base

  get '/' do
    @peeps = Chitter.all
    erb :index_form
  end

  post '/written-peep' do
    @name = params[:name]
    erb :peep
  end

end

require 'sinatra/base'
require './lib/chitter'

class ChitterApp < Sinatra::Base

  get '/' do
    @peeps = Chitter.all
    erb :index_form
  end

  post '/written-peep' do
    @name = params[:name]
    Chitter.create(name: params['name'], message: params['message'])
    erb :peep
  end

end

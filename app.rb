require 'sinatra/base'
require './lib/chitter'

class ChitterApp < Sinatra::Base

  get '/' do
    @peeps = Chitter.all
    erb :index_form
  end

  post '/written-peep' do
    Chitter.create(name: params['name'], message: params['message'])
    erb :peep
    redirect '/'
  end

end

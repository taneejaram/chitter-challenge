require 'sinatra/base'
require './lib/chitter'

class ChitterApp < Sinatra::Base

  get '/' do
    #@username = params[:username]
    #@pword = params[:pword]
    erb :login_form
  end

  post '/logged-in' do
    erb :home_link
    redirect '/home'
  end

  get '/home' do
    @peeps = Chitter.all
    erb :index_form
  end

  post '/written-peep' do
    Chitter.create(name: params['name'], message: params['message'], date: params['date'])
    erb :peep
    redirect '/home'
  end

end

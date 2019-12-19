require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/team' do
      binding.pry
      @team = Team.new(params[:team])

      params[:team][:heroes].each do |hero_info|
        SuperHero.new(hero_info)
      end

      @super_heroes = SuperHero.all
      erb :team
    end


end

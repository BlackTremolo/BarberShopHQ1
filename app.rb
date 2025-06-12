require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "barbershop.db"}

class Client < ActiveRecord::Base 
	validates :name, presence: true, length: {minimum: 3} 
	validates :phone, presence: true
	validates :datestamp, presence: true
	validates :color, presence: true
end  

class Barber < ActiveRecord::Base 
end  

before do 
	@barbers = Barber.all
end

get '/' do
	#@barbers = Barber.order 'created_at DESC'
	erb :index
end

get '/visit' do  
	@c = Client.new
	erb :visit
end 

post '/visit' do 
	
	@c = Client.new params[:client]

	if @c.save
		erb :visit	
	else 
		@error  = @c.errors.full_messages.first
		erb :visit
	end			

	# @user_name = params[:username]
	# @phone = params[:phone]
	# @date_time = params[:datetime]
	# @barber = params[:barber]
	# @color = params[:color]

	# c = Client.new
	# c.name = @user_name
	# c.phone = @phone
	# c.datestamp = @date_time
	# c.barber = @barber 
	# c.color = @color
	# c.save

end	 

get '/barber/:id' do 
	@barber = Barber.find(params[:id])
	erb :barber
end
  	

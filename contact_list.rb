require 'sinatra'
require 'sinatra/activerecord'
require './models/contact'
require './models/number'

set :database, 'sqlite3:development.sqlite3'


get '/contacts' do
	@contacts = Contact.all
	erb :contacts
  
end

get '/contacts/new' do
	erb :contact_new
end

post '/contacts' do
	@contact = Contact.new(name: params[:name])
	if @contact.valid?
		@contact.save
	else
		# unter webapps for beginners, sessions, message
		# show page: wenn auf name klicken, neue form, telefonnummer hinzufuegen koennen

	end
	
	
	redirect "/contacts"
end



get '/contacts/:id/profile' do    
	@contact= Contact.find(params[:id])
	#@contacts = Contact.all
	#@number = Number.new(number: params[:number]) #???
	erb :contact_profile
end

post '/contacts/:id/profile' do
	@contact= Contact.find(params[:id])
	@number = @contact.numbers.create(number: params[:number_id])   #???
	erb :contact_profile

end



get '/contacts/:id/edit' do
	@contact= Contact.find(params[:id])
	erb :contact_edit
end


put '/contacts/:id' do
	@contact= Contact.find(params[:id])
	@contact.update(name: params[:name])
	 if @contact.valid?
     @contact.save
		end
	redirect "/contacts"
end


get '/contacts/:id/delete' do
	@contact= Contact.find(params[:id])
	
	erb :contact_delete
end


delete '/contacts/:id/delete' do
	@contact= Contact.find(params[:id])
	@contact.destroy
	redirect '/contacts'
end







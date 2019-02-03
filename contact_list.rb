require 'sinatra'
require 'sinatra/activerecord'
require './models/contact'

set :database, 'sqlite3:development.sqlite3'


get '/contacts' do
	@contacts = Contact.all
	erb :contacts
  
end

get '/contacts/new' do
	erb :contact_new
end

post '/contacts' do
	Contact.create(name: params[:name])
	redirect "/contacts"

end


get '/contacts/:id/edit' do
	erb :contact_edit
end


put '/contacts/:id' do
	Contact.update(name: params[:name])
	erb :contacts
	end
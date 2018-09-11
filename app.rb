require 'sinatra'
require_relative 'tic_tac_toe.rb'

get '/' do
	erb :tic_tac_toe, locals:{}
end
post '/' do
	erb :tic_tac_toe, locals:{}
end
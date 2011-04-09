#!/usr/local/bin/ruby -rubygems

require 'sinatra'
require 'haml'
require 'sass'

configure do
  # ...
end

helpers do
  # ...
end

get '/stylesheet.css' do
  scss :stylesheet, :style => :compact
end

get '/' do
  haml :show
end

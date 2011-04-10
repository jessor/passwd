#!/usr/local/bin/ruby -rubygems

require 'sinatra'
require 'haml'
require 'sass'

configure do
  set :haml, :format => :html5
end

helpers do
  def simple
    [('a'..'z'),('0'..'9')].map{|i| i.to_a}.flatten
  end

  def special
    [('a'..'z'),('0'..'9'),'!', '§', '$', '%', '&', '/', '(', ')', '=', '?', '²', '³', '{', '[', ']', '}', '~', '#', '-', '_' ].map{|i| i.to_a}.flatten
  end

  def generate_password(chars)
    (0..9).map{ chars[rand(chars.length)] }.join
  end

  def generate_passwords(type)
    (0...10).map do |i|
      generate_password(type)
    end
  end
end

get '/stylesheet.css' do
  scss :stylesheet, :style => :compact
end

get '/' do
  @passwords = Array.new
  haml :show
end

#!/usr/local/bin/ruby -rubygems

require 'sinatra'
require 'haml'
require 'sass'

configure do
  set :haml, :format => :html5
end

helpers do
  def simple
    [('a'..'z'),('A'..'Z'),('0'..'9')].map{|i| i.to_a}.flatten
  end

  def special
    [('a'..'z'),('A'..'Z'),('0'..'9'),'!', '§', '$', '%', '&', '/', '(', ')', '=', '?', '²', '³', '{', '[', ']', '}', '~', '#', '-', '_' ].map{|i| i.to_a}.flatten
  end

  def nice
    ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'j', 'k', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', '2', '3', '4', '5', '6', '7', '8', '9'].map{|i| i.to_a}.flatten
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

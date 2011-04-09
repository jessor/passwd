require 'rubygems'
require 'bundler'
require 'sinatra'
require 'passw'

Bundler.require
set :run => false

run Sinatra::Application

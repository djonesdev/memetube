require "sinatra"
require "sinatra/reloader" if development?
require_relative './controllers/post_controller.rb'
require "pg"
require_relative "./models/Post.rb"

 use Rack::MethodOverride

run PostsController
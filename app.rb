# vim:encoding=utf-8
require 'rubygems'
require 'bundler'
Bundler.require

def glitch
  content_type :text
  options = {}
  options[:upper]  = params[:u]
  options[:middle] = params[:m]
  options[:lower]  = params[:l]
  params[:str].to_glitch options
end

def both(p, o = {}, &b)
  get(p,o,&b)
  post(p,o,&b)
end

both '/' do
  if params[:str]
    glitch
  else
    haml :index
  end
end

both '/:str' do
  glitch
end


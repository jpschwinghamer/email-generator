require "sinatra"
require "slim"
require "sass"
require "compass"
require "premailer"
require "nokogiri"

set :bind, '0.0.0.0'

get '/' do
  slim :index
end

get '/premailer' do
  premailer = Premailer.new('http://localhost:5000/', :warn_level => Premailer::Warnings::SAFE)
  File.open("output.html", "w") do |fout|
    fout.puts premailer.to_inline_css
  end
end

require 'sinatra'
require 'haml'
require 'airbrake'

Airbrake.configure do |config|
  config.api_key = ENV['AIRBRAKE_API_KEY']
end

use Airbrake::Rack
enable :raise_errors

get '/?' do
  "This is the #{ENV['RACK_ENV']} environment"
end

get '/error/?' do
  haml :error_generator
end

get '/generate-error/?' do
  raise 'Someone pressed the button'
end

__END__

@@ layout
%html
  %body{:style => 'text-align: center;'}
    = yield

@@ error_generator
%p{:style => 'font-weight: bold;'}
  Don't Press This Button
%a{:style => 'background: url("/red_button.jpeg") no-repeat center center; display: block; height: 225px;', :href => '/generate-error'}

require 'sinatra'
require 'haml'

get '/?' do
  haml :home
end

__END__

@@ layout
%html
  %body{:style => 'text-align: center; font-weight: bold; font-size: 90px; color: white; background: black url("/fire.jpg") no-repeat top center; font-family: helvetica; text-shadow: 2px 2px black'}
    = yield

@@ home
%br
%p
  Hello
%p
  Agile Horizons


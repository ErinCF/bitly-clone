# require 'byebug'
#Run it on http://localhost:9393/

get '/' do
  @url = Url.all
  erb :"static/index" #when someone clicks on homepage, i load static/index page (pathway of location of the index page)
  #let user create new short URL, display a list of shortened URLs
end

post '/urls' do
  #creates the new record in the database..but prior to that it will trigger the before_create in url.rb
  data = Url.create(url_long: params[:long_url], click_count: 0)
  redirect '/'
end

#additional function..given the short url, one click button to redirect to actual website "long url"
post '/urls1' do
  data = Url.find_by(url_short: params[:short_url])
  retrieved_url=data.url_long
  redirect retrieved_url
end

get '/:short_url' do
  #redirect to appropriate "long" url
  data = Url.find_by(url_short: params[:short_url])
  data.counting_clicks #to call the counting click methods so that it increases the count by 1
  redirect to "#{data.url_long}"
end
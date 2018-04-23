require "sinatra"

get "/:story" do
  erb :story
end

get "/output" do
  erb :output
end

post "/:story" do
  @name_of_story = params["story"]
  @noun = params["noun_arr"]
  @verb = params["verb_arr"]
  @adjective = params["adjective_arr"]
  erb :output
end

not_found do
  status 404
  halt 404, "Error 404, Page not found"
end

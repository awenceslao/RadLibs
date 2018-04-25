require "sinatra"

get "/" do
  erb :h
end

get "/upload" do
  erb :upload
end

get "/:story" do
  @name_of_story = params["story"]
  erb :s
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

post "/upload" do
  File.open("uploads/" + params["myfile"][:filename], "w") do |f|
    f.write(params["myfile"][:tempfile].read)
  end
end

not_found do
  status 404
  halt 404, "Error 404, Page not found"
end

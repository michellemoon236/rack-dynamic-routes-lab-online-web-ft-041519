class Application
 
  @@songs = [Song.new("Sorry", "Justin Bieber"),
            Song.new("Hello","Adele")]
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/items/)
 
      item_name = req.path.split("/items/").last 
      item = Items.all.find{|i| i.name == item_name}
      if item
        resp.write item.price
      else
        resp.write "Route not found"
        resp.status = 404
    else
      resp.write "Route not found"
      resp.status = 404
    end
 
    resp.finish
  end
end
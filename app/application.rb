class Application 

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
  #binding.pry
        if req.path.include?("/items")
            item_name = req.path.split("/items/").last
            found_item = @@items.select {|item| item.name == item_name}
                if found_item != []
                    resp.write "#{found_item[0].price}"
                    resp.status = 200
                else 
                    resp.write "Item not found"
                    resp.status = 400
                end
        else
            resp.write "Route not found"
            resp.status = 404
            
        end
        resp.finish
    end
end
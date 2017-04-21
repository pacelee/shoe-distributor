require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
also_reload("lib/*.rb")
require('pry')

get("/") do
  @shoes = Shoe.all()
  @stores = Store.all()
  erb(:index)
end

post("/shoes") do
  name = params.fetch("name").capitalize()
  shoe = Shoe.new({:brand => name, :id => nil})
  shoe.save()
  redirect("/")
end

delete("/shoe_delete") do
  shoe_id = Shoe.find(params.fetch("shoe_id").to_i())
  shoe_id.delete()
  redirect("/")
end

post("/stores") do
  name = params.fetch("name").capitalize()
  location = params.fetch("location").capitalize()
  store = Store.new({:name => name, :location => location, :id => nil})
  store.save()
  redirect("/")
end

get("/shoes/:id") do
  @shoe = Shoe.find(params.fetch("id"))
  @stores = Store.all()
  erb(:shoe)
end

delete("/store_delete") do
  store_id = Store.find(params.fetch("store_id").to_i())
  store_id.delete()
  redirect("/")
end

get("/stores/:id") do
  @store = Store.find(params.fetch("id"))
  @shoes = Shoe.all()
  erb(:store)
end

post('/shoe_add') do
  shoe_id = params.fetch('shoe_id').to_i
  shoe = Shoe.find(shoe_id)
  self_id = params.fetch('self_id')
  store = Store.find(params.fetch('self_id'))
  shoe.stores << store
  redirect("stores/#{store.id}")
end

post('/store_add') do
  store_id = params.fetch('store_id').to_i
  store = Store.find(store_id)
  self_id = params.fetch('self_id')
  shoe = Shoe.find(params.fetch('self_id'))
  store.shoes << shoe
  redirect("shoes/#{shoe.id}")
end

patch('/store_update') do
  self_id = params.fetch('self_id')
  store = Store.find(params.fetch('self_id').to_i)
  name = params.fetch('name').capitalize()
  location = params.fetch('location').capitalize()
  store.update({:name => name, :location => location})
  redirect("/stores/#{store.id}")
end

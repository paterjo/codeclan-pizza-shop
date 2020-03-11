require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('models/pizza_order')
also_reload('./models/*')

get'/pizza-orders' do
  @orders = PizzaOrder.all()
   #Should be the PizzaOrder.all method
  #Render some kind of view called index
erb(:index)
end

get '/pizza-orders/new' do
  erb(:new)
end

post '/pizza-orders/:id/delete' do
  @order = PizzaOrder.find(params[:id])
  @order.delete
  redirect '/pizza-orders'
end

post '/pizza-orders/:id/edit' do
  @order = PizzaOrder.find(params[:id])
 erb(:edit)
end

post '/pizza-orders/:id/update' do
  @order = PizzaOrder.new(params)
  @order.update
  redirect '/pizza-orders'
end


get '/pizza-orders/:id' do
  @order = PizzaOrder.find(params[:id])
erb(:show)
end

post '/pizza-orders' do
  @order = PizzaOrder.new(params)
  @order.save()
erb(:create)
end

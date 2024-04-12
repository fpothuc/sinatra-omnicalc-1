require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:home)
end

get("/square/new") do
  erb(:square_new)
end

get("/square/results") do
  @num = params.fetch("square").to_f
  @num_sqr = @num ** 2

  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root_new)
end

get("/square_root/results") do
  @num = params.fetch("square_root").to_f
  @num_sqrt = @num ** 0.5
  
  erb(:square_root_results)
end

get("/payment/new") do
  erb(:payment_new)
end

get("/payment/results") do
  @apr = params.fetch("").to_f
  @years = params.fetch("").to_f
  @principle = params.fetch("").to_f

  @periods = @years * 12
  @monthly_payment = (@apr * @principle) / ((1-(1 + @apr)) ** (-1 * @periods))

  erb(:payment_results)
end

get("/random/new") do
  erb(:random_new)
end

get("/random/results") do
  @min = params.fetch("rand_min").to_f
  @max = params.fetch("rand_max").to_f
  @rand_num = rand(@min..@max)

  erb(:random_results)
end

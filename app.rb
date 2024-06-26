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
  @apr = params.fetch("apr").to_f
  @years = params.fetch("years").to_f
  @principal = params.fetch("principal").to_f

  @monthly_pr = @apr / 1200
  @periods = @years * 12
  @numerator = @monthly_pr * @principal
  @denominator = 1 - ((1 + @monthly_pr) ** (-1 * @periods))

  @monthly_payment = @numerator / @denominator
  @monthly_dollars = @monthly_payment.to_fs(:currency)

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

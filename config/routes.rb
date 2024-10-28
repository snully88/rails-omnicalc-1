Rails.application.routes.draw do

  get("/", { :controller => "zebra", action: "rules"})

  get("/square/new", { :controller => "zebra", action: "new_square_calc"})

  get("/square/results", { :controller => "zebra", action: "square_results"})

  get("/square_root/new", { :controller => "zebra", action: "square_root_new"})

  get("/square_root/results", { :controller => "zebra", action: "results_square_root"})

  get("/random/new", { :controller => "zebra", action: "random_new"})

  get("/random/results", { :controller => "zebra", action: "random_results"})

  get("/payment/new", { :controller => "zebra", action: "payment_new"})

  get("/payment/results", { :controller => "zebra", action: "payment_results"})
end

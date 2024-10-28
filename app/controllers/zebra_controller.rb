class ZebraController < ApplicationController
  
  def rules
    render({ :template => "game_templates/rules"})
  end

  def new_square_calc
    render({ :template => "game_templates/new_square_calc"})
  end

  def square_results
    @the_num = params.fetch("users_number").to_f

    @the_result = @the_num ** 2
    render({ :template => "game_templates/square_results"})
  end

  def square_root_new
    render({ :template => "game_templates/square_root_new"})
  end

  def square_root_results
    @the_num = params.fetch("users_number").to_f

    @the_result = Math.sqrt(@the_num).round(3)
    render({ :template => "game_templates/square_root_results"})
  end

  def random_new
    render({ :template => "game_templates/random_new"})
  end

  def random_results
    @the_min = params.fetch("user_min").to_f
    @the_max = params.fetch("user_max").to_f
    
    @the_result = rand(@the_min..@the_max)

  render({ :template => "game_templates/random_results"}) 
  end

  def payment_new
    render({ :template => "game_templates/payment_new"})
  end

  def payment_results
    @the_apr = params.fetch("user_apr").to_f / 100 / 12
    @the_years = params.fetch("user_years").to_f
    @the_pv = params.fetch("user_pv").to_f
    n = @the_years * 12

    # Calculate the numerator and denominator separately for debugging
    @numerator = @the_apr * @the_pv
    @denominator = 1 - (1 + @the_apr) ** (-n)
    
    # Calculate the monthly payment using the formula
    if @the_apr == 0
      # If the APR is 0, the formula simplifies to pv/n
      @the_payment = @the_pv / n
    else
      # Using the full formula when APR is not 0
      @the_payment = (@numerator / @denominator).to_fs(:currency)
    end
  render({ :template => "game_templates/payment_results"})
  end
  
end

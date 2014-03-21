class MainController < ApplicationController

  def order_form
    @order = FrameOrder.new
    @materials = Material.order(:name)
    render :order_form and return
  end

  def place_order
  
    @order = FrameOrder.new
    material = params["material"]
    @order.material_id   = Material.find_by(name: material).id
    @order.linear_inches = params["linear_inches"]
    @order.include_hanging_hardware = params["include_hanging_hardware"]
    
    if @order.material.name == "Black Satin"
      total_price = 5.30
    elsif @order.material.name == "Brentwood"
      total_price = 8.60
    elsif @order.material.name == "Fine Bamboo"
      total_price = 11.80
    elsif @order.material.name == "Town and Country"
      total_price = 6.10
    end
    
    if @order.linear_inches != nil
      total_price = total_price + @order.linear_inches
      if @order.include_hanging_hardware
        total_price = total_price + 0.50
      end
      @order.total_price = total_price
    end
    
    if @order.save
#       render :thank_you and return
        flash[:info] = "Thank you for your order"
        redirect_to "/" and return
    else
      render :order_form and return
    end    
    
  end
  
  def list_orders
    @orders = FrameOrder.all
    render :list_orders
  end
  
end

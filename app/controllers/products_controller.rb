class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new 
    @product = Product.new
  end

  def create
    @product = Product.new(permit_params)
    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end  

  private
    def permit_params
      params.expect(product: [ :name, :price, :quantity ])
    end

end

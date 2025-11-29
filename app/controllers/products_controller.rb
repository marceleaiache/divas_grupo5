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

  def edit 
    @product = Product.find(params[:id])
  end

  def update 
    @product = Product.find(params[:id])
    if @product.update(permit_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def permit_params
      params.expect(product: [ :name, :price, :quantity ])
    end

end

class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @products = Product.find(params[:id])
  end

  def new
    @products = Product.new
  end

  def create
     @products = Product.new(product_pamams)
     if product.save
       redirect_to @product, notice: "Produto criado com sucesso!"
     else
        render :new
     end
  end

  def edit
    @products = Product.find(params[:id])
  end

  def update
    @products = Product.find(params[:id])
    if product.update
      redirect_to @product, notice: "Produto atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    @products = Product.find(params[:id])
    @products.destroy
    redirect_to products_url, notice: "Produto excluído com sucesso!"
  end


  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end
end

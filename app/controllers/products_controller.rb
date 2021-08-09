class ProductsController < ApplicationController
    before_action :set_product, only: [:edit, :update, :show, :destroy]
    def index
        @products = Product.all.order(created_at: :desc)
    end
    def new
        @product = Product.new
    end
    def create
        @product = current_user.products.build(product_params)
        if params[:back]
            render :new
        else
            if @product.save
                redirect_to products_path, notice: "New product create with success"
            else
                render :new
            end
        end
    end
    def confirm
        @product = current_user.products.build(product_params)
        render :new if @product.invalid?
    end
    def edit
    end
    def show
    end
    def update
        if @product.update(product_params)
            redirect_to products_path, notice: "Product update with success"
        else
            render :edit
        end
    end
    def destroy
        @product.destroy
        redirect_to products_path, notice: "Product delete with success"
    end


    private
    def product_params
        params.require(:product).permit(:title, :price, :image, :image_cache)
    end
    def set_product
        @product = Product.find(params[:id])
    end
end

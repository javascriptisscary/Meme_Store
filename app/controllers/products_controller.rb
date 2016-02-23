class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  
  # GET /products
  # GET /products.json
  

  
  def index
    @user = current_user
    if params[:q]
      search_term = params[:q]
       if Rails.env.production?
        @products = Product.where("name ilike ?", "%#{search_term}%")
      else
        @products = Product.where("name LIKE ?", "%#{search_term}%")
       end
       
      
    else
      @products = Product.all
      
      
    end
  end


    


  # GET /products/1
  # GET /products/1.json
  def show
    @user = current_user
   
    @comments = @product.comments.order("created_at DESC")
    @comments = @product.comments.all.order("created_at DESC").paginate(page: params[:page], per_page: 3) 
  end

  # GET /products/new
  def new
    @product = Product.new
     @user = current_user
  end

  # GET /products/1/edit
  def edit
     @user = current_user
  end

  def thank_you
  @user = current_user
  @name = params[:name]
  @email = params[:email]
  @message = params[:message]
  ActionMailer::Base.mail(:from => @email, 
        :to => 'crazedpokerplayer@mail.com', 
        :subject => "A new contact form message from #{@name}", 
        :body => @message).deliver
  end

  
  
  
  # POST /products
  # POST /products.json
  def create
    @user = current_user
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @user = current_user
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @user = current_user
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :image_url, :color, :size, :price, :meme)
    end
end

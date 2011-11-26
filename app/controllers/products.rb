Merchant.controllers :products do
  # get :index, :map => "/foo/bar" do
  #   session[:foo] = "bar"
  #   render 'index'
  # end

  # get :sample, :map => "/sample/url", :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   "Maps to url '/foo/#{params[:id]}'"
  # end

  # get "/example" do
  #   "Hello world!"
  # end
  layout :products

  get :new do

  end

  post :index do
  end

  get :index do
    @products = {}
    Product.all.each do |product|
      @products[product.name] = product.price
    end
    p "here"
    render 'products/index'
  end

end

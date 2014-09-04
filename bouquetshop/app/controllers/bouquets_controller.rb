class BouquetsController < ApplicationController

  def home
  @bouquets = Bouquet.all
  end

  def new
  
  end 
  
 def create
 @bouquet = Bouquet.new(bouquet_params)
  flowers = params[:flowers]
 if flowers.nil?
 flash.now[:notice]="EROOOOOO"
 redirect_to show_url
 else
  
 @bouquet.flowers = flowers.join(" ")
  if @bouquet.save
            redirect_to home_url
      else
            @bouquets = Bouquet.find(:all)
            render :action => 'new'
      end
end
end
 
 
 def destroy
      Bouquet.find(params[:id]).destroy
      redirect_to home_url
   end
  
  def delete
      Bouquet.find(params[:id]).destroy
      redirect_to home_url
   end
  def edit
  
  @bouquets=Bouquet.find(params[:id]) 
  @flowers = @bouquets.flowers
  @flowers=@flowers.split(" ")
 
   end
 
  def show
 
 
  end
 
  def view
  @bouquets=Bouquet.find(params[:id]) 
 # id=@bouquets.attributes['id']
 
  end

 def update
  @bouquets = Bouquet.find(params[:id])
flowers = params[:flowers]
 @bouquets.flowers = flowers.join(" ")
  if @bouquets.update(bouquet_params)
    render 'view'
  else
    render 'edit'
  end
end

  
  def bouquet_params
    params.require(:bouquet).permit(:name, :category, :arrangement, :occasion, :h_delivery, :flowers, :price)
end

end

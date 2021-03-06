class MenusController < ApplicationController

 def index
  @menus = Menu.order('created_at')
 end

 def new

  @pub = Pub.find(params[:pub_id])
  if @pub.menu
    flash[:warning] = "Before you add a new menu, you have to delete the existing one!"
    redirect_to @pub
  end

  @menu = Menu.new

 end


 def create
  @pub = Pub.find(params[:pub_id])
  input = menu_params.merge(pub: @pub)
  @menu = @pub.build_menu(input)

  if @menu.save
   flash[:success] = "Successfully added new menu!"
   redirect_to @pub
  else
   flash[:danger] = "Error adding new menu!"
   render :new
  end
 end

 def destroy
  @pub = Pub.find(params[:pub_id])
  @menu = Menu.find(params[:id])
    if @menu.destroy
      flash[:success] = "Successfully deleted menu!"
      redirect_to @pub
    else
      flash[:danger] = "Error deleting menu!"
    end
  end

 private

 #Permitted parameters when creating a photo. This is used for security reasons.
 def menu_params
  params.require(:menu).permit(:document, :pub)
 end

end

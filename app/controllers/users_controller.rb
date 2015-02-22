class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    #the form generates at new.html.erb generates a post request with param, a hash of hashes including the user hash with the
    #fields defined at the form.
    #Writting User.new(params[:user]) would not be save, since one could fake parames such as admin and this would be dangerous
    #but it would be equivalent to User.new(name: "Foo Bar", email: "foo@invalid", password: "foo", password_confirmation: "bar")
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!" #flash displays temporary messages and we can treat it like a hash 
      												 #success is a convention to indicate a successful result
      redirect_to @user #equivalent to redirect_to user_url(@user)
    else
      render 'new'
    end
  end

  private

  def user_params
    # we want to require the params hash to have a :user attribute,
    #and we want to permit the name, email, password, and password confirmation attributes (but no others).
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

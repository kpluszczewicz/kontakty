class UsersController < ApplicationController
  before_filter :authenticate,  :only => [:index, :edit, :update, :destroy]
  before_filter :correct_user,  :only => [:edit, :update, :show] 
  before_filter :admin_user,    :only => :destroy
  def new
    @user = User.new
    @title = "Sign up"
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Siemka"
      redirect_to @user
    else
      @title = "Sign up"
      @user.password = @user.password_confirmation = ""
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @contacts = @user.contacts.paginate(:page => params[:page])
  end

end

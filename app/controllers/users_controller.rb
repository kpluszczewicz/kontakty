class UsersController < InheritedResources::Base
  before_filter :authenticate,  :only => [:index, :edit, :update, :destroy]
  before_filter :correct_user,  :only => [:edit, :update, :show] 
  before_filter :admin_user,    :only => [:index, :destroy]

  def create
    create! { @user.password = @user.password_confirmation = "" unless @user.save }
  end

  def show
    show! {user_contacts_path(@user)}
  end

  protected

  def collection
    @users ||= end_of_association_chain.paginate(:page => params[:page])
  end

    
end

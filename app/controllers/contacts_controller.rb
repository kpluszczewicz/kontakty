class ContactsController < ApplicationController
  before_filter :authenticate, :only => :show
  before_filter :contact_owner, :only => [ :show, :destroy]

  def show
    @contact = Contact.find(params[:id])
  end

  def destroy
    @contact.destroy
    flash[:success] = "Pomyslnie usunieto"
    redirect_back_or root_path
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = current_user.contacts.build(params[:contact]) 
    if @contact.save
      flash[:success] = "Pomyslnie dodano nowy kontakt"
      redirect_to current_user
    else
      render 'new'
    end
  end

end

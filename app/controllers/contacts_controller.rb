class ContactsController < ApplicationController
  before_filter :authenticate, :only => :show
  before_filter :contact_owner, :only => [:show, :destroy]

  def show
    @contact = Contact.find(params[:id])
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
  end
end

class ContactsController < InheritedResources::Base
  belongs_to :user

  before_filter :authenticate, :only => :show
  before_filter :contact_owner, :only => [ :show, :destroy]


  #def show
    #@contact = Contact.find(params[:id])
  #end

  #def destroy
    #@contact.destroy
    #flash[:success] = "Pomyslnie usunieto"
    #redirect_back_or root_path
  #end

  #def new
    #@user = User.find(params[:user_id])
    #@contact = Contact.new
  #end

  #def create
    #@contact = current_user.contacts.build(params[:contact]) 
    #if @contact.save
      #flash[:success] = "Pomyslnie dodano nowy kontakt"
      #redirect_to current_user
    #else
      #render 'new'
    #end
  #end

  #protected

  #def begin_of_association_chain
    #@user = User.find(params[:id])
  #end

  def collection
    @contacts ||= end_of_association_chain.paginate(:page => params[:page])
  end

end

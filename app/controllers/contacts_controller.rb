class ContactsController < InheritedResources::Base
  belongs_to :user

  before_filter :authenticate, :only => [ :show, :index]
  before_filter :contact_owner, :only => [ :show, :destroy]

  def update 
    update! { user_contacts_path(@user)  }
  end

  def collection
    @contacts ||= end_of_association_chain.paginate(:page => params[:page])
  end

end

module ApplicationHelper

  def logo
    image_tag "logo.png", :alt => I18n.t('general.appname'), :class => "round logo"
  end

end

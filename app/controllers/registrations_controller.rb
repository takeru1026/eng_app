class RegistrationsController < Devise::RegistrationsController
  before_action :configure_account_update_params, only: [:update]
  prepend_before_action :authenticate_scope!, only: [:edit, :edit_password, :update, :update_password, :destroy] 
  prepend_before_action :set_minimum_password_length, only: [:new, :edit, :edit_password]
  
  def edit_password; end
    
  def update_password
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      set_flash_message_for_update(resource, prev_unconfirmed_email)
      bypass_sign_in resource, scope: resource_name if sign_in_after_change_password?

      respond_with resource, location: after_update_path_for(resource)
    else
      clean_up_passwords resource
      set_minimum_password_length
      #この1行を書き換えた
      render 'edit_password'
    end
  end
  
  protected
  
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :birthday, :postcode, :prefecture_code, :address_city, :address_street, :address_building])
    end
  
    def update_resource(resource, params)
      resource.update_without_current_password(params)
    end
end

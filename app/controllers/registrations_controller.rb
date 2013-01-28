class Admins::RegistrationsController < Devise::RegistrationsController
layout 'admins/layouts/application.html.erb'

private
def after_sign_out_path_for(resource_or_scope)
  new_admin_session_path
end

def after_sign_in_path_for(resource)
    stored_location_for(resource) || admins_root_path
end

end

class CreateAdminService
  def call
    role = Role.find_or_create_by!(name: Rails.application.secrets.admin_role)

    user = role.users.find_or_create_by!(email: Rails.application.secrets.admin_email) do |user|
        user.password = Rails.application.secrets.admin_password
        user.password_confirmation = Rails.application.secrets.admin_password
        user.name= Rails.application.secrets.admin_name
      end
  end
end

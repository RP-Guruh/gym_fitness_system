module ApplicationHelper
  def province_name(id)
    Province.find(id).name
  end

  def role_name(id)
    Role.find(id).name
  end
end

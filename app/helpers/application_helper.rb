module ApplicationHelper
  def province_name(id)
    Province.find(id).name
  end
end

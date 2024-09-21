module ApplicationHelper
  def province_name(id)
    Province.find(id).name
  end

  def role_name(id)
    Role.find(id).name
  end

  def number_to_idr(amount)
    number_to_currency(amount, unit: "Rp ", separator: ",", delimiter: ".")
  end
end

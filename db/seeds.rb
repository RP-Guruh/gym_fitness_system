# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# SEEDER PROVINSI

Province.create([
  { name: "ACEH" },
  { name: "SUMATERA UTARA" },
  { name: "SUMATERA BARAT" },
  { name: "RIAU" },
  { name: "JAMBI" },
  { name: "SUMATERA SELATAN" },
  { name: "BENGKULU" },
  { name: "LAMPUNG" },
  { name: "KEPULAUAN BANGKA BELITUNG" },
  { name: "KEPULAUAN RIAU" },
  { name: "DKI JAKARTA" },
  { name: "JAWA BARAT" },
  { name: "JAWA TENGAH" },
  { name: "DAERAH ISTIMEWA YOGYAKARTA" },
  { name: "JAWA TIMUR" },
  { name: "BANTEN" },
  { name: "BALI" },
  { name: "NUSA TENGGARA BARAT" },
  { name: "NUSA TENGGARA TIMUR" },
  { name: "KALIMANTAN BARAT" },
  { name: "KALIMANTAN TENGAH" },
  { name: "KALIMANTAN SELATAN" },
  { name: "KALIMANTAN TIMUR" },
  { name: "KALIMANTAN UTARA" },
  { name: "SULAWESI UTARA" },
  { name: "SULAWESI TENGAH" },
  { name: "SULAWESI SELATAN" },
  { name: "SULAWESI TENGGARA" },
  { name: "GORONTALO" },
  { name: "SULAWESI BARAT" },
  { name: "MALUKU" },
  { name: "MALUKU UTARA" },
  { name: "PAPUA" },
  { name: "PAPUA BARAT" },
  { name: "PAPUA SELATAN" },
  { name: "PAPUA TENGAH" },
  { name: "PAPUA PEGUNUNGAN" },
])

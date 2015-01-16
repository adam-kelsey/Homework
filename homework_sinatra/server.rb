require 'sinatra'
require 'faker'

get '/' do
  @img_src = Faker::Avatar.image
  puts '#' * 50
  puts @img_src
  puts '#' * 50
  erb :index
end

get '/chemicals' do
  @chemicals = [
    {
      atomic_number: "38",
      symbol: "Sr",
      element_name: "Strontium",
      atomic_mass: "87.62"
    },
    {
      atomic_number: "12",
      symbol: "Mg",
      element_name: "Magnesium",
      atomic_mass: "24.3050"
    },
    {
      atomic_number: "5",
      symbol: "B",
      element_name: "Boron",
      atomic_mass: "10.811"
    },
    {
      atomic_number: "3",
      symbol: "Li",
      element_name: "Lithium",
      atomic_mass: "6.941"
    }
  ]
  erb :chemical_index, layout: :layout
end

get '/fire_pic' do
  @fire_pic = [
    {
      atomic_name: "Strontium",
      img_url: "http://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Flammenf%C3%A4rbungSr.png/320px-Flammenf%C3%A4rbungSr.png",
      img_class: "strontium_class"
    },
    {
      atomic_name: "Magnesium",
      img_url: "http://www.angelo.edu/faculty/kboudrea/demos/burning_magnesium/BurningMg05.jpg",
      img_class: "magnesium_class"
    },
    {
      atomic_name: "Boron",
      img_url: "http://upload.wikimedia.org/wikipedia/commons/6/62/Flammenf%C3%A4rbungB.png",
      img_class: "boron_class"
    },
    {
      atomic_name: "Lithium",
      img_url: "http://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Flammenf%C3%A4rbungLi.png/320px-Flammenf%C3%A4rbungLi.png",
      img_class: "lithium_class"
    }
  ]
  erb :fire_index, layout: :layout
end






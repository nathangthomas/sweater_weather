FactoryBot.define do
  factory :forcast do
    city { "MyString" }
    state { "MyString" }
    country { "MyString" }
    temperature { "MyString" }
    high { 1.5 }
    low { 1.5 }
    humidity { 1.5 }
    visability { 1.5 }
    uv_index { 1.5 }
  end
end

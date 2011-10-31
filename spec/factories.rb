Factory.define :user do |user|
  user.name "Matthew Berman"
  user.email "mberman84@gmail.com"
  user.password "foobar"
  user.password_confirmation "foobar"
end

Factory.define :event do |event|
  event.name "Test event"
  event.description "test event description"
  event.owner_id ""
  event.category "test_category"
  event.location "123 Geary Street"
  event.photo File.new(Rails.root + 'spec/fixtures/images/test_img.jpeg')
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end
# By using the symbol ':user', we get Factory Girl to simulate the User model.
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
  event.photo File.new(Rails.root + 'spec/fixtures/images/test_img.jpeg')
  #event.association :user
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end
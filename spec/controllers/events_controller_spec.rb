require 'spec_helper'

describe EventsController do
  render_views
  
  describe "access control" do
    it "should deny access to 'create'" do
      post :create
      response.should redirect_to(signin_path)
    end

    it "should deny access to 'destroy'" do
      delete :destroy, :id => 1
      response.should redirect_to(signin_path)
    end
  end
  
  describe "success" do
    
    before(:each) do
      @attr = { :name => "Test event",
                :description => "This is a sample description.",
                :category => "test_category",
                :location => "123 Geary Street",
                :photo => File.new(Rails.root + 'spec/fixtures/images/test_img.jpeg') }
    end
    
    before(:each) do
      @user = test_sign_in(Factory(:user))
    end
    
    it "should create an event" do
      lambda do
        post :create, :event => @attr
      end.should change(Event, :count).by(1)
    end
    
    it "should redirect to the event path" do
      post :create, :event => @attr
      response.should redirect_to(events_path)
    end
  end
  
  describe "DELETE 'destroy'" do

    describe "for an unauthorized user" do

      before(:each) do
        wrong_user = Factory(:user, :email => Factory.next(:email))
        @event = Factory(:event)
        @event.users << Factory(:user)
        test_sign_in(wrong_user)
      end

      it "should deny access" do
        delete :destroy, :id => @event
        response.should redirect_to(root_path)
      end
    end
    
    describe "for an authorized user" do
      
      before(:each) do
        @user = test_sign_in(Factory(:user))
        @event = Factory(:event)
        @event.owner_id = @user.id
      end
    end
  end
end  
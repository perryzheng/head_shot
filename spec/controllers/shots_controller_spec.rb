require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ShotsController do

  # This should return the minimal set of attributes required to create a valid
  # Shot. As you add validations to Shot, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {:user_id => 2, :content => 'hello world', :push_url => 'http://sn1.notify.live.net/throttledthirdparty/01.00/AAGCRaSsL7K7TIB98x-UhjV6AgAAAAADAQAAAAQUZm52OjIzOEQ2NDJDRkI5MEVFMEQ'}
  end

  describe "GET index" do
    it "assigns all shots as @shots" do
      shot = Shot.create! valid_attributes
      get :index
      assigns(:shots).should eq([shot])
    end
  end

  describe "GET show" do
    it "assigns the requested shot as @shot" do
      shot = Shot.create! valid_attributes
      get :show, :id => shot.id.to_s
      assigns(:shot).should eq(shot)
    end
  end

  describe "GET new" do
    it "assigns a new shot as @shot" do
      get :new
      assigns(:shot).should be_a_new(Shot)
    end
  end

  describe "GET edit" do
    it "assigns the requested shot as @shot" do
      shot = Shot.create! valid_attributes
      get :edit, :id => shot.id.to_s
      assigns(:shot).should eq(shot)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Shot" do
        expect {
          post :create, :shot => valid_attributes
        }.to change(Shot, :count).by(1)
      end

      it "assigns a newly created shot as @shot" do
        post :create, :shot => valid_attributes
        assigns(:shot).should be_a(Shot)
        assigns(:shot).should be_persisted
      end

      it "redirects to the created shot" do
        post :create, :shot => valid_attributes
        response.should redirect_to(Shot.last)
      end
      
      it "should send a notification back to the phone" do
        url = valid_attributes[:push_url]
        Push.should_receive(:post).with(url, instance_of(Hash)).once
        
        post :create, :shot => valid_attributes
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved shot as @shot" do
        # Trigger the behavior that occurs when invalid params are submitted
        Shot.any_instance.stub(:save).and_return(false)
        post :create, :shot => {}
        assigns(:shot).should be_a_new(Shot)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Shot.any_instance.stub(:save).and_return(false)
        post :create, :shot => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested shot" do
        shot = Shot.create! valid_attributes
        # Assuming there are no other shots in the database, this
        # specifies that the Shot created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Shot.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => shot.id, :shot => {'these' => 'params'}
      end

      it "assigns the requested shot as @shot" do
        shot = Shot.create! valid_attributes
        put :update, :id => shot.id, :shot => valid_attributes
        assigns(:shot).should eq(shot)
      end

      it "redirects to the shot" do
        shot = Shot.create! valid_attributes
        put :update, :id => shot.id, :shot => valid_attributes
        response.should redirect_to(shot)
      end
    end

    describe "with invalid params" do
      it "assigns the shot as @shot" do
        shot = Shot.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Shot.any_instance.stub(:save).and_return(false)
        put :update, :id => shot.id.to_s, :shot => {}
        assigns(:shot).should eq(shot)
      end

      it "re-renders the 'edit' template" do
        shot = Shot.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Shot.any_instance.stub(:save).and_return(false)
        put :update, :id => shot.id.to_s, :shot => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested shot" do
      shot = Shot.create! valid_attributes
      expect {
        delete :destroy, :id => shot.id.to_s
      }.to change(Shot, :count).by(-1)
    end

    it "redirects to the shots list" do
      shot = Shot.create! valid_attributes
      delete :destroy, :id => shot.id.to_s
      response.should redirect_to(shots_url)
    end
  end

end

require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  render_views

  let!(:course) { FactoryGirl.create(:course) }
  let!(:valid_attributes) { FactoryGirl.attributes_for(:course)}

  describe "GET #index" do
    it "assigns all products as @products" do
      get :index

      expect(assigns(:courses)).to eq([course])
    end
  end

  describe "GET #edit" do
    it "assigns the requested course as @course" do
      get :edit, {id: course.id}
      expect(assigns(:course)).to eq(course)
    end
  end

  describe "GET #new" do
    it "assigns a new course as @course" do
      get :new
      expect(assigns(:course)).to be_a_new(Course)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Course" do
        expect {
          post :create, {course: valid_attributes}
        }.to change(Course, :count).by(1)
      end

      it "assigns a newly created course as @course" do
        post :create, {course: valid_attributes}
        expect(assigns(:course)).to be_a(Course)
        expect(assigns(:course)).to be_persisted
      end

      it "redirects to the list" do
        post :create, {course: valid_attributes}
        expect(response).to redirect_to(Course)
      end
    end
  end

end

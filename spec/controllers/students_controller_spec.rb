require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  render_views

  let!(:student) { FactoryGirl.create(:student) }
  let!(:valid_attributes) { FactoryGirl.attributes_for(:student)}

  describe "GET #index" do
    it "assigns all products as @products" do
      get :index

      expect(assigns(:students)).to eq([student])
    end
  end

  describe "GET #edit" do
    it "assigns the requested student as @student" do
      get :edit, {id: student.id}
      expect(assigns(:student)).to eq(student)
    end
  end

  describe "GET #new" do
    it "assigns a new student as @student" do
      get :new
      expect(assigns(:student)).to be_a_new(Student)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Student" do
        expect {
          post :create, {student: valid_attributes}
        }.to change(Student, :count).by(1)
      end

      it "assigns a newly created student as @student" do
        post :create, {student: valid_attributes}
        expect(assigns(:student)).to be_a(Student)
        expect(assigns(:student)).to be_persisted
      end

      it "redirects to the list" do
        post :create, {student: valid_attributes}
        expect(response).to redirect_to(Student)
      end
    end
  end

end

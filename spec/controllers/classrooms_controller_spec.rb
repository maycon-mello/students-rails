require 'rails_helper'

RSpec.describe ClassroomsController, type: :controller do
  render_views

  let!(:course) { FactoryGirl.create(:course) }
  let!(:student) { FactoryGirl.create(:student) }
  let!(:valid_attributes) {
    { course_id: course.id, student_id: student.id }
  }
  let!(:classroom) {
    Classroom.create(valid_attributes)
  }

  describe "GET #index" do
    it "assigns all products as @products" do
      get :index

      expect(assigns(:classrooms)).to eq([classroom])
    end
  end

  describe "GET #edit" do
    it "assigns the requested classroom as @classroom" do
      get :edit, {id: classroom.id}
      expect(assigns(:classroom)).to eq(classroom)
    end
  end

  describe "GET #new" do
    it "assigns a new classroom as @classroom" do
      get :new
      expect(assigns(:classroom)).to be_a_new(Classroom)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Classroom" do
        expect {
          post :create, {classroom: valid_attributes}
        }.to change(Classroom, :count).by(1)
      end

      it "assigns a newly created classroom as @classroom" do
        post :create, {classroom: valid_attributes}
        expect(assigns(:classroom)).to be_a(Classroom)
        expect(assigns(:classroom)).to be_persisted
      end

      it "redirects to the list" do
        post :create, {classroom: valid_attributes}
        expect(response).to redirect_to(Classroom)
      end
    end
  end

end

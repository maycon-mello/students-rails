describe 'creating student process', type: :feature do
  let!(:student) { FactoryGirl.create(:student) }
  let!(:course) { FactoryGirl.create(:course) }

  it 'valid student' do
    visit '/classrooms/new'

    find('#classroom_student_id').find(:xpath, 'option[1]').select_option
    find('#classroom_course_id').find(:xpath, 'option[1]').select_option

    click_button 'SaveButton'

    expect(page).to have_css '.alert-success'
    expect(page).to have_content student[:name]
    expect(page).to have_content course[:name]
  end
end

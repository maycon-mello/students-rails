describe 'creating student process', type: :feature do
  let!(:student) { FactoryGirl.build(:student) }

  it 'valid student' do
    visit '/students/new'

    fill_in 'student_name', with: student[:name]
    fill_in 'student_register_number', with: student[:register_number]

    click_button 'SaveButton'

    expect(page).to have_css '.alert-success'
  end
end

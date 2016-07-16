describe 'creating course process', type: :feature do
  let!(:course) { FactoryGirl.build(:course) }

  it 'valid course' do
    visit '/courses/new'

    fill_in 'course_name', with: course[:name]
    fill_in 'course_description', with: course[:description]

    click_button 'SaveButton'

    expect(page).to have_css '.alert-success'
  end
end

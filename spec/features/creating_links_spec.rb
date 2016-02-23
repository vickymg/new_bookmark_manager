feature 'Creating links' do

  scenario 'User can create a new link' do
    sign_up
    visit '/links/new'
    fill_in 'url',  with: 'http://www.bbc.co.uk'
    fill_in 'title', with: 'BBC News'
    click_button 'Create link'
    expect(current_path).to eq '/links'
    expect(page).to have_content('BBC News')
  end

end

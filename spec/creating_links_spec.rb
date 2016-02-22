feature 'Creating links' do

  scenario 'I can create a new link' do
    visit '/links/new'
    fill_in 'url',  with: 'http://www.bbc.co.uk'
    fill_in 'title', with: 'BBC News'
    click_button 'Create link'
    expect(current_path).to eq '/links'
    expect(page).to have_content('BBC News')
  end

end

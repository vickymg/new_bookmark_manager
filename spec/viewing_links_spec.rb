feature 'Viewing links' do

  scenario 'User can see exisiting links on the links page' do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit '/links'
    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end

  before(:each) do
    Link.create(url: 'http:://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
    Link.create(url: 'http:://www.bbc.co.uk', title: 'BBC News', tags: [Tag.first_or_create(name: 'news')])
    Link.create(url: 'http:://www.bubbles.com', title: 'Bubbles', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'http:://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'bubbles')])
  end

  scenario 'User can filter links by tag' do
    sign_up
    fill_in :tag, with: 'bubbles'
    click_button 'Search'
      expect(page).not_to have_content('Makers Academy')
      expect(page).not_to have_content('http:://www.bbc.co.uk')
      expect(page).to have_content('Bubbles')
      expect(page).to have_content('http:://www.google.com')
  end

end

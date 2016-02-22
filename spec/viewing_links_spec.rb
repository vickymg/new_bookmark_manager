feature 'Viewing links' do

  scenario 'user can see exisiting links on the links page' do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit '/links'
    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end

end

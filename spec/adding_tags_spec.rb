feature 'Adding tags' do

  scenario 'User can add a single tag to a new link' do
    visit '/links/new'
    fill_in 'url', with: 'http://www.bbc.co.uk'
    fill_in 'title', with: 'BBC News'
    fill_in 'tags', with: 'news'
    click_button'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('news')
  end

end

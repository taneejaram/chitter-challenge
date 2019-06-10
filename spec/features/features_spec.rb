feature 'Testing infrastructure' do

  scenario 'Checking that the home page runs as it should' do
    visit ('/home')
    expect(page).to have_content('Chitter')
  end

end

feature '"Write a new Peep" link' do

  scenario 'Enables user to enter their name and message and return to home page' do
    visit ('/home')
    fill_in :name, with: 'user1'
    fill_in :message, with: 'loves tea'
    click_on 'Post'

    expect(page).to have_content('user1: loves tea')
  end
end

feature 'Log in to Chitter' do

  scenario 'Enter a username and password to get to the Chitter home page' do
    visit ('/home')
  end
end

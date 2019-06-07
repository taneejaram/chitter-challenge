feature 'Testing infrastructure' do

  scenario 'Checking that the home page runs as it should' do
    visit ('/')
    expect(page).to have_content('Chitter')
  end

end

feature '"Write a new peep" link' do

  scenario 'Enables user to enter their name and message and return to home page' do
    visit ('/')
    fill_in :name, with: 'user1'
    fill_in :message, with: 'loves tea'
    click_on 'Post'

    expect(page).to have_content('Chitter')
  end
end

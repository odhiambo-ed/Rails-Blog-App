require 'rails_helper'

RSpec.describe 'Test User Index Page', type: :feature do
  describe 'GET index' do
    before(:each) do
      @first_user = User.create(name: 'Arnold', photo: 'image1.png', bio: 'This my first life story', posts_counter: 10)
      @first_user.save!
      @second_user = User.create(name: 'Livingi', photo: 'image2.png', bio: 'This my second life story',
                                 posts_counter: 50)
      @second_user.save!
      @third_user = User.create(name: 'Shawn', photo: 'image3.png', bio: 'This my third life story', posts_counter: 40)
      @third_user.save!
    end

    it 'shows the users username' do
      visit root_path
      expect(page).to have_content('Arnold')
      expect(page).to have_content('Livingi')
      expect(page).to have_content('Shawn')
    end

    it 'shows the users profile picture' do
      visit root_path
      expect(page).to have_css('img[src*="image1.png"]')
      expect(page).to have_css('img[src*="image2.png"]')
      expect(page).to have_css('img[src*="image3.png"]')
    end

    it 'shows the number of posts of each user' do
      visit root_path
      expect(page).to have_content('10')
      expect(page).to have_content('50')
      expect(page).to have_content('40')
    end
  end
end

require 'rails_helper'

RSpec.describe 'Categories Page Features', type: :feature do
  before(:each) do
    visit user_session_path
    user1 = User.create!(
      name: 'kelvin', email: 'kelvin@gmail.com', password: '123456'
    )
    fill_in 'Email', with: 'kelvin@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'

    category1 = user1.categories.new(name: 'couple')
    category1.image.attach(
      io: File.open(Rails.root.join('spec', 'img', 'couple.jpg')),
      filename: 'couple.png',
      content_type: 'application/jpg'
    )
    category1.save!
    visit categories_path
  end

  describe 'I can see' do
    it 'the title of the page' do
      expect(page).to have_content 'CATEGORIES'
    end

    it 'the name of the category' do
      expect(page).to have_content 'couple'
    end

    it 'should see total amount of transactions' do
      expect(page).to have_content '$0.0'
    end

    it 'should see a button to add new category when clicked' do
      expect(page).to have_button('New category')
    end

    it 'a link to new category' do
      expect(page).to have_link 'New category'
    end
  end
end

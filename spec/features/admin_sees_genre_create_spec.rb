require 'rails_helper'

describe 'an admin' do
  describe 'on the genre index page' do
    before :each do
      @genre1 = Genre.create(name: 'jazz')
      @genre2 = Genre.create(name: 'rock')
      @genre3 = Genre.create(name: 'rap')
      @admin = User.create(username: 'Bob', password: 'Bob', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    end
    it 'can see all the genres' do
      visit genres_path

      expect(page).to have_content(@genre1.name)
      expect(page).to have_content(@genre2.name)
      expect(page).to have_content(@genre3.name)
    end
    it 'sees a form to create a genre' do
      visit genres_path

      expect(page).to have_content('Name')
      expect(page).to have_button('Create Genre')
    end
  end
end

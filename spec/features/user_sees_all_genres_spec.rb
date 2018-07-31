require 'rails_helper'

describe 'a visitor' do
  describe 'visiting the genre index page' do
    before :each do
      @genre1 = Genre.create(name: 'jazz')
      @genre2 = Genre.create(name: 'rock')
      @genre3 = Genre.create(name: 'rap')
    end
    it 'can see all the genres' do
      visit genres_path

      expect(page).to have_content(@genre1.name)
      expect(page).to have_content(@genre2.name)
      expect(page).to have_content(@genre3.name)
    end
    it 'cant see the form to create a genre' do
      visit genres_path

      expect(page).to_not have_content('Name')
      expect(page).to_not have_button('Create Genre')
    end
    it 'can see the name of the genre as a link that directs to the genre show page' do
      visit genres_path
      click_on 'jazz'

      expect(current_path).to eq(genre_path(@genre1))
      expect(page).to have_content(@genre1.name)
    end
  end
end

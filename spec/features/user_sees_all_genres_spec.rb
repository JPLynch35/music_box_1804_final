require 'rails_helper'

describe 'a user' do
  describe 'visiting the genre index page' do
    it 'can see all the genres' do
      genre1 = Genre.create(name: 'jazz')
      genre2 = Genre.create(name: 'rock')
      genre3 = Genre.create(name: 'rap')

      visit genres_path

      expect(page).to have_content(genre1.name)
      expect(page).to have_content(genre2.name)
      expect(page).to have_content(genre3.name)
    end
  end
end

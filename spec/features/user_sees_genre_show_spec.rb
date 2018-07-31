require 'rails_helper'

describe 'as a visitor' do
  describe 'visiting a genre show page' do
    before :each do
      artist = Artist.create(name: 'Journey')
      @song_1 = artist.songs.create(title: "Don't Stop Believing", length: 320, play_count: 390808)
      @song_2 = artist.songs.create(title: "Anyway You Want It", length: 420, play_count: 67908)
      @song_3 = artist.songs.create(title: "This", length: 410, play_count: 678)
      @genre1 = @song_1.genres.create(name: 'rock')
      SongGenre.create(song_id: @song_2.id, genre_id: @genre1.id)
      @genre2 = @song_2.genres.create(name: 'jazz')
    end
    it 'should see all the songs in the genre' do
      visit genre_path(@genre1)

      expect(page).to have_content(@genre1.name)
      expect(page).to have_content(@song_1.title)
      expect(page).to have_content(@song_2.title)
      expect(page).to_not have_content(@song_3.title)
    end
  end
end

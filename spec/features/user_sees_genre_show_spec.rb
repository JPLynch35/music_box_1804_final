require 'rails_helper'

describe 'as a visitor' do
  describe 'visiting a genre show page' do
    before :each do
      artist = Artist.create(name: 'Journey')
      @song_1 = artist.songs.create(title: "Don't Stop Believing", length: 320, play_count: 390808, rating: 3)
      @song_2 = artist.songs.create(title: "Anyway You Want It", length: 420, play_count: 67908, rating: 5)
      @song_3 = artist.songs.create(title: "This", length: 410, play_count: 678, rating: 1)
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
    it 'should see the average rating for all songs in genre' do
      visit genre_path(@genre1)

      expected = (@song_1.rating + @song_2.rating) / 2

      expect(page).to have_content("Average Rating for Songs in this Genre: #{expected}")
    end
    it 'should see the highest rating from all songs in genre' do
      visit genre_path(@genre1)

      expect(page).to have_content("Highest Rated Song in this Genre: #{@song_2.title} (#{@song_2.rating})")
    end
    it 'should see the lowest rating from all songs in genre' do
      visit genre_path(@genre1)

      expect(page).to have_content("Lowest Rated Song in this Genre: #{@song_1.title} (#{@song_1.rating})")
    end
  end
end

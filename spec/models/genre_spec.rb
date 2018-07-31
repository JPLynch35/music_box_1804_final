require 'rails_helper'

describe Genre, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'relationships' do
    it { should have_many(:song_genres) }
    it { should have_many(:songs).through(:song_genres) }
  end

  describe 'instance methods' do
    it 'can calculate the average song rating for all songs in genre' do
      artist = Artist.create(name: 'Journey')
      song_1 = artist.songs.create(title: "Don't Stop Believing", length: 320, play_count: 390808, rating: 3)
      song_2 = artist.songs.create(title: "Anyway You Want It", length: 420, play_count: 67908, rating: 5)
      song_3 = artist.songs.create(title: "This", length: 410, play_count: 678, rating: 1)
      genre1 = song_1.genres.create(name: 'rock')
      genre2 = song_2.genres.create(name: 'jazz')
      SongGenre.create(song_id: song_2.id, genre_id: genre1.id)

      expect(genre1.average_rating).to eq(4)
    end
    it 'can find the highest song rating and title for all songs in genre' do
      artist = Artist.create(name: 'Journey')
      song_1 = artist.songs.create(title: "Don't Stop Believing", length: 320, play_count: 390808, rating: 3)
      song_2 = artist.songs.create(title: "Anyway You Want It", length: 420, play_count: 67908, rating: 5)
      song_3 = artist.songs.create(title: "This", length: 410, play_count: 678, rating: 1)
      genre1 = song_1.genres.create(name: 'rock')
      genre2 = song_2.genres.create(name: 'jazz')
      SongGenre.create(song_id: song_2.id, genre_id: genre1.id)

      expect(genre1.song_rating.first).to eq(song_2)
    end
    it 'can find the lowest song rating and title for all songs in genre' do
      artist = Artist.create(name: 'Journey')
      song_1 = artist.songs.create(title: "Don't Stop Believing", length: 320, play_count: 390808, rating: 3)
      song_2 = artist.songs.create(title: "Anyway You Want It", length: 420, play_count: 67908, rating: 5)
      song_3 = artist.songs.create(title: "This", length: 410, play_count: 678, rating: 1)
      genre1 = song_1.genres.create(name: 'rock')
      genre2 = song_2.genres.create(name: 'jazz')
      SongGenre.create(song_id: song_2.id, genre_id: genre1.id)

      expect(genre1.song_rating.last).to eq(song_1)
    end
  end
end

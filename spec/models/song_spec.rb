require 'rails_helper'

describe Song, type: :model do
  describe 'validations' do
    it{should validate_presence_of(:title)}
    it{should validate_presence_of(:length)}
    it{should validate_presence_of(:play_count)}
    it 'should default song rating to 0' do
      artist = Artist.create(name: 'Bill')
      song = artist.songs.create(title: 'hi', length: 234, play_count: 23)

      expect(song.rating).to eq(0)
    end
    it 'should not create a song with a rating over 5' do
      artist = Artist.create(name: 'Bill')
      song1 = artist.songs.create(title: 'hi', length: 234, play_count: 23)
      song2 = artist.songs.create(title: 'yo', length: 234, play_count: 23, rating: 8)

      expect(Song.last.title).to eq('hi')
    end
  end

  describe 'relationships' do
    it { should belong_to(:artist)}
    it { should have_many(:song_genres)}
    it { should have_many(:genres).through(:song_genres) }
  end
end

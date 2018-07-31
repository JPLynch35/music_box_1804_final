require 'rails_helper'

describe 'user sees one song' do
  it 'with title and length' do
    artist = Artist.create(name: 'Journey')
    song_1 = artist.songs.create(title: "Don't Stop Believing", length: 320, play_count: 390808)
    song_2 = artist.songs.create(title: "Anyway You Want It", length: 420, play_count: 67908)

    visit song_path(song_1)

    expect(current_path).to eq("/songs/#{song_1.slug}")

    expect(page).to have_content(song_1.title)
    expect(page).to have_content(song_1.length)
    expect(page).to_not have_content(song_2.title)
    expect(page).to_not have_content(song_2.length)
  end
  it 'with the rating for the song' do
    artist = Artist.create(name: 'Journey')
    song_1 = artist.songs.create(title: "Don't Stop Believing", length: 320, play_count: 390808, rating: 4)
    song_2 = artist.songs.create(title: "Anyway You Want It", length: 420, play_count: 67908)

    visit song_path(song_1)

    expect(page).to have_content("Rating: #{song_1.rating}")
  end
  it 'with the genres listed for the song' do
    artist = Artist.create(name: 'Journey')
    song_1 = artist.songs.create(title: "Don't Stop Believing", length: 320, play_count: 390808)
    genre1 = song_1.genres.create(name: 'rock')
    genre2 = song_1.genres.create(name: 'hard rock')
    genre3 = Genre.create(name: 'rap')

    visit song_path(song_1)

    expect(page).to have_content(song_1.title)
    expect(page).to have_content("Genres for this Song:")
    expect(page).to have_content(genre1.name)
    expect(page).to have_content(genre2.name)
    expect(page).to_not have_content(genre3.name)
  end
end

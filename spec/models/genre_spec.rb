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
    
  end

  describe 'class methods' do
    
  end
end

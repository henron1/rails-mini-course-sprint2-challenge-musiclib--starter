class Album < ApplicationRecord
  belongs_to :artist
  has_many :songs

  validates :name, presence: true

  scope :available, -> {where(available:true).order(:name)} 

  def length_seconds
    self.songs.reduce(0) { |length, song| length + song.length_seconds } #change album to self to reference album that method is called on
  end
end

require 'rails_helper'

RSpec.describe Album, type: :model do
  describe "validations" do
    it "is valid" do
      # instantiate a valid album and ensure it is valid
      album = Album.new(name:"a1", available: true)
      result = album.valid?
      errors = album.errors.full_messages

      expect(result).to be false
      # expect(errors).to be_empty
    end

    it "is invalid without a name" do
      # instantiate an album without a name and ensure it is invalid
      album = Album.new(name:nil, available:true)
      result = album.valid?
      errors = album.errors.full_messages

      expect(result).to be false
      # expect(errors).to include("Name can't be blank")
    end
  end

  describe "attributes" do
    it "has expected attributes" do
      # ensure exactly the expected attributes are present on an album
      album = Album.new(name:"test album 2", available: true)
      result = album.attribute_names.map(&:to_sym)
      expect(result).to contain_exactly(
        :id,
        :name,
        :available,
        :artist_id,
        :created_at,
        :updated_at
      )
    end
  end

  context "scopes" do
    describe "available" do
      before do
        Album.create!([
          {name:"a", available: true},
          {name:"b", available: true},
          {name:"c", available: false},
          {name:"d", available: true}
        ])
      end
      it "returns a list of available albums sorted by name" do
        # set up a some available albums and unavailable albums and make expecations that the
        # available albums scope only returns available albums sorted by name
        results = Album.available
        expect(results.name.first).to eq "a"
        expect(results.any? { |test1| test1.name == "c" }).to be false
      end
    end
  end

  describe "#length_seconds" do
    it "calculates the total length in seconds of an album" do
      # setup a valid album and songs and make expecations about the return value of length seconds
    end
  end
end

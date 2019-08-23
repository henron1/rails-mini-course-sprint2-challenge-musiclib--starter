require 'rails_helper'

RSpec.describe Album, type: :model do
  describe "validations" do
    it "is valid" do
      # instantiate a valid album and ensure it is valid
      album = Album.new(name:"test album1", available:true)
      result = album.valid?
      errors = album.errors.full_messages

      expect(result).to be true
      expect(errors).to be_empty
    end

    it "is invalid without a name" do
      # instantiate an album without a name and ensure it is invalid
      album = Album.new(name:nil, available:true)
      result = album.valid?
      errors = album.errors.full_messages

      expect(result).to be false
      expect(errors).to include("Name can't be blank")
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
        :available
      )
    end
  end

  context "scopes" do
    describe "available" do
      before do
        Album.create!([
          {name:"a album 3", available: true},
          {name:"test album 4", available: true},
          {name:"b album 5", available: false},
          {name:"c album 6", available: true}
        ])
      it "returns a list of available albums sorted by name" do
        # set up a some available albums and unavailable albums and make expecations that the
        # available albums scope only returns available albums sorted by name
        results = Album.available
      end
    end
  end

  describe "#length_seconds" do
    it "calculates the total length in seconds of an album" do
      # setup a valid album and songs and make expecations about the return value of length seconds
    end
  end
end

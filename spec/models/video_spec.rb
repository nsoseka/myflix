require "spec_helper"

describe Video do
  it { should belong_to(:category) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }

  describe "search_by_title" do
    it "returns an empty array when no match is found" do
      Video.create(title: "fantasy guy in the building", description: 'the tester')
      expect(Video.search_by_title('family')).to eq([])
    end

    it "returns an array with one item for an exact match" do
      video1 = Video.create(title: "fantasy guy in the building", description: 'the tester')
      video2 = Video.create(title: "fantasy guy always in the building", description: 'the tester')
      expect(Video.search_by_title('always')).to eq([video2])
    end

    it "returns an array of one video for a partial match" do
      video1 = Video.create(title: "fantasysia guy in the building", description: 'the tester')
      expect(Video.search_by_title('fantasy')).to eq([video1])
    end

    it "returns an array of all the matches ordered by created_at" do
      video1 = Video.create(title: "fantasy guy in the building", description: 'the tester')
      video2 = Video.create(title: "fantasy guy always in the building", description: 'the tester')
      expect(Video.search_by_title('fantasy')).to eq([video2, video1])
    end

    it "should be case insensitive when matching" do
      video1 = Video.create(title: "fantasy guy in the building", description: 'the tester')
      video2 = Video.create(title: "fANtasy guy always in the building", description: 'the tester')
      expect(Video.search_by_title('faNTasy')).to include(video1, video2)
    end

    it "returns an empty array for a search with an empty string" do
      video2 = Video.create(title: "fantasy guy always in the building", description: 'the tester')
      expect(Video.search_by_title("")).to eq([])
    end
  end
end

#https://www.youtube.com/watch?v=MBuwUbFCQtw

require 'spec_helper'

describe Category do
  it { should have_many(:videos) }

  describe "#recent_videos" do
    it "returns an array of 6 most recent videos" do
      generations = Category.create(name: 'Vintage Collections')
      Video.create(title: "The first", category: generations, description: "Video number 1")
      Video.create(title: "The second", category: generations, description: "Video number 2")
      Video.create(title: "The third", category: generations, description: "Video number 3")
      Video.create(title: "The fourth", category: generations, description: "Video number 4")
      Video.create(title: "The fifth", category: generations, description: "Video number 5")
      Video.create(title: "The sixth", category: generations, description: "Video number 6")
      Video.create(title: "The seventh", category: generations, description: "Video number 7")
      Video.create(title: "The eigth", category: generations, description: "Video number 8")

      expect(Category.first.recent_videos.size).to eq(6)
    end
    it "returns an array of all recent videos for number of videos less than 6" do
      generations = Category.create(name: 'Vintage Collections')
      Video.create(title: "The first", category: generations, description: "Video number 1")
      Video.create(title: "The second", category: generations, description: "Video number 2")
      Video.create(title: "The third", category: generations, description: "Video number 3")
      Video.create(title: "The fourth", category: generations, description: "Video number 4")
      Video.create(title: "The fifth", category: generations, description: "Video number 5")

      expect(Category.first.recent_videos.size).to eq(5)
    end
    it "returns an array of videos in reverse chronological order by created_at" do
      generations = Category.create(name: 'Vintage Collections')
      video1 = Video.create(title: "The first", category: generations, description: "Video number 1")
      video2 = Video.create(title: "The second", category: generations, description: "Video number 2")
      video3 = Video.create(title: "The third", category: generations, description: "Video number 3")
      video4 = Video.create(title: "The fourth", category: generations, description: "Video number 4")
      video5 = Video.create(title: "The fifth", category: generations, description: "Video number 5")

      expect(Category.first.recent_videos).to eq([video5, video4, video3, video2, video1])
    end
    it "returns the 6 most recent videos" do
      generations = Category.create(name: 'Vintage Collections')
      Video.create(title: "The first", category: generations, description: "Video number 1")
      Video.create(title: "The second", category: generations, description: "Video number 2")
      Video.create(title: "The third", category: generations, description: "Video number 3")
      Video.create(title: "The fourth", category: generations, description: "Video number 4")
      Video.create(title: "The fifth", category: generations, description: "Video number 5")
      Video.create(title: "The sixth", category: generations, description: "Video number 6")
      oldest = Video.create(title: "oldest", category: generations, description: "oldest boy", created_at: 1.day.ago)

      expect(Category.first.recent_videos).not_to include(oldest)
    end
    it "returns an empty array if no videos are found in the category" do
      generations = Category.create(name: 'Vintage Collections')
      expect(Category.first.recent_videos).to eq([])
    end
  end
end


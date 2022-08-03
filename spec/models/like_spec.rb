require 'rails_helper'

RSpec.describe Like, type: :model do
  subject = Like.new
  user = User.new(name: 'Edward', photo: 'https://unsplash.com/photos/2LowviVHZ-E', bio: 'This is the story of my life')
  post = Post.new(title: 'Health post', text: 'This is a Health post', comments_counter: 0)

  before { subject.save }
  before { post.save }
  before { user.save }

  it 'author should be present' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end

  it 'post should be present' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end

  it 'author should be correct person' do
    subject.author_id = user.id
    expect(subject).to be_truthy
  end
end

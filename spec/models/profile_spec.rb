require 'rails_helper'

RSpec.describe Profile, type: :model do
  let(:cat) { Profile.create(name: 'cat', description: 'description') }

  it 'validates name uniqueness' do
    new_cat = Profile.new(name: 'cat', description: 'another description')

    expect { new_cat.save! }.to raise_error(ActiveRecord::RecordInvalid)
  end

  describe '#ranking_score' do
    let(:cat_1) { Profile.create(name: 'name', description: 'a bc') }
    let(:like) { Like.create(by: 'name', score: 1, profile_id: cat_1.id) }

    it 'generates a score' do
      expect(cat_1.ranking_score).to equal 0.3
    end
  end
end

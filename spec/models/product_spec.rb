RSpec.describe Product, type: :model do
  describe 'Database Table' do
    it {
      is_expected.to have_db_column(:id)
        .of_type(:integer)
    }

    it {
      is_expected.to have_db_column(:name)
        .of_type(:string)
    }
    it {
      is_expected.to have_db_column(:price)
        .of_type(:float)
    }
  end

  # describe 'Associations' do

  # end

  describe 'Factory' do
    it 'is expected to be valid' do
      expect(create(:product)).to be_valid
    end
  end
end

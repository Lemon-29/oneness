describe 'user modelのテスト', type: :model do
  describe 'バリデーションのテスト' do
    # let!(:user) { FactoryBot.create(:user)}
    # let!(:second_user) { FactoryBot.create(:second_user)}
    let!(:user) { FactoryBot.create(:user) }

    context 'Eメールが空の場合' do
      it 'バリデーションにひっかかる' do
        user.email = nil
        expect(user).not_to be_valid
      end
    end
    context 'Emailが記載されている場合' do
      it 'バリデーションが通る' do
        user.email='lisa@gmail.com'
        expect(user).to be_valid
      end
    end
  end
end
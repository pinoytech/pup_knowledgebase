require 'spec_helper'

describe "Questions", js: true do

  describe 'voting' do
    let!(:user) {create(:user, email: 'teejay@teejay.com')}
    let!(:question) {create(:question)}

    it 'should update vote status' do
      visit root_path
      current_path.should eq(search_questions_path)
      current_url.should have_content 'keyword=First+Question'
      page.should have_content 'First Question'
    end
  end
end
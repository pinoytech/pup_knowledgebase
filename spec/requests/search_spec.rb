require 'spec_helper'

describe "Questions", js: true do

  describe 'search form' do
    let!(:user) {create(:user)}
    let!(:question) {create(:question)}

    it 'should submit to products_path' do
      visit root_path
      fill_in 'keyword', with: 'First Question'
      click_on 'Search'
      current_path.should eq(search_questions_path)
      current_url.should have_content 'keyword=First+Question'
    end
  end
end
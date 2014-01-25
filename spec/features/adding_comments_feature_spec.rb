require 'spec_helper'

describe 'Add the comment' do 
  
  before do
    create(:post)
  end

  it 'adds comments from a form providing Text' do
    visit '/posts'
    click_link 'Add a comment'

    fill_in 'Text', with: 'This article is great'
    click_button 'Create Comment'

    expect(page).to have_content 'This article is great'
  end

end
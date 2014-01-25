require 'spec_helper'

describe 'Delete the post' do

  before do
    create(:post)
  end 
  it 'should delete the post' do
    visit '/posts'
    click_link 'Delete post'
    expect(page).not_to have_content("MyString")
  end
  
end
require 'spec_helper'

describe 'Create a post' do
  it ' should create a pot ' do
    visit '/posts/new'
    fill_in 'Title', with: 'First Post'
    click_button 'Create Post'
    expect(page).to have_content 'First Post'
    expect(current_path).to eq '/posts'
  end
end
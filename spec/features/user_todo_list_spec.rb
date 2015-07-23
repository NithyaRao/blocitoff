require 'rails_helper'

describe "User To-Do list", :type => :feature do
    let(:user) { create(:user) }
    let!(:item) { create(:item, user: user) }
    let!(:item_collection) { build_list(:item, 3, user: user) }
    before { sign_in(user) }
    
  describe "If item exists" do
    it "displays item" do
      expect( current_path ).to eq user_path( user.id )
      expect(find('ul.list')).to have_content(item.name)
    end
  end   
  describe "if item does not exist" do    
    it "creates the item adds to the to-do list" do
       expect( current_path ).to eq user_path( user.id )
      # print page.html
      # byebug
       expect { create_items( item_collection[0].name) }.to change {user.items.count}.by (1)
    end 
   it "can you create multiple to-do items " do
       expect( current_path ).to eq user_path( user.id ) 
       expect { 3.times { |i|  create_items( item_collection[i].name) }}.to change {user.items.count}.by (3)
   end
   it "Are the to-do items displayed after creation? " do
       2.times { |i| create_items( item_collection[i].name)
                  expect(find('ul.list')).to have_content(item_collection[i].name) }           
   end
  end
end

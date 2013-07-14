require 'spec_helper'

describe "Static pages" do

	subject {page}

  describe "Home page" do

	  before {visit 'root'}

      it { should have_selector('h1', :text => 'Sample App') }
      it { should have_selector('title', :text => full_title('')) }
      it { should have_selector('title', :text => '| Home') }
  end

	describe "Help page" do
	
	before {visit 'help'}
	it {should have_selector('h1', :text => 'Help') }
	it {should have_selector('title', :text => full_title('Help')) }

	end

	describe "About page" do

      before {visit 'about'}
      it {should have_selector('h1', :text => 'About Us') }
      it {should have_selector('title', :text => full_title('About Us')) }
    end

	describe "Contact page" do

      before {visit 'contact'}
      it { should have_selector('h1', :text => 'Contact Us') }
      it { should have_selector('title', :text => full_title('Contact Us')) }
    end
end


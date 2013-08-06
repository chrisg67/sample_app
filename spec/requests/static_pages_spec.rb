require 'spec_helper'

describe "StaticPages" do
  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it  {should have_title(full_title(page_title))  }
    it "should have the right links on the layout" do
      click_link "About"
      expect(page).to have_title(full_title('About Us'))
      click_link page_name
      click_link "Help"
      expect(page).to have_title(full_title('Help'))
      click_link page_name
      click_link "Contact"
      expect(page).to have_title(full_title('Contact'))
      click_link page_name
      click_link "Home"
      expect(page).to have_title(full_title(''))
      expect(page).not_to have_title('| Home')
      click_link page_name
      click_link "sample app"
      expect(page).to have_title(full_title(''))
      expect(page).not_to have_title('| Home')
    end
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading) {'Sample App'}
    let(:page_title) {''}
    let(:page_name) {'Home'}
    it_should_behave_like "all static pages"
    it { should_not have_title('| Home') }
    it "should have the right link on the sign up button" do
      click_link "Sign up now!"
      expect(page).to have_title(full_title('Sign up'))
    end
  end

  describe "Help page" do
    before { visit help_path }
    let(:heading) {'Help'}
    let(:page_title) {'Help'}
    let(:page_name) {'Help'}
    it_should_behave_like "all static pages"
  end

  describe "About page" do
    before { visit about_path }
    let(:heading) {'About'}
    let(:page_title) {'About Us'}
    let(:page_name) {'About'}
    it_should_behave_like "all static pages"
  end

  describe "Contacts page" do
    before { visit contact_path }
    let(:heading) {'Contact'}
    let(:page_title) {'Contact'}
    let(:page_name) {'Contact'}
    it_should_behave_like "all static pages"
  end
end

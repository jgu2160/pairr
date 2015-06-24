require 'rails_helper'

RSpec.describe "Dashboard navigation", type: :feature do
  let(:neslom) { User.create(username:"neslom", image:"https://avatars.githubusercontent.com/u/8800860?v=3", description:"not coding much") }
  let(:worace) { User.create(username:"worace", image:"https://avatars.githubusercontent.com/u/1227440?v=3", description:"not coding") }

  let(:user_match) { UserMatch.create(user_1: neslom.id, user_2: worace.id, user_1_choice: 1, user_2_choice: 1) }

  it 'should show the dashboard title' do
    visit root_path
    expect(page.body).to have_content("Dashboard")
  end

  context 'when a user signs in' do
    context 'when the user has candidates' do
      before :each do
        worace
        page.set_rack_session(user_id: neslom.id)
        visit root_path
      end

      it 'should show the users name' do
        expect(page.body).to have_content("neslom")
      end

      it 'should have a logout button' do
        expect(page.body).to have_content("Logout")
      end

      it 'should show a user for when matches clicked' do
        click_link_or_button("Match")
        expect(page.body).to have_content("neslom")
        expect(page.body).to have_content("Approve")
        expect(page.body).to have_content("Reject")
      end

      it 'should say no candidates if all matches depleted' do
        click_link_or_button("Match")
        click_link_or_button("Reject")
        expect(page.body).to have_content("No current candidates")
      end
    end

    context 'when a user has matched' do
      it 'list all matches' do
        worace
        user_match
        page.set_rack_session(user_id: neslom.id)
        visit root_path
        expect(page.body).to have_content("worace")
      end
    end

  end
end

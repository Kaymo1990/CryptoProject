feature 'cryptosearch' do
    scenario 'clicking back to homepage will take you back to the index' do
        visit('/cryptosearch')
        click_on 'Back to homepage'
        expect(page).to have_current_path('/')
    end

    scenario 'entering bitcoin into search will take user to the analysis page' do
        visit('/cryptosearch')
        fill_in 'coin', with: 'bitcoin'
        click_on 'Submit'
        expect(page).to have_content 'The current price of bitcoin is'
    end
end
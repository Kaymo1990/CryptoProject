feature 'cryptosearch' do
    scenario 'clicking back to homepage will take you back to the index' do
        visit('/cryptosearch')
        click_on 'Back to homepage'
        expect(page).to have_current_path('/')
    end
end
feature 'index page' do
    scenario 'allow user to be greeted at welcome page' do
        visit('/')
        expect(page).to have_content 'Welcome to SimpleCrypto!'
    end

    scenario 'allow user to start analysis' do
        visit('/')
        click_on "Start analysing!"
        expect(page).to have_content 'Enter cryptocurrency:'
    end
end
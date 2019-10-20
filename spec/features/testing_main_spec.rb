feature 'index page' do
    scenario 'allow user to be greeted at welcome page' do
        visit('/')
        expect(page).to have_content 'Welcome to SimpleCrypto!'
    end
end
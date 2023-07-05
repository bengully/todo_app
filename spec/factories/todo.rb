FactoryGirl.define do
    factory :todo do
        task 'Make a test'
        description 'Have test work'
        status 0
    end
end
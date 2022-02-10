require 'rails_helper'

RSpec.describe Aquatic, type: :model do
  current_user = User.first_or_create!(email: 'terence@mail.com', password: 'password', password_confirmation: 'password')

  it 'has a nickname' do
    aquatic = Aquatic.new(
      nick_name: '',
      common_name: 'common name',
      scientific_name: 'scientific name',
      purchased_on: '2022-02-10',
      notes: 'Some notes',
      length: 5,
      max_lifespan: 5,
      sex: 'male',
      user: current_user
    )
    expect(aquatic).to_not be_valid

    aquatic.nick_name = 'Fabio'
    expect(aquatic).to be_valid
  end

  it 'has a nickname at least 2 characters long' do
    aquatic = Aquatic.new(
      nick_name: 'a',
      common_name: 'common name',
      scientific_name: 'scientific name',
      purchased_on: '2022-02-10',
      notes: 'Some notes',
      length: 5,
      max_lifespan: 5,
      sex: 'male',
      user: current_user
    )
    expect(aquatic).to_not be_valid

    aquatic.nick_name = 'Fabio'
    expect(aquatic).to be_valid
  end

  it 'has a common name' do
    aquatic = Aquatic.new(
      nick_name: 'Nicky',
      common_name: '',
      scientific_name: 'scientific name',
      purchased_on: '2022-02-10',
      notes: 'Some notes',
      length: 5,
      max_lifespan: 5,
      sex: 'male',
      user: current_user
    )
    expect(aquatic).to_not be_valid

    aquatic.common_name = 'common name'
    expect(aquatic).to be_valid
  end

  it 'has a common name at least 2 characters long' do
    aquatic = Aquatic.new(
      nick_name: 'Nicky',
      common_name: 'a',
      scientific_name: 'scientific name',
      purchased_on: '2022-02-10',
      notes: 'Some notes',
      length: 5,
      max_lifespan: 5,
      sex: 'male',
      user: current_user
    )
    expect(aquatic).to_not be_valid

    aquatic.common_name = 'common name'
    expect(aquatic).to be_valid
  end

  it 'has a scientific name' do
    aquatic = Aquatic.new(
      nick_name: 'Nicky',
      common_name: 'common name',
      scientific_name: '',
      purchased_on: '2022-02-10',
      notes: 'Some notes',
      length: 5,
      max_lifespan: 5,
      sex: 'male',
      user: current_user
    )
    expect(aquatic).to_not be_valid

    aquatic.scientific_name = 'scientific name'
    expect(aquatic).to be_valid
  end

  it 'has a binomial scientific name' do
    aquatic = Aquatic.new(
      nick_name: 'Nicky',
      common_name: 'common name',
      scientific_name: 'scientificname',
      purchased_on: '2022-02-10',
      notes: 'Some notes',
      length: 5,
      max_lifespan: 5,
      sex: 'male',
      user: current_user
    )
    expect(aquatic).to_not be_valid

    aquatic.scientific_name = 'scientific name'
    expect(aquatic).to be_valid
  end

  it 'has a length' do
    aquatic = Aquatic.new(
      nick_name: 'Nicky',
      common_name: 'common name',
      scientific_name: 'scientific name',
      purchased_on: '2022-02-10',
      notes: 'Some notes',
      length: nil,
      max_lifespan: 5,
      sex: 'male',
      user: current_user
    )
    expect(aquatic).to_not be_valid

    aquatic.length = 5
    expect(aquatic).to be_valid
  end

  it 'has a numerical length' do
    aquatic = Aquatic.new(
      nick_name: 'Nicky',
      common_name: 'common name',
      scientific_name: 'scientific name',
      purchased_on: '2022-02-10',
      notes: 'Some notes',
      length: 5,
      max_lifespan: 5,
      sex: 'male',
      user: current_user
    )
    expect(aquatic.length).to be_a(Integer)
  end

  it 'has a length of at least 1' do
    aquatic = Aquatic.new(
      nick_name: 'Nicky',
      common_name: 'common name',
      scientific_name: 'scientific name',
      purchased_on: '2022-02-10',
      notes: 'Some notes',
      length: 0,
      max_lifespan: 5,
      sex: 'male',
      user: current_user
    )
    expect(aquatic).to_not be_valid

    aquatic.length = 5
    expect(aquatic).to be_valid
  end

  it 'has a max lifespan' do
    aquatic = Aquatic.new(
      nick_name: 'Nicky',
      common_name: 'common name',
      scientific_name: 'scientific name',
      purchased_on: '2022-02-10',
      notes: 'Some notes',
      length: 5,
      max_lifespan: nil,
      sex: 'male',
      user: current_user
    )
    expect(aquatic).to_not be_valid

    aquatic.max_lifespan = 5
    expect(aquatic).to be_valid
  end

  it 'has a numerical max lifespan' do
    aquatic = Aquatic.new(
      nick_name: 'Nicky',
      common_name: 'common name',
      scientific_name: 'scientific name',
      purchased_on: '2022-02-10',
      notes: 'Some notes',
      length: 5,
      max_lifespan: 5,
      sex: 'male',
      user: current_user
    )
    expect(aquatic.max_lifespan).to be_a(Integer)
  end

  it 'has a max lifespan of at least 1' do
    aquatic = Aquatic.new(
      nick_name: 'Nicky',
      common_name: 'common name',
      scientific_name: 'scientific name',
      purchased_on: '2022-02-10',
      notes: 'Some notes',
      length: 5,
      max_lifespan: 0,
      sex: 'male',
      user: current_user
    )
    expect(aquatic).to_not be_valid

    aquatic.max_lifespan = 5
    expect(aquatic).to be_valid
  end

  it 'has a purchase date' do
    aquatic = Aquatic.new(
      nick_name: 'Nicky',
      common_name: 'common name',
      scientific_name: 'scientific name',
      purchased_on: nil,
      notes: 'Some notes',
      length: 5,
      max_lifespan: 5,
      sex: 'male',
      user: current_user
    )
    expect(aquatic).to_not be_valid

    aquatic.purchased_on = '2022-02-10'
    expect(aquatic).to be_valid
  end

  it 'has notes' do
    aquatic = Aquatic.new(
      nick_name: 'Nicky',
      common_name: 'common name',
      scientific_name: 'scientific name',
      purchased_on: '2022-02-10',
      notes: nil,
      length: 5,
      max_lifespan: 5,
      sex: 'male',
      user: current_user
    )
    expect(aquatic).to_not be_valid

    aquatic.notes = "The quick brown fox jumps over the lazy dog"
    expect(aquatic).to be_valid
  end

  it 'has note of maximum 200 characters' do
    aquatic = Aquatic.new(
      nick_name: 'Nicky',
      common_name: 'common name',
      scientific_name: 'scientific name',
      purchased_on: '2022-02-10',
      notes: nil,
      length: 5,
      max_lifespan: 5,
      sex: 'male',
      user: current_user
    )
    expect(aquatic).to_not be_valid

    aquatic.notes = "The quick brown fox jumps over the lazy dog"
    expect(aquatic).to be_valid

    two_hundred_plus = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean mLorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean ma'
    aquatic.notes = two_hundred_plus
    expect(aquatic).to_not be_valid
  end
end

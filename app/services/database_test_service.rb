class DatabaseTestService

  class << self
    def call(number)
      new.insert(number)
    end
  end

  def insert(number)
    number.to_i.times do |n|
      User.create(user_attributes(n))
    end
    User.destroy_all
  end

  private

  def user_attributes(n)
    {
      name: "Пользователь #{n}",
      phone_number: Faker::PhoneNumber.cell_phone,
      description: Faker::Lorem.sentence,
      birth_date: Time.now
    }
  end

end

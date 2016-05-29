class DatabaseTestService

  class << self
    def call(number)
      new.test(number)
    end
  end

  def test(number)
    number.to_i.times do |n|
      User.create(user_attributes(n))
    end
    User.all.each do |user|
      user.destroy
    end
  end

  private

  def user_attributes(n)
    {
      name: "Пользователь #{n}",
      phone_number: "+#{n}#{n}#{n}-#{n+1}#{n+1}#{n+1}-#{n+2}#{n+2}#{n+2}#{n+2}",
      description: "Описание #{n}"
    }
  end

end

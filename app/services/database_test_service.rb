class DatabaseTestService

  class << self
    def call(number)
      new.test(number)
    end
  end

  def test(number)
    create_users(number)
    destroy_users
  end

  private

  def create_users(number)
    number.to_i.times do |n|
      User.create(user_attributes(n))
    end
  end

  def destroy_users
    User.all.each(&:destroy)
  end

  def user_attributes(n)
    {
      name: "Пользователь #{n}",
      phone_number: "+#{n}#{n}#{n}-#{n+1}#{n+1}#{n+1}-#{n+2}#{n+2}#{n+2}#{n+2}",
      description: "Описание #{n}"
    }
  end

end

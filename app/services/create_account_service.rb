class CreateAccountService
  def initialize(user)
    @user = user
  end

  def call
    @user.account = Account.create(account_balance: 0)
  end
end

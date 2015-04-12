class BanksController < ApplicationController
  
  def signup
    @bank       = Bank.new
    @bank_users = @bank.bank_users.build
    @user       = @bank_users.build_user
  end
  
  def create
    @bank = Bank.new(bank_params)
    if @bank.save
      @users = @bank.users
      logger.debug "1 #{@bank.users.first}"
      logger.debug "2 #{@bank.users}"
      logger.debug "3 #{@bank.users.count}"
      logger.debug "4 #{@bank.users.select(:email)}"
      #log_in @user
      #flash[:success] = I18n.t("signup.success")
      #redirect_to @user
    else
      render 'signup'
    end
  end

  private

  def bank_params
    params.require(:bank).permit(:name, bank_users_attributes: [{ user_attributes: [:first_name, :last_name, :email, 
                                                          :password, :password_confirmation] }])
  end
end

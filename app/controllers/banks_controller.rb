class BanksController < ApplicationController
  
  def signup
    @bank       = Bank.new
    @bank_users = @bank.bank_users.build
    @user       = @bank_users.build_user
  end
  
  def create
    #logger.debug "1 #{bank_params}"
    #logger.debug "2 #{bank_params[:bank_users_attributes]}"
    #logger.debug "3 #{bank_params[:bank_users_attributes][0][:user_attributes]}"
    
    @bank       = Bank.new(bank_params)
    @bank_users = @bank.bank_users
    @user       = @bank.users
    if @bank.save
      # log_in @user
      # flash[:success] = I18n.t("signup.success")
      # redirect_to @user
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

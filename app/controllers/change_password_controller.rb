class ChangePasswordController < ApplicationController
  before_action :validade_current_password, only: [:change]
  before_action :validade_password, only: [:change]
  before_action :validade_confirmation_password, only: [:change]

  def change
    new_password = params[:change_password][:new_password]
    @user.update(password: new_password)
    #MENSAGEM DE SENHAS ALTERADA COM SUCESSO
    render 'new'
  end

  private

    def validade_password
      new_password = params[:change_password][:new_password]

      if new_password.length < 5 || new_password.length > 100
        #MENSAGEM DE SENHAS COM TAMANHO INVALIDO
        render 'new'
      end
    end

    def validade_confirmation_password
      new_password = params[:change_password][:new_password]
      confirmation_password = params[:change_password][:confirmation_password]

      if !new_password.eql?confirmation_password
        #MENSAGEM DE SENHAS E CONFIRMAÇÃO DE SENHA DIFERENTE
        render 'new'
      end
    end

    def validade_current_password
      current_password = params[:change_password][:current_password]
      @user = User.find(session[:user_id])

      if !@user.authenticate(current_password)
        #MENSAGEM DE SENHA ATUAL INVALDA
        render 'new'
      end
    end

end

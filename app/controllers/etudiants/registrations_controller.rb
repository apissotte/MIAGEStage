# frozen_string_literal: true

class Etudiants::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /etudiants/sign_up
  def new
    super
    puts 'coucou'
  end

  # POST /etudiants
  def create
    super
    self.configure_sign_up_params
    puts :attribute
  end

  # GET /etudiants/edit
  # def edit
  #   super
  # end

  # PUT /etudiants
  # def update
  #   super
  # end

  # DELETE /etudiants
  # def destroy
  #   super
  # end

  # GET /etudiants/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:num_etudiant, :email_universitaire, :nom, :prenom, :email_personnelle, :statut_arrivant_L3])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end

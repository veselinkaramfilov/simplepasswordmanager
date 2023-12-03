class PasswordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_password, except: [:index, :new, :create]

  # GET /passwords or /passwords.json
  def index
    @passwords = current_user.passwords
  end

  # GET /passwords/1 or /passwords/1.json
  def show
    @password = current_user.passwords.find(params[:id])
  end

  # GET /passwords/new
  def new
    @password = Password.new
  end

  # GET /passwords/1/edit
  def edit
  end

  # POST /passwords or /passwords.json
  def create
    @password = current_user.passwords.new(password_params)

    respond_to do |format|
      if @password.save
        format.html { redirect_to password_url(@password), notice: "Password was successfully created." }
        format.json { render :show, status: :created, location: @password }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @password.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /passwords/1 or /passwords/1.json
  def update
    respond_to do |format|
      if @password.update(password_params)
        format.html { redirect_to password_url(@password), notice: "Password was successfully updated." }
        format.json { render :show, status: :ok, location: @password }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @password.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /passwords/1 or /passwords/1.json
  def destroy
    @password.destroy

    respond_to do |format|
      format.html { redirect_to passwords_url, notice: "Password was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_password
    @password = current_user.passwords.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def password_params
    params.require(:password).permit(:url, :username, :password)
  end
end

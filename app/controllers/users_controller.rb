class UsersController < Clearance::UsersController

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to '/'
  	else
  		render users_path
  	end
  end

  def new 
  	@user = User.new(params[:users])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	@user.save
  	redirect_to root_path
  end

  def show
  	@user = User.find(params[:id])

  end

  # def user_from_params
  # 	first_name = user_params.delete(:first_name)
  # 	last_name = user_params.delete(:last_name)
  # 	email = user_params.delete(:email)
  # 	password = user_params.delete(:password)

  # 	Clearance.config.user_model.new(user_params)

  private
  # private so the public wont be able to view the name, email and password 
  # this allows user to change...
  def user_params
  	params.require(:user).permit(:name, :email, :password)
  end


  def delete

  end

end

# put -> we have to suuply all the arguments; it expects all the attributes to be filled in
# patch -> we have to specify what to update
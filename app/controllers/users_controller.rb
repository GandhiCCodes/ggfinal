def create
  @user = User.find_by({ "email" => params["email"] }) 

  if @user != nil  
    if BCrypt::Password.new(@user["password_digest"]) == params["password"]  
      session["user_id"] = @user["id"]  
      flash["notice"] = "Hello."
      redirect_to "/places"
    else
      flash["notice"] = "Nope. Wrong password."
      redirect_to "/login"
    end
  else
    flash["notice"] = "Nope. Email not found."
    redirect_to "/login"
  end
end

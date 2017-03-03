class ThirdblackbeltsController < ApplicationController
  before_action :check_status, except: [:index,:register,:login]

  def index
  end

  def add
      @user_id=session[:user_id]
      Add.create(song_id:params[:id],user_id:@user_id)
      flash[:success]="new Add created"
      redirect_to "/songs"
    end


  def songpage
    @song = Song.find(params[:id])
    @users = @song.users
    @song_added = @song.adds
  end

  def userpage
    @user = User.find(session[:user_id])
    @mysongs = @user.songs_added

  end


 def createsong
   user = User.find(session[:user_id])
   Song.create(title: params[:title], artist: params[:artist], user:user)
   redirect_to "/songs"
 end

 def songs
   @user = User.find(session[:user_id])
   @songs = Song.all.order('created_at DESC')
   render 'songs.html.erb'
 end

  def register
    user = User.create(firstname: params[:firstname], lastname: params[:lastname], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if user.valid?
      session[:user_id] = user[:id]
      redirect_to "/songs"
    else
      render json: user.errors
    end
  end

  def logout
    reset_session
    redirect_to('/main')
  end



  def login
    # render json: params
    puts "Is this actually running"
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user[:id]

      puts session[:user_id]
      redirect_to "/songs"
    else
      render text:"something was wrong with login credentials"
    end
  end

  def check_status
    if !session[:user_id]
      redirect_to '/main'
    end
  end



end

class Admins::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    # @genre.genre_name = params[:genre][:genre_name]
    if @genre.save
      redirect_to admins_genres_path
    else
      @genres = Genre.all
      render "index"
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    # @genre.genre_name = params[:genre][:genre_name]
    if @genre.update(genre_params)
      redirect_to admins_genres_path
    else
      render "edit"
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admins_genres_path
  end


 private

 def genre_params
   params.require(:genre).permit(:genre_name)
  # params[:genre][:genre_name]
 end


# paramas={"genre"=>{"genre_name"=>"ばすけ".......}
# paramas={ {"genre_name"=>"ばすけ".......}

end
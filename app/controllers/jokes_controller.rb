class JokesController < ApplicationController
	def index
		@jokes = Joke.all
	end

	def show
		@joke = Joke.find(params[:id])
	end

	def new
		@joke = Joke.new
	end

	def create
		@joke = current_user.jokes.build(joke_params)
		#@joke = Joke.new(joke_params, :user_id)

		if @joke.save
			redirect_to @joke
		else
			render 'new'
		end
	end

	def update
		@joke = Joke.update(joke_params)
	end

	def edit
		@joke = Joke.find(params[:joke_id, :user_id])
	end

	def destroy
		@joke = Joke.destroy
	end


private

	def joke_params
		params.require(:joke).permit(:body)
	end
end
	

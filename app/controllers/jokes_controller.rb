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
		if @joke.save
			redirect_to @joke
		else
			render 'new'
		end
	end

	def update
		@joke = current_user.jokes.find(params[:id])
		if @joke.update(joke_params)
			redirect_to @joke
		end
		#@joke = Joke.update(joke_params)
	end

	def edit
		@joke = Joke.find(params[:id])
	end

	def destroy
		@joke = Joke.find(params[:id])
			@joke.destroy
			redirect_to jokes_path
	end


private

	def joke_params
		params.require(:joke).permit(:body)
	end
end
	

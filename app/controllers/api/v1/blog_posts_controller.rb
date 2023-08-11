class Api::V1::BlogPostsController < ApplicationController
    before_action :set_blog, only: [:show, :update, :destroy]

    def index
        @blogs = BlogPost.all
        render json: @blogs, status: :ok
    end

    def show
        render json: @blog, status: :ok
    end

    def create
        @blog = BlogPost.new(blog_params)
        if @blog.save
            render json: @blog, status: :created
        else
            render json: @blog.errors, status: :unprocessable_entity
        end
    end

    def update
        if @blog.update(blog_params)
            render json: @blog, status: :ok
        else
            render json: @blog.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @blog.destroy
        render json: { message: "Blog deleted" }, status: :ok
    end

    private

    def set_blog
        @blog = BlogPost.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        render json: { message: "Blog not found" }, status: :not_found
    end

    def blog_params
        params.require(:blog).permit(:title, :body)
    end
end
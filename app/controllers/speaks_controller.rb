class SpeaksController < ApplicationController
  before_action :set_content, only:[:edit, :show, :update, :destroy]
  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(speak_param)
    if params[:back]
      render :new
    else
      if @post.save
        redirect_to speaks_path, notice:"保存しました"
      else
        render :new
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(speak_param)
      redirect_to speak_path, notice:"編集しました"
    end
  end

  def destroy
    @post.destroy
    redirect_to speak_path, notice:"削除しました"
  end

  def confirm
    @post = Post.new(speak_param)
    render :new if @post.invalid?
  end

  private

  def speak_param
    params.require(:posts).permit(:content)
  end

  def set_content
    @post = Post.find(params[:id])
  end
end

class SpeaksController < ApplicationController
  before_action :set_content, only:[:edit, :show]
  def index
    @speak = Speak.all
  end

  def new
    @speak = Speak.new
  end

  def create
    @speak = Speak.create(speak_param)
    if params[:back]
      render :new
    else
      if @speak.save
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
    if @speak.update(speak_param)
      redirect_to speak_path, notice:"編集しました"
    end
  end

  def destroy
    @speak.destroy
    redirect_to speak_path, notice:"削除しました"
  end
  
  def confirm
    @speak = Speak.new(speak_param)
    render :new if @speak.invalid?
  end

  private

  def speak_param
    params.require(:speak).permit(:content)
  end

  def set_content
    @speak = Speak.find(params[:id})
  end
end

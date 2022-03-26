class SpeaksController < ApplicationController
  before_action :set_content, only:[:edit]
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

  def edit
  end

  def confirm
    @speak = Speak.new(speak_param)
  end

  private

  def speak_param
    params.require(:speak).permit(:content)
  end

  def set_content
    @speak = Speak.find(params[:id})
  end
end

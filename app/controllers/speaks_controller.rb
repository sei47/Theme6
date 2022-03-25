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
    redirect_to speaks_path, notice:"保存しました"
  end

  def edit
  end

  private

  def speak_param
    params.require(:speak).permit(:content)
  end

  def set_content
    @speak = Speak.find(params[:id})
  end
end

class SpeaksController < ApplicationController
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

  private

  def speak_param
    params.require(:speak).permit(:content)
  end
end

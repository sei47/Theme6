class SpeaksController < ApplicationController
  def index
    @speak = Speak.all
  end

  def new
    @speak = Speak.new
  end
end

class People::MoveController < ApplicationController
  before_action :load_person

  def create

  end

  private

  def load_person
    @person = People.find(params[:person_id])
  end
end
class DogsController < ApplicationController
  def index
    @breed = params[:breed]
    @dog_picture = get_dog_picture(@breed)

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def get_dog_picture(breed)
    return nil if breed.nil?  # Handle the case where breed is nil

    url = "https://dog.ceo/api/breed/#{breed.downcase}/images/random"
    response = RestClient.get(url)
    data = JSON.parse(response.body)

    data['message'] # This will be the URL of the dog picture
  rescue RestClient::ExceptionWithResponse => e
    nil
  end
end

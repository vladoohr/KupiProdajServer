class Api::V1::AdvertisementsController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:new]

	def new
		@ad = Advertisement.new(ad_params)
		@ad.user_id = params[:user]
		@ad.city_id = params[:location]
		@ad.category_id = params[:category]

		if @ad.save
			render json: {message: "Успешно додаден оглас!"}, status: :ok
		else
			# pass only error messages
			@errors = Array.new
			@ad.errors.each do |attribute, error|
				@errors.push(error)
			end

			render json: {errors: @errors}, status: :bad_content
		end

	# ensure
	# 	clean_tempfile
	end

	def show
		@ad = Advertisement.find(params[:id])

		render json: @ad
	end

	private
	def ad_params
		the_params = params.require(:advertisement).permit(:title, :description, :price, :purpose, :state, :image)
		# the_params[:image] = parse_image_data(the_params[:image]) if the_params[:image]
    # the_params
	end

	def parse_image_data(base64_image)
    filename = "upload-image"
    in_content_type, encoding, string = base64_image.split(/[:;,]/)[1..3]

    @tempfile = Tempfile.new(filename)
    @tempfile.binmode
    @tempfile.write Base64.decode64(string)
    @tempfile.rewind

    # for security we want the actual content type, not just what was passed in
    content_type = `file --mime -b #{@tempfile.path}`.split(";")[0]

    # we will also add the extension ourselves based on the above
    # if it's not gif/jpeg/png, it will fail the validation in the upload model
    extension = content_type.match(/gif|jpeg|png/).to_s
    filename += ".#{extension}" if extension

    ActionDispatch::Http::UploadedFile.new({
      tempfile: @tempfile,
      content_type: content_type,
      filename: filename
    })
  end

  def clean_tempfile
    if @tempfile
      @tempfile.close
      @tempfile.unlink
    end
  end
end
class ImageRepository
    def initialize
        @image = Image.new
    end

    def get_all_images
        @image.all
    end

    def get_image_by_id(id)
        @image.find(id)
    end

    def create_image(image_params)
        @image.create(image_params)
    end

    def delete_image(id)
        @image.find(id).destroy
    end
end
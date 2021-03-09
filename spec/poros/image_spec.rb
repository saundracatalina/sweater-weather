require 'rails_helper'

describe Image do
  it 'exists and has attributes' do
    null = nil
    data =
    {
    "total": 2652,
    "total_pages": 2652,
    "results": [
        {
            "id": "cQKn3fl4s5w",
            "created_at": "2020-11-10T13:40:05-05:00",
            "updated_at": "2021-03-08T21:20:33-05:00",
            "promoted_at": null,
            "width": 3712,
            "height": 5568,
            "color": "#a6d9f3",
            "blur_hash": "LdFsPuH;n,I;F|MbozxaM{%Mt7WB",
            "description": "INSTAGRAM: SARRAMPHOTOGRAPHY\n",
            "alt_description": "text",
            "urls": {
                "raw": "https://images.unsplash.com/photo-1605033532441-30378efcd7ef?ixid=MnwyMTI4MzN8MHwxfHNlYXJjaHwxfHxEZW52ZXIsJTIwQ098ZW58MHx8fHwxNjE1MzEwMzE5&ixlib=rb-1.2.1",
                "full": "https://images.unsplash.com/photo-1605033532441-30378efcd7ef?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyMTI4MzN8MHwxfHNlYXJjaHwxfHxEZW52ZXIsJTIwQ098ZW58MHx8fHwxNjE1MzEwMzE5&ixlib=rb-1.2.1&q=85",
                "regular": "https://images.unsplash.com/photo-1605033532441-30378efcd7ef?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMTI4MzN8MHwxfHNlYXJjaHwxfHxEZW52ZXIsJTIwQ098ZW58MHx8fHwxNjE1MzEwMzE5&ixlib=rb-1.2.1&q=80&w=1080",
                "small": "https://images.unsplash.com/photo-1605033532441-30378efcd7ef?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMTI4MzN8MHwxfHNlYXJjaHwxfHxEZW52ZXIsJTIwQ098ZW58MHx8fHwxNjE1MzEwMzE5&ixlib=rb-1.2.1&q=80&w=400",
                "thumb": "https://images.unsplash.com/photo-1605033532441-30378efcd7ef?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMTI4MzN8MHwxfHNlYXJjaHwxfHxEZW52ZXIsJTIwQ098ZW58MHx8fHwxNjE1MzEwMzE5&ixlib=rb-1.2.1&q=80&w=200"
            },
            "links": {
                "self": "https://api.unsplash.com/photos/cQKn3fl4s5w",
                "html": "https://unsplash.com/photos/cQKn3fl4s5w",
                "download": "https://unsplash.com/photos/cQKn3fl4s5w/download",
                "download_location": "https://api.unsplash.com/photos/cQKn3fl4s5w/download?ixid=MnwyMTI4MzN8MHwxfHNlYXJjaHwxfHxEZW52ZXIsJTIwQ098ZW58MHx8fHwxNjE1MzEwMzE5"
            },
            "categories": [],
            "likes": 6,
            "liked_by_user": false,
            "current_user_collections": [],
            "sponsorship": null,
            "user": {
                "id": "7vaZ99fSB5o",
                "updated_at": "2021-03-09T12:08:33-05:00",
                "username": "nima_sarram",
                "name": "Nima Sarram",
                "first_name": "Nima",
                "last_name": "Sarram",
                "twitter_username": null,
                "portfolio_url": null,
                "bio": "INSTAGRAM: SARRAMPHOTOGRAPHY\r\nBased out of Denver Colorado, 17 years old.",
                "location": "Denver, Co",
                "links": {
                    "self": "https://api.unsplash.com/users/nima_sarram",
                    "html": "https://unsplash.com/@nima_sarram",
                    "photos": "https://api.unsplash.com/users/nima_sarram/photos",
                    "likes": "https://api.unsplash.com/users/nima_sarram/likes",
                    "portfolio": "https://api.unsplash.com/users/nima_sarram/portfolio",
                    "following": "https://api.unsplash.com/users/nima_sarram/following",
                    "followers": "https://api.unsplash.com/users/nima_sarram/followers"
                },
                "profile_image": {
                    "small": "https://images.unsplash.com/profile-1601953490826-6eeca3f02875image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
                    "medium": "https://images.unsplash.com/profile-1601953490826-6eeca3f02875image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
                    "large": "https://images.unsplash.com/profile-1601953490826-6eeca3f02875image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"
                },
                "instagram_username": "sarramphotography",
                "total_collections": 15,
                "total_likes": 21,
                "total_photos": 198,
                "accepted_tos": true,
                "for_hire": true
            },
            "tags": [
                {  "type": "search",
                    "title": "hair" },
                {  "type": "search",
                    "title": "accessories" },
                {  "type": "search",
                    "title": "accessory" }
          ]}]}
      location = "Denver, CO"
      image = Image.new(data, location)
      expect(image).to be_an(Image)
      expect(image).to be_an_instance_of(Image)
      expect(image.credit).to be_a(Hash)
      expect(image.credit[:source]).to be_a(String)
      expect(image.credit[:author]).to be_a(String)
      expect(image.image).to be_a(Hash)
      expect(image.image[:image_url]).to be_a(String)
      expect(image.image[:location]).to be_a(String)
  end
end

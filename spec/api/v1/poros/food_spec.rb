require 'rails_helper'

describe CurrentWeather do
  it 'exists and has attributes' do
    data = {
    "businesses": [
        {
            "id": "vH1oT1uDl0Ch3wyroJuNbg",
            "alias": "mozos-great-american-heroes-pueblo",
            "name": "Mozo's Great American Heroes",
            "image_url": "https://s3-media2.fl.yelpcdn.com/bphoto/AlCHi5L9Inqy6y06lejSZQ/o.jpg",
            "is_closed": false,
            "url": "https://www.yelp.com/biz/mozos-great-american-heroes-pueblo?adjust_creative=edQZrtzpJXP6FIOAychYIQ&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=edQZrtzpJXP6FIOAychYIQ",
            "review_count": 11,
            "categories": [
                {
                    "alias": "tradamerican",
                    "title": "American (Traditional)"
                }
            ],
            "rating": 4.0,
            "coordinates": {
                "latitude": 38.2366307,
                "longitude": -104.6250101
            },
            "transactions": [
                "pickup",
                "delivery"
            ],
            "price": "$",
            "location": {
                "address1": "1904 Lake Ave",
                "address2": "",
                "address3": "",
                "city": "Pueblo",
                "zip_code": "81004",
                "country": "US",
                "state": "CO",
                "display_address": [
                    "1904 Lake Ave",
                    "Pueblo, CO 81004"
                ]
            },
            "phone": "+17195667792",
            "display_phone": "(719) 566-7792",
            "distance": 5864.890545053168
        }
    ],
    "total": 34,
    "region": {
        "center": {
            "longitude": -104.5733642578125,
            "latitude": 38.27035217485165
        }
    }
}

    food = Food.new(data)
    expect(food.name).to be_a(String)
    expect(food.name).to eq("Mozo's Great American Heroes")
    expect(food.address).to be_a(String)
    expect(food.address).to eq("1904 Lake Ave Pueblo, CO 81004")
  end
end

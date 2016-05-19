class User < ActiveRecord::Base

  def self.import!
    users_data ||= File.open('public/user_list').readlines
      users_data.each do |data|
        data = JSON.parse(data)
        User.create(name: data['name'],
                    user_id: data['user_id'],
                    distance: User.distance(data['latitude'].to_f, data['longitude'].to_f))
    end
  end

  private
  def self.distance(latitude, longitude)
    earth_radius = 6372795
    factor = Math::PI/180

    ofice_latitude = 53.3381985*factor
    ofice_longitude = -6.2592576*factor
    user_latutude = latitude*factor
    user_longitude = longitude*factor

    cos_ofice_lat = Math.cos(ofice_latitude)
    cos_user_lat = Math.cos(user_latutude)
    sin_ofice_lat = Math.sin(ofice_latitude)
    sin_user_lat = Math.sin(user_latutude)
    delta = user_longitude - ofice_longitude
    cos_delta = Math.cos(delta)
    sin_delta = Math.sin(delta)

    y = Math.sqrt(((cos_user_lat*sin_delta) **2)+((cos_ofice_lat*sin_user_lat-sin_ofice_lat*cos_user_lat*cos_delta) ** 2))
    x = sin_ofice_lat*sin_user_lat+cos_ofice_lat*cos_user_lat*cos_delta
    degrees_data = Math.atan2(y, x)
    (degrees_data*earth_radius).round(0)
  end
end

module UsersHelper

  SAFE_USER_ATTRIBUTES = ['id', 'name']

  def gravatar(user, options = { size: 50 })
    image_tag(
      gravatar_url(user.email, options), alt: user.name, class: 'gravatar')
  end

  def gravatar_url(email, options = { size: 30 })
    size = options[:size]
    gravatar_id = Digest::MD5.hexdigest(email.downcase)
    "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
  end

  def filter_user_attributes(value)
    filter = -> (user) do
      attrs = user.attributes.select do |key, value|
        SAFE_USER_ATTRIBUTES.include?(key)
      end
      attrs[:gravatar_url] = gravatar_url(user.email)
      attrs
    end

    if value.is_a?(User)
      filter.call(value)
    elsif value.respond_to?(:map)
      value.map(&filter)
    else
      value
    end
  end

end

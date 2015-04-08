class CoughSyrupTiltTemplate < Tilt::Template
  self.default_mime_type = 'application/javascript'

  @@default_bare = false

  def self.default_bare
    @@default_bare
  end

  def self.default_bare=(value)
    @@default_bare = value
  end

  # DEPRECATED
  def self.default_no_wrap
    @@default_bare
  end

  # DEPRECATED
  def self.default_no_wrap=(value)
    @@default_bare = value
  end

  def self.engine_initialized?
    defined? ::CoughSyrup
  end

  def initialize_engine
    require_template_library 'cough_syrup'
  end

  def prepare
    if !options.key?(:bare) and !options.key?(:no_wrap)
      options[:bare] = self.class.default_bare
    end
  end

  def evaluate(scope, locals, &block)
    @output ||= ::CoughSyrup.compile(data, options)
  end

  def allows_script?
    false
  end
end

Rails.application.assets.register_engine('.cough', CoughSyrupTiltTemplate)

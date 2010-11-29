class Fabrication::Generator::Mongoid < Fabrication::Generator::Base

  def self.supports?(klass)
    defined?(Mongoid) && klass.ancestors.include?(Mongoid::Document)
  end
  
  private
  
  def after_generation(options)
    instance.save! if options[:save] && instance.respond_to?(:save!)
  end
end

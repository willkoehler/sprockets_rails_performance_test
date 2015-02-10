# HumanizeAccessors are included in ActiveRecord by default. They can also be
# inlcuded in any class that uses ActiveAttr.
module HumanizedAccessors
  extend ActiveSupport::Concern
  include ActionView::Helpers::NumberHelper

  module ClassMethods
    def humanized_number_accessor(f, options={})
      if f.is_a? Array
        f.each { |f| humanized_number_accessor f, options }
      else
        define_method("#{f}_humanized") do
          val = read_attribute(f)
          val ? number_with_delimiter(val, options) : nil
        end
        define_method("#{f}_humanized=") do |e|
          write_attribute(f, e.delete(",$"))
        end
      end
    end

    def humanized_currency_accessor(f, options={})
      define_method("#{f}_humanized") do
        val = read_attribute(f)
        val ? number_to_currency(val, options) : nil
      end
      define_method("#{f}_humanized=") do |e|
        write_attribute(f, e.delete(",$"))
      end
    end

    def humanized_percentage_accessor(f, options={})
      define_method("#{f}_humanized") do
        val = read_attribute(f)
        val ? number_to_percentage(val*100, options) : nil
      end
      define_method("#{f}_humanized=") do |e|
        value = e.present? ? e.delete(",%").to_f/100 : nil
        write_attribute(f, value)
      end
    end
  
    def humanized_phone_accessor(f, options={})
      define_method("#{f}_humanized") do
        val = read_attribute(f)
        val ? number_to_phone(val, options) : nil
      end
      define_method("#{f}_humanized=") do |e|
        write_attribute(f, e.delete("()-"))
      end
    end
  
    # accessor compatible with jQuery date picker
    def date_picker_accessor(f)
      define_method("#{f}_picker") do
        val = read_attribute(f)
        val ? val.strftime('%-m/%-d/%Y') : nil
      end
      define_method("#{f}_picker=") do |v|
        date = Date.strptime(v, "%m/%d/%Y") rescue nil
        write_attribute(f, date)
      end
    end
  end
end

ActiveRecord::Base.send(:include, HumanizedAccessors)
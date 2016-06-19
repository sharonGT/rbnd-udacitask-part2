class EventItem
  include Listable
  attr_reader :description, :start_date, :end_date, :current
  @@type = "event"

  def initialize(description, options={})
    @description = description
    @current = options[:current]
    @start_date = Date.parse(options[:start_date]) if options[:start_date]
    @end_date = Date.parse(options[:end_date]) if options[:end_date]
  end

  def details
    format_description(@description) + "event dates: " + format_date(start_date: @start_date, end_date: @end_date) + linebreak.to_s + format_progressBar(@current).to_s 
  end

  def type
    @@type
  end
  
end

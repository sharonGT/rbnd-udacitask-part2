class TodoItem
  include Listable
  attr_reader :description, :due, :priority, :current
  @@type = "todo"

  def initialize(description, options={})
    @description = description
    @current = options[:current]
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    if options[:priority]
      if ['high','medium', 'low'].include? options[:priority]
        @priority = options[:priority]
      else
        raise UdaciListErrors::InvalidPriorityValueError
      end
    end
  end


  def details
    format_description(@description) + "due: " +
    format_date(due: @due) + 
    format_priority(@priority) +
    linebreak.to_s +
    format_progressBar(@current).to_s 
  end

  def type
    @@type
  end
  
end

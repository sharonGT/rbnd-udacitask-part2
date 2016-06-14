class TodoItem
  include Listable
  attr_reader :description, :due, :priority

  def initialize(description, options={})
    @description = description
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
    format_priority(@priority)
  end
  
  def change_due_date(due_date)
    @due = Chronic.parse(due_date)
  end
  
end

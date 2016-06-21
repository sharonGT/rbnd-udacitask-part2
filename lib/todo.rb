class TodoItem
  include Listable
  attr_reader :description, :due, :priority, :current

  def initialize(description, options={})
    @description = description
    @current = options[:current]
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    if options[:priority]
      if ['high','medium', 'low'].include? options[:priority]
        @priority = options[:priority]
      else
        raise UdaciListErrors::InvalidPriorityValueError, "Priority value is invalid"
      end
    end
  end


  def details
    "Type: #{type}     " +
    format_description(@description) + "due: " +
    format_date(due: @due) + 
    format_priority(@priority) +
    linebreak.to_s +
    format_progressBar(@current).to_s 
  end

  def type
    "todo"
  end

  def change_due_date(due_date)
    @due = Chronic.parse(due_date)
  end
  
end

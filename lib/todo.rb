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
        raise UdaciListErrors::InvalidPriorityValueError
      end
    end
  end

  
  def format_progressBar(current)
    total = 100
    progress = Formatador::ProgressBar.new(total, :color => "light_blue")
    current.to_i.times do
    progress.increment
    sleep 0.02
    end
  end 

  def linebreak
    puts ""
  end

  def details
    format_description(@description) + "due: " +
    format_date(due: @due) + 
    format_priority(@priority) +
    linebreak.to_s +
    format_progressBar(@current).to_s 
  end

end

module Listable
  # Listable methods go here
  def format_description(description)
  	"#{description}".ljust(30)
  end 

  def format_date(options = {})
      if options[:start_date] || options[:end_date]
          dates = options[:start_date].strftime("%D") if options[:start_date]
          dates << " -- " + options[:end_date].strftime("%D") if options[:end_date]
          dates = "N/A" if !dates
          dates
          
       else
          options[:due] ? options[:due].strftime("%D") : "No due date"
       end
  end

   def format_priority(priority)
    value = " ⇧".colorize(:red) if priority == "high"
    value = " ⇨".colorize(:blue) if priority == "medium"
    value = " ⇩".colorize(:green) if priority == "low"
    value = "" if ! priority
    return value
  end

end

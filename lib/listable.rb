module Listable
  # Listable methods go here

  def format_description(description)
  	"#{description}".ljust(30)
  end 

  def format_date(options = {})
      if options[:start_date] || options[:end_date]
          dates = options[:start_date].strftime("%D") if options[:start_date]
          dates << " -- " + options[:end_date].strftime("%D") + "\n" if options[:end_date]
          dates = "N/A" if !dates
          dates
          
       else
          options[:due] ? options[:due].strftime("%D") : "No due date" 
       end
  end

   def format_priority(priority)
    value = " ⇧ ".colorize(:red) + "\n" if priority == "high"
    value = " ⇨ ".colorize(:blue) + "\n" if priority == "medium"
    value = " ⇩ ".colorize(:green) + "\n" if priority == "low"
    value = " " + "\n" if ! priority
    return value
  end

  def format_progressBar(current)
    total = 100
    progress = Formatador.redisplay_progressbar(current, total, :color => "magenta", :label => "Progress")
    linebreak
    puts progress
  end

  def linebreak
    puts ""
  end

end

class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title]
    @items = []
  end

  def add (type, description, options={})
    type = type.downcase
    allowed_types = { todo: TodoItem, link: LinkItem, event: EventItem }
    if allowed_types.keys.include? type.to_sym
      @items.push allowed_types[type.to_sym].new(description,options)
    else 
      raise UdaciListErrors::InvalidItemTypeError, "#{type} type does not exist"
    end
end

  def delete(index)
    if index < @items.length
    @items.delete_at(index - 1) 
  else
    raise UdaciListErrors::IndexExceedsListSizeError, "Index has exceeded list size"
  end
  end

  def all
    puts "-" * @title.length
    puts @title
    puts "-" * @title.length
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end

  def filter(type)
    show_type = @items.select {|item| item.type == type.downcase}
    show_type.each {|item| puts item.details}
    show_type
  end


  def delete_more(indexes)
    indexes.sort { |x, y| y <=> x }
    puts indexes
    indexes.each do |index|
      delete(index)
    end
  end 

  def change_due_date(index, due_date)
    @items[index-1].change_due_date(due_date) if @items[index-1].type == "todo"
  end
  
end


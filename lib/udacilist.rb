class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title]
    @items = []
  end

  def add(type, description, options={})
    type = type.downcase
    case type
    when "todo"
    @items.push TodoItem.new(description, options) 
    when "event"
    @items.push EventItem.new(description, options) 
    when "link"
    @items.push LinkItem.new(description, options) 
    else
    raise UdaciListErrors::InvalidItemTypeError, "image is not the correct type." if type == "image"
  end
end

  def delete(index)
    if index < 9
    @items.delete_at(index - 1) 
  else
    raise UdaciListErrors::IndexExceedsListSizeError
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

  def delete_description(description)
    delete = @items.delete_if {|item| item.description == description}
    delete
  end
  end

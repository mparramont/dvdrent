module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | Dvd"
    end
  end
end

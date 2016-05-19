class Array

  def flatten_out!
    result =[]
    self.each do |i|
      if i.class == self.class
        result += i.flatten_out!
      else
        result << i
      end
    end
    result
  end

end



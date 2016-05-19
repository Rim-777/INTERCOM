class Array

  def result
    @@result ||= []
  end


  def flatten_out!
    self.each do |i|
      if i.class == self.class
        i.flatten_out!
      else
        result << i
      end
    end
    result
  end
end

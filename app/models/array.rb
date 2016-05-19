class Array

  def result
    @@result
  end

  def flatten_out!(clear: false)
    @@result =[] unless clear
    self.each do |i|
      if i.class == self.class
        i.flatten_out!(clear:true)
      else
        result << i
      end
    end
    result
  end
end



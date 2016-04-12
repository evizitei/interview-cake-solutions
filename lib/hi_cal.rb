def condense_meeting_times(input)
  output = []
  input.each do |range|
    inserted = false
    output.each_with_index do |existing_range, index|
      if range[0] >= existing_range[0]
        if range[0] <= existing_range[1]
          if existing_range[1] < range[1]
            existing_range[1] = range[1]
          end
          inserted = true
        end
      else
        if range[1] >= existing_range[0]
          existing_range[0] = range[0]
        else
          output.insert(index, range)
        end
        inserted = true
      end
    end
    output << range unless inserted
  end

  return output
end

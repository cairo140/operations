class Fixnum
  def superplus(n)
    self + n
  end

  def superminus(n)
    self - n
  end
end

def operation(numbers, target, limit = 0)
  results = []
  operations = [
    lambda { |x, y|"#{x}+#{y}" },
    lambda { |x, y|"#{x}-#{y}" },
    lambda { |x, y|"#{x}*#{y}" },
    lambda { |x, y|"#{x}/#{y}" },
    lambda { |x, y|"#{x}.superplus(#{y})" },
    lambda { |x, y|"#{x}.superminus(#{y})" }
  ]

  numop = operations.length
  numnum = numbers.length
  (2*(numop**(numnum-1))).times do |i|
    n = i
    s = (n%2 == 0 ? '' : '-') + numbers[0].to_s
    n = n/2
    (1..(numnum-1)).each do |j|
      s = operations[n%numop].call(s, numbers[j])
      n = n/numop
    end
    t = begin
          eval(s)
        rescue ZeroDivisionError
          'ZeroDivisionError'
        end
    if t.to_i == target
      results << "#{t}=#{s}"
      return results if results.length == limit
    end
  end

  results
end

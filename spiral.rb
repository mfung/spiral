class SpiralMatrix
  attr_accessor :matrix
  def initialize(params)
    @matrix_size = params.to_i
    @matrix      = Array.new(@matrix_size) {Array.new(@matrix_size,'00')}
  end

  def even_spiral
    fill_spiral(starting_value: (@matrix_size * (@matrix_size - 1)), row: 0, column: (@matrix_size-1), sequence: [:down, :left, :up, :right])
  end

  def odd_spiral
    fill_spiral(starting_value: (@matrix_size * @matrix_size), row: (@matrix_size-1), column: (@matrix_size-1), sequence: [:left, :up, :right, :down])
  end

  def calculate_steps
    return is_even? ? @matrix_size.downto(0).each_cons(2).to_a.flatten[1...-1] : @matrix_size.downto(0).each_cons(2).to_a.flatten[0...-1]
  end

  def fill_spiral(params = {})
    starting_value = params[:starting_value]
    row, column    = params[:row], params[:column]
    sequence       = params[:sequence]

    calculate_steps.each_with_index do |step, index|
      seq = params[:sequence][index % 4]
      results = self.method(seq).call(row: row, column: column, start_value: starting_value, steps: step)
      row, column, starting_value = results[:row], results[:column], results[:value]
    end
  end

  def generate
    is_even? ? even_spiral : odd_spiral
    return @matrix
  end

  def left(params = {})
    @row           = params[:row]
    @column        = params[:column]
    @value         = params[:start_value]
    @steps         = params[:steps]
    @return_column = 0

    (0).upto(@steps-1).each do |index| 
      @return_column = @column - index
      @matrix[@row][@return_column] = "%02d" % (@value).to_s
      @value -= 1
    end
    return {value: @value, row: @row-1, column: @return_column}
  end

  def right(params = {}) 
    @row           = params[:row]
    @column        = params[:column]
    @value         = params[:start_value]
    @steps         = params[:steps]
    @return_column = 0

    (0).upto(@steps-1).each do |index|
      @return_column = @column + index
      @matrix[@row][@return_column] = "%02d" % (@value).to_s
      @value -= 1
    end
    return {value: @value, row: @row+1, column: @return_column}
  end

  def up(params = {})
    @row         = params[:row]
    @column      = params[:column]
    @value       = params[:start_value]
    @steps       = params[:steps]
    @return_row  = 0

    (0).upto(@steps-1).each do |index|
      @return_row = @row - index 
      @matrix[@return_row][@column] = "%02d" % (@value).to_s
      @value -= 1
    end
    return {value: @value, row: @return_row, column: @column+1}
  end

  def down(params = {})
    @row         = params[:row]
    @column      = params[:column]
    @value       = params[:start_value]
    @steps       = params[:steps]
    @return_row  = 0

    (0).upto(@steps-1).each do |index| 
      @return_row = @row + index
      @matrix[@return_row][@column] = "%02d" % (@value).to_s
      @value -= 1
    end
    return {value: @value, row: @return_row, column: @column-1}
  end

  def is_even?
    return @matrix_size % 2 == 0
  end

  def output_to_screen
    self.generate.each {|row| p row}
  end
end
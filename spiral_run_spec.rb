require File.dirname(__FILE__) + '/spiral'

describe SpiralMatrix do
  context "when initialized" do
    it "returns [] if given a matrix size of 0" do
      matrix = SpiralMatrix.new 0
      result_matrix = matrix.matrix
      expect(result_matrix).to eq([])      
    end
    it "returns a matrix of [[\"00\"]] when given a matrix size of 1" do
      matrix = SpiralMatrix.new 1
      result_matrix = matrix.matrix
      expect(result_matrix).to eq([["00"]]) 
    end

    it "returns a matrix of [[\"00\", \"00\"],[\"00\", \"00\"]] when given a matrix size of 2" do
      matrix = SpiralMatrix.new 2
      result_matrix = matrix.matrix
      expect(result_matrix).to eq([["00","00"],["00","00"]]) 
    end

    it "returns a matrix of [[\"00\", \"00\", \"00\"],[\"00\", \"00\", \"00\"], [\"00\", \"00\", \"00\"]] when given a matrix size of 3" do
      matrix = SpiralMatrix.new 3
      result_matrix = matrix.matrix
      expect(result_matrix).to eq([["00","00", "00"],["00","00", "00"], ["00","00", "00"]]) 
    end
  end

  context "when given a odd matrix" do
    let(:matrix_size) {$matrix_size = 3}
    let(:matrix) {SpiralMatrix.new matrix_size}

    describe "starting point" do
      it "returns \"09\" when given matrix size 3" do
        matrix.generate
        result_matrix = matrix.matrix
        expect(result_matrix[matrix_size-1][matrix_size-1]).to eq("09") 
      end
    end

    describe "starting row" do
      it "returns a row of [\"07\", \"08\", \"09\"]" do
        matrix.generate
        result_first_matrix_row = matrix.matrix[matrix_size-1]
        expect(result_first_matrix_row).to eq(["07","08", "09"]) 
      end
    end
  end

end
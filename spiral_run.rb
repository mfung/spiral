#!/usr/bin/env ruby

require File.dirname(__FILE__) + '/spiral'

matrix = SpiralMatrix.new ARGV[0]
matrix.output_to_screen
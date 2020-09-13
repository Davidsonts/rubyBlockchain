require 'digest'

class Block
  attr_reader :index, :previousHash, :data, :timestamp, :hash
  def initialize(index = 0, previousHash = nil, data = 'Genesis block')
    @index = index
    @previousHash = previousHash
    @data = data
    @timestamp = Time.now
    @hash = self.generateHash
  end

  def generateHash
    return Digest::SHA2.new(256).hexdigest [@index, @previousHash, @data, @timestamp].to_s
  end
end

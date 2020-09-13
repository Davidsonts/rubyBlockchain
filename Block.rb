require 'digest'

class Block
  attr_reader :index, :previousHash, :data, :timestamp, :hash
  def initialize(index = 0, previousHash = nil, data = 'Genesis block', difficulty = 4)
    @index = index
    @previousHash = previousHash
    @data = data
    @timestamp = Time.now
    @difficulty = difficulty
    @nonce = 0
    self.mine
  end

  def generateHash
    return Digest::SHA2.new(256).hexdigest [@index, @previousHash, @data, @timestamp, @nonce].to_s
  end

  def mine
    @hash = self.generateHash
    str_zero = '0' * @difficulty
    until @hash[0..@difficulty - 1].match?str_zero,0 do
      @nonce +=1
      @hash = self.generateHash
    end
  end
  
end

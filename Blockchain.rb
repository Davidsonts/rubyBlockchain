require_relative 'block'

class Blockchain
  attr_reader :blocks, :index
  def initialize(difficulty = 4)
    @blocks = [Block.new]
    @index = 1
    @difficulty = difficulty
  end

  def getLastBlock
    return @blocks.last
  end

  def addBlock(data)
    previousHash = self.getLastBlock.hash
    block = Block.new(@index, previousHash, data, @difficulty)
    @index +=1 
    @blocks.push(block)
    return previousHash
  end

  def isValid
    for i in 1..@blocks.length - 1
      currentBlock = @blocks[i]
      previousBlock = @blocks[i - 1]

      if currentBlock.hash != currentBlock.generateHash
        return false
      end

      if currentBlock.index != previousBlock.index.+(1)
        return false
      end
      
      if currentBlock.previousHash != previousBlock.hash
        return false
      end
    end
    return true
  end
end
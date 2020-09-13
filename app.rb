require_relative 'blockchain'  

blockchain = Blockchain.new
puts blockchain.addBlock({ amount: 4 })
puts blockchain.addBlock({ amount: 50 })
puts blockchain.isValid
puts blockchain.blocks[1].data['amount'] = 30000 # ataque malicioso
puts blockchain.isValid
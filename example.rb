require 'mytradewizard'

class Example < MyTradeWizard::StockTradingSystem
  def run

    @positions.each do |position|
      preload 20, position.stock
      sell position if close(t) < SMA(days t-19..t)
    end

    DOW30.stocks.each do |stock|
      preload 20, stock
      buy if close(t) > SMA(days t-19..t)
    end

  end
end

example = Example.new
example.run
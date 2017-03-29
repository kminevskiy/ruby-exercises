class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number < 0

    factors = (1...number).select { |num| number % num == 0 }

    result = factors.reduce(:+)

    case
      when result < number then 'deficient'
      when result > number then 'abundant'
      when result == number then 'perfect'
    end
  end
end

=begin
JS solution

var PerfectNumber = {
  init: function (number) {
    if (number < 0) { throw "Number must be greater than 0";}
    else {this.number = number;}
  },

  addFactors: function () {
    var factors = [];
    for (var i = 1; i < this.number; i++) {
      if (this.number % i === 0) { factors.push(i) }
    }

    var total = factors.reduce(function (acc, val) {
      return acc + val;
    });

    return total;
  },

  classify: function() {
    var result = this.addFactors();
    if (result < this.number) { return 'deficient' }
    else if (result > this.number) { return 'abundant' }
    else { return 'perfect' }
  }
};

var number = Object.create(PerfectNumber);
number.init(28);
console.log(number.classify());
=end
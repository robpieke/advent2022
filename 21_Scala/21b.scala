import scala.io.Source

object _21b {
  def main(args: Array[String]) {
    type Complex = (Long, Long)
    type ComplexFraction = (Complex, Complex)
    val monkeys = collection.mutable.Map[String, () => ComplexFraction]()
    for (line <- Source.fromFile("input.txt").getLines) {
      val tokens = line.split(" ")
      val key = tokens(0).substring(0, 4)
      if (tokens.length == 2) {
        if (key == "humn") {
          monkeys(key) = () => ((0, 1), (1, 0))
        } else {
          monkeys(key) = () => ((tokens(1).toInt, 0), (1, 0))
        }
      } else {
        var op = tokens(2)
        if (key == "root") {
          op = "-"
        }
        def reduce(frac: ComplexFraction): ComplexFraction = {
          def gcd(a: Long, b: Long): Long = {
            if(b == 0) a else gcd(b, a % b)
          }
          val div = gcd(gcd(frac._1._1, frac._1._2), gcd(frac._2._1, frac._2._2))
          return ((frac._1._1 / div, frac._1._2 / div), (frac._2._1 / div, frac._2._2 / div))
        }
        // All the below assume we only have *one* chain that involves "humn".
        // If we had multiple monkeys dependent on the "humn" monkey, this would
        // end up being insanely more complicated, needing to track (and solve)
        // a polynomial.
        if (op == "+") {
          def add(f1: ComplexFraction, f2: ComplexFraction): ComplexFraction = {
            val ((a1, b1), (c1, d1)) = f1
            val ((a2, b2), (c2, d2)) = f2
            return ((a1*c2 + a2*c1, a1*d2 + b1*c2 + a2*d1 + b2*c1), (c1*c2, c1*d2 + c2*d1))
          }
          monkeys(key) = () => reduce(add(monkeys(tokens(1))(), monkeys(tokens(3))()))
        } else if (op == "-") {
          def sub(f1: ComplexFraction, f2: ComplexFraction): ComplexFraction = {
            val ((a1, b1), (c1, d1)) = f1
            val ((a2, b2), (c2, d2)) = f2
            return ((a1*c2 - a2*c1, a1*d2 + b1*c2 - a2*d1 - b2*c1), (c1*c2, c1*d2 + c2*d1))
          }
          monkeys(key) = () => reduce(sub(monkeys(tokens(1))(), monkeys(tokens(3))()))
        } else if (op == "*") {
          def mul(f1: ComplexFraction, f2: ComplexFraction): ComplexFraction = {
            val ((a1, b1), (c1, d1)) = f1
            val ((a2, b2), (c2, d2)) = f2
            return ((a1*a2, a1*b2 + b1*a2), (c1*c2, c1*d2 + c2*d1))
          }
          monkeys(key) = () => reduce(mul(monkeys(tokens(1))(), monkeys(tokens(3))()))
        } else if (op == "/") {
          def div(f1: ComplexFraction, f2: ComplexFraction): ComplexFraction = {
            val ((a1, b1), (c1, d1)) = f1
            val ((a2, b2), (c2, d2)) = f2
            return ((a1*c2, a1*d2 + b1*c2), (c1*a2, c1*b2 + a2*d1))
          }
          monkeys(key) = () => reduce(div(monkeys(tokens(1))(), monkeys(tokens(3))()))
        }
      }
    }
    val root = monkeys("root")()
    val humn = -root._1._1 / root._1._2
    println(humn)
 }
}
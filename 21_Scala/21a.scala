import scala.io.Source

object _21a {
  def main(args: Array[String]) {
    val monkeys = collection.mutable.Map[String, () => Long]()
    for (line <- Source.fromFile("input.txt").getLines) {
      val tokens = line.split(" ")
      val key = tokens(0).substring(0, 4)
      if (tokens.length == 2) {
        monkeys(key) = () => tokens(1).toInt
      } else if (tokens(2) == "+") {
        monkeys(key) = () => monkeys(tokens(1))() + monkeys(tokens(3))()
      } else if (tokens(2) == "-") {
        monkeys(key) = () => monkeys(tokens(1))() - monkeys(tokens(3))()
      } else if (tokens(2) == "*") {
        monkeys(key) = () => monkeys(tokens(1))() * monkeys(tokens(3))()
      } else if (tokens(2) == "/") {
        monkeys(key) = () => monkeys(tokens(1))() / monkeys(tokens(3))()
      }
    }
    println(monkeys("root")())
  }
}
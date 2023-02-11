object HelloWord {
  def main(args: Array[String]): Unit = {
    var num:Int=0
    for (i <- 1 to 4;j<- 1 to 4;k <- 1 to 4;if i !=j;if i != k ;if j != k ){
        print(s"${i}${j}${k} ")
        num +=1
    }
    println()
    println(s"能组成${num}个")
  }
}
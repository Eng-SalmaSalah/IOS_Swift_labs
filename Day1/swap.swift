import Foundation

func swap (_ firstNum : inout Int, _ secondNum : inout Int){
    var temp : Int;
    temp = firstNum
    firstNum = secondNum
    secondNum = temp
}

var x = 6
var y = 2
swap(&x,&y)
print ("x is : " , x)
print ("y is : " , y)
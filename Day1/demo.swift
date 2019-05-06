import Foundation

print("Hello World")

//optional binding
var possibleNum :  Int?
//possibleNum = 5
if let actualNum = possibleNum {
    print(actualNum)
}
else {
    print("no value")
}

//forced unwraping
let possibleString : String?="salma"
print(possibleString!)

//implicit unwraping
let possibleVal : Int! = 6 
let possibleActualVal : Int = possibleVal
print(possibleActualVal)

//return tuple
func minmax(param param1:Int , _ param2:Int)->(Int,Int){
    return(param1,param2)
}
print(minmax (param:5,10))

//print(minmax (param1:5,param2:10))

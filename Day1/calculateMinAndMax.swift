import Foundation

func calcMinAndMax (_ numbersArray : [Int]) -> (Int,Int)?{
    if numbersArray.isEmpty
    {
        return nil
    }
    else
    {
        var minimum = numbersArray[0]
        var maximum = numbersArray[0]
        for item in 1..<numbersArray.count{
            if numbersArray[item] < minimum{
                minimum = numbersArray[item]
            }
            if numbersArray[item] > maximum{
                maximum = numbersArray[item]
            }
        }
        return (minimumNumber : minimum , maximumNumber : maximum)
    }
}

var numbers : [Int] = [1,10,5,20,100,95]
var emptyArray = [Int]()
if var result = calcMinAndMax(numbers)
{
    print ("result tuple is:" , result)
    print ("minimum value is:", result.0)
    print ("maximum value is:", result.1)
}
else
{
    print ("Array is empty")
}
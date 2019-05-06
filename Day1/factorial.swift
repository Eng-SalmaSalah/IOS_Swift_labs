import Foundation

func getFactorial(number param: Int) -> Int{
    var result : Int = 1
    if param==0
    {
        return 1
    }
    else if param < 0
    {
        return -1
    }
    else
    {
        for num in 1...param
            {result *= num}
        return result
    }
}

var result = getFactorial(number:5)
if result == -1
{
    print ("enter positive number please")
}
else
{
    print ("result is:" , result)
}








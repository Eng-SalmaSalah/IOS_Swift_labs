import Foundation

func calcPower (_ base:Int, _ power:Int) -> Int{
    
    if power == 0
    {
        return 1
    }
    else
    {
        var result : Int = 1
        for _ in 0..<power
        {
            result *= base
        }
        return result;
    }
}

print(calcPower(2,3));
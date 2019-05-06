import Foundation


func calcPower (_ base:Int, _ power:Int) -> Int{
    
    if power != 0
    {
        return base * calcPower(base,power-1)
    }
    else
    {
        return 1;
    }
}

print(calcPower(2,6));
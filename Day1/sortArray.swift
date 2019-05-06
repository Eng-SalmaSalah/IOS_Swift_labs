import Foundation

func sortArray (numbersArray:[Int]) -> [Int]{
    var sortedArray:[Int] = numbersArray
    for item in 0..<sortedArray.count{
        var minimumIndex = item
        for itr in item+1..<sortedArray.count{
            if sortedArray[itr] < sortedArray[minimumIndex]
            {
                minimumIndex = itr
            }
        }
        var temp = sortedArray[item]
        sortedArray[item] = sortedArray[minimumIndex] 
        sortedArray[minimumIndex] = temp 

    }
    return sortedArray
}

var numbers : [Int] = [1,10,5,20,100,95,6,500]
print(sortArray(numbersArray : numbers))

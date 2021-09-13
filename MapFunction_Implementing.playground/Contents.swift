import Foundation

extension Collection {
    
    public func myMap<T>(_ someClosure: (Element)->T) -> [T] {
        var resultArray : [T] = []
        for element in self {
            resultArray.append(someClosure(element))
        }
        
        return resultArray
    }
}

extension Optional {
    public func myMap<T>(_ someClosure: (Wrapped) -> T) -> Optional<T> {
        guard self != nil else {
            return nil
        }
        let unwrapped : Wrapped = self!
        let mappedValue : Optional<T> = someClosure(unwrapped)
        return mappedValue
    }
}
//:**My Implementation**

//:*Mapping Collections*

let someCollection : Dictionary = [2:4]
print(someCollection.myMap({$0.key * $0.key}))
//let someCollection : ClosedRange<Int> = 1...5
//print(someCollection.myMap({$0 * $0}))
//:*Mapping Optional*
let someOptional : Int? = 45
print(someOptional.myMap({$0 + 2}))
//:**Swift Implementation**
print(someOptional.map({$0 + 4}))

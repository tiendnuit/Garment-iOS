# Garment!

An example of MVVM-C + UIKit + Combine + Realm show/insert Garment items.


# Key Features
-  Using **Swift** + **MVVM-C** + **UIKit** + **Combine** + **POP** + **Realm**
-  Show Garment items sorted by alphabet and create date.
-  Load/save items into Realm Database.
-  Make UI with 2 ways storyboard and programmatically.
-  Light & dark mode compatible.
-  Limit using third-party libraries.
-  Unit test


## Requirements
-   iOS 13.0+
-   Xcode 12.2

## Architecture
Using MVVM-C pattern gives us some benefits like code reuse, ease of testing, bindings make UI updates easier to handle, ease of maintainability.

And splitting off protocols (DataSource and Delegate) into separate objects we can re-use those objects in other view controllers, or use different objects in the same view controller to get different behavior at runtime.
<a href="https://drive.google.com/uc?export=view&id=1O2pDhEdA7Z3eS7j09PtDiUMTC8e10-vK"><img src="https://drive.google.com/uc?export=view&id=1O2pDhEdA7Z3eS7j09PtDiUMTC8e10-vK" style="width: 650px; max-width: 100%; height: auto" title="Click to enlarge picture" />

## Unit Test

    func test_add_new_item_count_1() {
        //Given
        let count = 1
        let item = Garment(name: "Hat", createdDate: Date())
        
        //When
        try! repository().insert(item: item)
        let items = repository().fetchAll()
        
        //Then
        XCTAssertEqual(count, items.count)
    }
    
## Next Features
- Make UI with SwiftUI

## Author
Tommy Doan, [tiendnuit@gmail.com](mailto:tiendnuit@gmail.com) or [tommy.doan2710@gmail.com](mailto:keyhankam@icloud.com)

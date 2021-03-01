//  HealthRecipes
//
//  Created by  Sasha Khomenko on 20.01.2021.
//  Copyright © 2021  Sasha Khomenko. All rights reserved.
//
import SwiftUI

public extension Binding where Value: CaseIterable & Equatable {
  var caseIndex: Binding<Value.AllCases.Index> {
    Binding<Value.AllCases.Index>(
      get: { Value.allCases.firstIndex(of: self.wrappedValue)! },
      set: { self.wrappedValue = Value.allCases[$0] }
    )
  }
}

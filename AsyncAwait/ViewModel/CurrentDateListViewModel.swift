  //
  //  CurrentDateListViewModel.swift
  //  AsyncAwait
  //
  //  Created by soni suman on 23/06/22.
  //

import Foundation
@MainActor
class CurrentDateListViewModel : ObservableObject {
  @Published var currentDates: [CurrentDateViewModel] = []
  func populateDates() async {
    do {
      let currentDate = try await WebServices().getDate()
      if let currentDate = currentDate {
        let CurrentDateViewModel = CurrentDateViewModel(currentDate: currentDate)
        
        self.currentDates.append(CurrentDateViewModel)
        
      }
    } catch {
      print(error)
    }
  }
}

struct CurrentDateViewModel {
  let currentDate : CurrentDate
  var id: UUID {
    currentDate.id
  }
  var date: String {
    currentDate.date
  }
}

  //
  //  ContentView.swift
  //  AsyncAwait
  //
  //  Created by soni suman on 22/06/22.
  //

import SwiftUI

struct ContentView: View {
  
  @StateObject private var currentDateListVM =  CurrentDateListViewModel()
  
  var body: some View {
    NavigationView {
      List(currentDateListVM.currentDates , id: \.id) { currentDate in
        Text(currentDate.date)}.listStyle(.plain)
      
        .navigationTitle("Dates")
        .navigationBarItems(trailing: Button(action: {
          Task {
            await currentDateListVM.populateDates()
          }
        }, label: {
          Image(systemName: "arrow.clockwise.circle")
        }))
        .task {
          await currentDateListVM.populateDates()
        }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}



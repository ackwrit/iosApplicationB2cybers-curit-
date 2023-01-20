//
//  DashBoardView.swift
//  chatApp
//
//  Created by Djino Dissingar on 18/01/2023.
//

import SwiftUI


struct DashBoardView: View {
    @State var now : Date = Date.now
    var body: some View {
        VStack {
            DatePicker(selection: $now) {
                
            }
            .datePickerStyle(.wheel)
            
            
        }
    }
}

struct DashBoardView_Previews: PreviewProvider {
    static var previews: some View {
        DashBoardView()
    }
}

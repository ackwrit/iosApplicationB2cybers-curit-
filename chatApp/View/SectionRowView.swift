//
//  SectionRowView.swift
//  chatApp
//
//  Created by Djino Dissingar on 20/01/2023.
//

import SwiftUI

struct SectionRowView: View {
    var image : String
    var text : String
    var body: some View {
        NavigationLink {
            Text("Je vais vaire une autre page")
        } label: {
            HStack {
                Image(systemName: image)
                Text(text)
            }
        }

       
    }
}

struct SectionRowView_Previews: PreviewProvider {
    static var previews: some View {
        
        SectionRowView(image: "globe", text: "coucou")
    }
}

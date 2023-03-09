//
//  AvataView.swift
//  chatApp
//
//  Created by Djino Dissingar on 10/02/2023.
//

import SwiftUI
import Foundation


struct AvatarView: View {
    @State var user : UserViewModel
    var body: some View {
        if(user.users?.avatar != nil){
           Text("coucou")
            
        }
        else
        {
          Text("image web")
        }
    }
}



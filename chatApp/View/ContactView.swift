//
//  ContactView.swift
//  chatApp
//
//  Created by Djino Dissingar on 08/02/2023.
//

import SwiftUI

struct ContactView: View {
    @StateObject var allUsersVM = AllUserViewModel()
    var body: some View {
        NavigationView {
            List {
                ForEach(allUsersVM.allUser) { appUser in
                    Text(appUser.prenom)
                }
            }
        }
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}

import SwiftUI

struct ProfileView: View {
    @State private var profile: UserProfile = {
        let oneYearAgo = Calendar.current.date(byAdding: .year, value: -1, to: Date()) ?? Date()
        
        return UserProfile(
            username: "Ebay",
            email: "WeareEbay@Ebay.com",
            bio: "Ebay Seller.",
            joinDate: oneYearAgo
        )
    }()
    
    @State private var isEditing: Bool = false
    @State private var tempUsername: String = ""
    @State private var tempBio: String = "" // Non-optional for editing
    
    var body: some View {
        NavigationView {
            List {
                // 1. Identity Header Section
                VStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 15) {
                        Image ("Ebay")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(Color("ButtonColor"))
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray.opacity(0.4), lineWidth: 2))
                        
                        VStack(alignment: .leading) {
                            Text (profile.username)
                                .font(.largeTitle.bold())
                                .foregroundColor(.primary)
                        }
                    }
                    
                    Text("User ID: \(profile.id.uuidString.prefix(12))...")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Text(profile.formattedJoinDate())
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 10)
                .listRowSeparator(.hidden)
                
                // 3. Profile Details / Editing Section
                Section ("Personal Details") {
                    if isEditing {
                        VStack (alignment: .leading) {
                            Text ("Username")
                                .font(.subheadline)
                                .foregroundColor (.secondary)
                            TextField ("Enter a new username", text: $tempUsername)
                                .textFieldStyle(.roundedBorder)
                                .textInputAutocapitalization(.never) // Professional input style
                        }
                        
                        // Email is generally not editable in a real app, keeping it display-only for realism
                        HStack {
                            Label ("Email", systemImage: "envelope")
                            Spacer()
                            Text(profile.email)
                                .foregroundColor(.secondary)
                        }

                        VStack (alignment: .leading) {
                            Text ("Bio")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            TextEditor (text: $tempBio)
                                .frame (height: 100)
                                .border(Color.gray.opacity(0.3))
                                .cornerRadius(5)
                        }
                    } else {
                        HStack {
                            Label ("Email", systemImage: "envelope")
                            Spacer()
                            Text(profile.email)
                                .foregroundColor(.secondary)
                        }
                        
                        VStack (alignment: .leading) {
                            Label ("Bio / About", systemImage: "text.alignleft")
                            Text(profile.bio ?? "No bio provided.") 
                                .font (.body)
                                .padding(.top, 5)
                        }
                    }
                }
                
                // 4. Editing Buttons
                if isEditing {
                    Button {
                        profile.username = tempUsername
                        profile.bio = tempBio
                        isEditing = false
                    } label: {
                        HStack {
                            Spacer()
                            Text("Save Changes")
                            Spacer()
                        }
                    }
                    .disabled(tempUsername.isEmpty)
                    .buttonStyle(.borderedProminent)
                    // Custom ButtonColor for Save button
                    .tint(Color("ButtonColor")) 
                    
                    Button ("Cancel") {
                        isEditing = false
                    }
                    .foregroundColor(.red)
                }
            }
            .listStyle(.insetGrouped)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button (isEditing ? "Done" : "Edit Profile") {
                        if isEditing {
                            profile.username = tempUsername
                            profile.bio = tempBio
                            isEditing = false
                        } else {
                            tempUsername = profile.username
                            tempBio = profile.bio 
                            isEditing = true
                        }
                    }
                }
            }
            .navigationTitle("My Profile")
        }
    }
}

import SwiftUI

struct MainView: View {
    @State private var showInfo = false // State to control info sheet visibility
    
    var body: some View {
        NavigationStack {
            ZStack {
                // New Background Color (solid mocha color)
                Color(red: 0.76, green: 0.69, blue: 0.64)
                    .ignoresSafeArea()
                
                VStack(spacing: 20) { // Reduced spacing
                
                    // BRS Text with Artistic Design
                    VStack(spacing: 5) { // Reduced spacing within the VStack
                        Text("BRS")
                            .font(.system(size: 80, weight: .bold, design: .serif)) // Artistic font style
                            .foregroundColor(.black)
                        
                        // Title Directly Below the BRS Text
                        Text("Bestfit Recruitment Services")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .foregroundColor(.black)
                    }
                    .padding(.top, 30)
                    
                    Spacer().frame(height: 80) // Reduced height to move buttons up
                    
                    // Info Button Icon (tap to show company info)
                    Button(action: {
                        showInfo.toggle()
                    }) {
                        Image(systemName: "info.circle")
                            .font(.system(size: 28))
                            .foregroundColor(.white)
                            .padding(.bottom, 10)
                    }
                    .sheet(isPresented: $showInfo) {
                        // Full-page mocha background with info content
                        InfoSheetView()
                    }
                    
                    // Employee Portal Button
                    NavigationLink(value: UserRole.employee) {
                        HStack {
                            Image(systemName: "person.crop.circle.fill")
                                .font(.title2)
                                .foregroundColor(.white)
                            
                            Text("Employee Portal")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.vertical)
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.black.opacity(0.8))
                        .cornerRadius(15)
                        .shadow(radius: 5)
                    }
                    .padding(.horizontal)
                    
                    // Manager Portal Button
                    NavigationLink(value: UserRole.manager) {
                        HStack {
                            Image(systemName: "person.2.fill")
                                .font(.title2)
                                .foregroundColor(.white)
                            
                            Text("Manager Portal")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.vertical)
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.black.opacity(0.8))
                        .cornerRadius(15)
                        .shadow(radius: 5)
                    }
                    .padding(.horizontal)
                    
                    Spacer() // Spacer below to balance content placement
                    
                    // Footer with Contact Information (minimal)
                    VStack {
                        Text("📧 info@bestfitrecruitment.com")
                            .font(.footnote)
                            .foregroundColor(.white.opacity(0.8))
                        
                        Text("📞 +1 (123) 456-7890")
                            .font(.footnote)
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .padding(.bottom, 20)
                }
            }
            .navigationDestination(for: UserRole.self) { role in
                LoginView(userRole: role)
            }
            .navigationBarHidden(true)
        }
    }
}

// Info Sheet View for Full Page Mocha Background
struct InfoSheetView: View {
    var body: some View {
        VStack(spacing: 15) {
            // Information Header
            Text("About Bestfit Recruitment Services")
                .font(.system(size: 34, weight: .bold, design: .serif)) // Larger, rounded font
                .multilineTextAlignment(.center)
                .padding(.top, 30)
                .foregroundColor(.black) // Black text for contrast
            
            // Detailed Information
            Text("We connect talent with opportunity. With over 15 years of experience, Bestfit Recruitment Services specializes in helping businesses find top talent while assisting candidates in landing their dream jobs. We provide tailored recruitment solutions across multiple industries.")
                .font(.system(size: 22, weight: .regular, design: .serif)) // Larger text size
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .padding()
                .frame(maxWidth: .infinity)
            
            Spacer()
            
            Text("Contact Us: info@bestfitrecruitment.com")
                .font(.footnote)
                .padding(.bottom)
                .foregroundColor(.black)
        }
        .padding()
        .background(Color(red: 0.76, green: 0.69, blue: 0.64)) // Mocha background for full page
        .edgesIgnoringSafeArea(.all)
    }
}

// Enum to identify user role
enum UserRole: Hashable {
    case employee
    case manager
}

// Login View
struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var loginFailed: Bool = false
    @State private var isLoggedIn: Bool = false

    var userRole: UserRole

    // Sample credentials (for testing purposes)
    private let employeeUsername = "Yousuf"
    private let employeePassword = "123"
    private let managerUsername = "Manager"
    private let managerPassword = "12345"

    var body: some View {
        ZStack {
            // Background Color for Login Page (solid mocha color)
            Color(red: 0.76, green: 0.69, blue: 0.64)
                .ignoresSafeArea()
            
            VStack(spacing: 25) {
                // Login Header
                Text(userRole == .employee ? "Employee Login" : "Manager Login")
                    .font(.system(size: 34, weight: .bold, design: .serif)) // Larger, rounded font
                    .foregroundColor(.black)
                    .padding(.top, 40)

                // Instructional Text
                Text("Please enter your credentials to continue")
                    .font(.subheadline)
                    .foregroundColor(.black.opacity(0.7))
                    .padding(.bottom, 10)

                VStack(spacing: 15) {
                    TextField("Username", text: $username)
                        .padding()
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                        .shadow(radius: 3)
                        .padding(.horizontal)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                        .shadow(radius: 3)
                        .padding(.horizontal)
                }
                
                if loginFailed {
                    Text("Invalid username or password")
                        .foregroundColor(.red)
                        .font(.footnote)
                        .padding(.bottom, 10)
                }

                Button(action: {
                    // Validate login credentials based on the user role
                    if (userRole == .employee && username == employeeUsername && password == employeePassword) ||
                       (userRole == .manager && username == managerUsername && password == managerPassword) {
                        isLoggedIn = true
                        loginFailed = false
                    } else {
                        loginFailed = true
                    }
                }) {
                    Text("Login")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                }
                .padding(.horizontal)
                
                // Prompt for Forgot Password (example content)
                Button(action: {
                    // Placeholder for forgot password action
                }) {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .foregroundColor(.blue)
                }

                // Navigate to EmployeeView or ManagerView after successful login
                NavigationLink(destination: isLoggedIn ? destinationView() : nil, isActive: $isLoggedIn) {
                    EmptyView()
                }
            }
            .padding(.bottom, 50)
        }
    }

    // Determines the destination view based on the user role
    @ViewBuilder
    func destinationView() -> some View {
        if userRole == .employee {
            EmployeeView()
        } else {
            ManagerView()
        }
    }
}

// Preview for ContentView
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

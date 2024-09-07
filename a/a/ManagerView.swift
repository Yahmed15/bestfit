import SwiftUI

struct ManagerView: View {
    @State private var searchQuery = ""
    @State private var pendingRequestsCount = 5 // Example data
    @State private var upcomingAbsencesCount = 3 // Example data
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            // Mocha Background Color
            Color(red: 0.76, green: 0.69, blue: 0.64)
                .ignoresSafeArea()

            VStack(spacing: 25) {
                // Header Image or Icon
                Image(systemName: "briefcase.fill")
                    .font(.system(size: 100))
                    .foregroundColor(.black.opacity(0.5))
                    .padding(.top, 20)

                // Manager Portal Title
                Text("Manager Portal")
                    .font(.system(size: 34, weight: .bold, design: .serif))
                    .foregroundColor(.black)
                    .padding(.top, 10)

                // Subtitle for instruction
                Text("Manage your team efficiently")
                    .font(.headline)
                    .foregroundColor(.black.opacity(0.8))
                    .padding(.bottom, 20)

                // Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.black.opacity(0.7))
                    
                    TextField("Search...", text: $searchQuery)
                        .padding()
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                        .shadow(radius: 3)
                }
                .padding(.horizontal)
                
                // Statistics Section
                HStack {
                    StatisticCard(title: "Pending Requests", value: "\(pendingRequestsCount)")
                    StatisticCard(title: "Upcoming Absences", value: "\(upcomingAbsencesCount)")
                }
                .padding(.horizontal)
                
                // Approve/Reject Requests Button
                NavigationLink(destination: ApproveRequestsView()) {
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.title2)
                            .foregroundColor(.white)
                        
                        Text("Approve/Reject Requests")
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

                // View Absences Button
                NavigationLink(destination: ViewAbsencesView()) {
                    HStack {
                        Image(systemName: "calendar.badge.minus")
                            .font(.title2)
                            .foregroundColor(.white)
                        
                        Text("View Absences")
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

                // View Employee Details Button
                NavigationLink(destination: EmployeeDetailsView()) {
                    HStack {
                        Image(systemName: "person.3.fill")
                            .font(.title2)
                            .foregroundColor(.white)
                        
                        Text("View Employee Details")
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

                Spacer() // This will push the Logout button up a bit

                // Logout Button
                Button(action: {
                    // Navigate back to the main page
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Logout")
                        .font(.title2)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius:5)
                }
                .padding(.bottom, 40) // Adds padding from the bottom edge
            }
            .padding()
        }
    }
}

// Custom View for Statistics Cards
struct StatisticCard: View {
    let title: String
    let value: String

    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .foregroundColor(.black)
            
            Text(value)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
        }
        .padding()
        .background(Color.white.opacity(0.9))
        .cornerRadius(10)
        .shadow(radius: 3)
        .frame(maxWidth: .infinity)
    }
}

// Preview for ManagerView
struct ManagerView_Previews: PreviewProvider {
    static var previews: some View {
        ManagerView()
    }
}

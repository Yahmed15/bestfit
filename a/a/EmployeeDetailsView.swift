import SwiftUI

struct EmployeeDetailsView: View {
    @State private var searchText = ""
    @Environment(\.presentationMode) var presentationMode
    
    // Sample employee data (15 random employees)
    let employees: [(name: String, id: String, phone: String, email: String)] = [
        ("Alice Smith", "10001", "555-0101", "alice.smith@example.com"),
        ("Bob Johnson", "10002", "555-0102", "bob.johnson@example.com"),
        ("Charlie Brown", "10003", "555-0103", "charlie.brown@example.com"),
        ("Diana Prince", "10004", "555-0104", "diana.prince@example.com"),
        ("Ethan Hunt", "10005", "555-0105", "ethan.hunt@example.com"),
        ("Fiona Apple", "10006", "555-0106", "fiona.apple@example.com"),
        ("George Clooney", "10007", "555-0107", "george.clooney@example.com"),
        ("Hannah Montana", "10008", "555-0108", "hannah.montana@example.com"),
        ("Ian Malcolm", "10009", "555-0109", "ian.malcolm@example.com"),
        ("Jane Doe", "10010", "555-0110", "jane.doe@example.com"),
        ("Kirk Douglas", "10011", "555-0111", "kirk.douglas@example.com"),
        ("Laura Croft", "10012", "555-0112", "laura.croft@example.com"),
        ("Matt Damon", "10013", "555-0113", "matt.damon@example.com"),
        ("Nancy Drew", "10014", "555-0114", "nancy.drew@example.com"),
        ("Oliver Twist", "10015", "555-0115", "oliver.twist@example.com")
    ]

    // Filtered employees based on the search text
    private var filteredEmployees: [(name: String, id: String, phone: String, email: String)] {
        employees.filter { employee in
            searchText.isEmpty ||
            employee.name.localizedCaseInsensitiveContains(searchText) ||
            employee.id.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        ZStack {
            // Mocha background for the entire view
            Color(red: 0.76, green: 0.69, blue: 0.64)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                // Title with mocha style
                Text("Employee Details")
                    .font(.system(size: 34, weight: .bold, design: .serif))
                    .foregroundColor(.black)
                    .padding()

                // Search bar
                SearchBar(text: $searchText)
                    .padding(.horizontal)

                // Display employee details
                List(filteredEmployees, id: \.id) { employee in
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Name: \(employee.name)")
                            .font(.headline)
                            .foregroundColor(.black)
                        
                        Text("ID: \(employee.id)")
                            .font(.subheadline)
                            .foregroundColor(.black.opacity(0.8))
                        
                        Text("Phone: \(employee.phone)")
                            .font(.subheadline)
                            .foregroundColor(.black.opacity(0.8))
                        
                        Text("Email: \(employee.email)")
                            .font(.subheadline)
                            .foregroundColor(.blue) // Make email addresses stand out
                    }
                    .padding()
                    .background(Color(red: 0.76, green: 0.69, blue: 0.64)) // Mocha background for list items
                    .cornerRadius(10)
                    .shadow(radius: 3)
                }
                .listStyle(PlainListStyle()) // Use PlainListStyle for a clean look
                .padding(.horizontal)
                .frame(maxWidth: .infinity)

                // Logout button
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
                }
                .padding(.bottom)
            }
            .padding()
        }
    }
}

// Search Bar Component
struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.black.opacity(0.5))
            
            TextField("Search Employees", text: $text)
                .padding(7)
                .background(Color.white.opacity(0.9))
                .cornerRadius(10)
                .shadow(radius: 3)
        }
        .padding(.horizontal)
        .background(Color(red: 0.76, green: 0.69, blue: 0.64)) // Mocha background for the search bar
        .cornerRadius(10)
    }
}

struct EmployeeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeDetailsView()
    }
}

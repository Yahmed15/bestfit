import SwiftUI

struct CheckBalanceView: View {
    @Environment(\.presentationMode) var presentationMode

    // Sample data (can be replaced with dynamic data from a backend or state management)
    let holidayBalance = 15
    let timeOffInLieu = 5

    var body: some View {
        ZStack {
            // Mocha background
            Color(red: 0.76, green: 0.69, blue: 0.64)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                // Title with styling
                Text("Check Balance")
                    .font(.system(size: 34, weight: .bold, design: .serif))
                    .foregroundColor(.black)
                    .padding(.top, 40)
                
                // Instructional subtitle
                Text("Your available time off balances")
                    .font(.headline)
                    .foregroundColor(.black.opacity(0.8))
                
                // Balance information with icons
                VStack(spacing: 20) {
                    BalanceItemView(
                        iconName: "calendar.badge.plus",
                        title: "Holiday Balance:",
                        value: "\(holidayBalance) days"
                    )

                    BalanceItemView(
                        iconName: "clock.arrow.circlepath",
                        title: "Time Off In Lieu:",
                        value: "\(timeOffInLieu) hours"
                    )
                }
                .padding(.horizontal)

                Spacer()

                // Logout button at the bottom of the page
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
                        .shadow(radius: 5)
                }
                .padding(.bottom, 20)
            }
            .padding()
        }
    }
}

// Custom View for Balance Items
struct BalanceItemView: View {
    let iconName: String
    let title: String
    let value: String

    var body: some View {
        HStack {
            Image(systemName: iconName)
                .font(.title2)
                .foregroundColor(.black.opacity(0.7))
            
            Text(title)
                .font(.title2)
                .foregroundColor(.black)
            
            Spacer()
            
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.black)
        }
        .padding(.horizontal)
        .padding(.vertical, 12)
        .background(Color.white.opacity(0.9))
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}

// Preview
struct CheckBalanceView_Previews: PreviewProvider {
    static var previews: some View {
        CheckBalanceView()
    }
}

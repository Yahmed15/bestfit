import SwiftUI

struct EmployeeView: View {
    var body: some View {
        ZStack {
            // Mocha background color
            Color(red: 0.76, green: 0.69, blue: 0.64)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                // Employee Portal Header
                VStack(spacing: 10) {
                    // User Profile Icon
                    Image(systemName: "person.crop.circle.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.black.opacity(0.7))
                    
                    // Title: Employee Portal
                    Text("Employee Portal")
                        .font(.system(size: 34, weight: .bold, design: .serif))
                        .foregroundColor(.black)
                }
                .padding(.top, 40)

                // Employee Options Buttons
                VStack(spacing: 20) {
                    NavigationLink(destination: RequestTimeOffView()) {
                        HStack {
                            Image(systemName: "calendar.badge.plus")
                                .font(.title2)
                                .foregroundColor(.white)
                            
                            Text("Request Time Off")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.vertical)
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.black.opacity(0.85)) // Modern style with opacity
                        .cornerRadius(15)
                        .shadow(radius: 5)
                    }
                    .padding(.horizontal)

                    NavigationLink(destination: CheckBalanceView()) {
                        HStack {
                            Image(systemName: "dollarsign.circle")
                                .font(.title2)
                                .foregroundColor(.white)
                            
                            Text("Check Balance")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.vertical)
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.black.opacity(0.85)) // Modern style with opacity
                        .cornerRadius(15)
                        .shadow(radius: 5)
                    }
                    .padding(.horizontal)

                    NavigationLink(destination: AbsenceHistoryView()) {
                        HStack {
                            Image(systemName: "clock.arrow.circlepath")
                                .font(.title2)
                                .foregroundColor(.white)
                            
                            Text("View Absence History")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.vertical)
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.black.opacity(0.85)) // Modern style with opacity
                        .cornerRadius(15)
                        .shadow(radius: 5)
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
                
                // Footer with Contact Information
                VStack {
                    Text("📧 hr@bestfitrecruitment.com")
                        .font(.footnote)
                        .foregroundColor(.white.opacity(0.8))
                    
                    Text("📞 +1 (123) 456-7890")
                        .font(.footnote)
                        .foregroundColor(.white.opacity(0.8))
                }
                .padding(.bottom, 20)
            }
        }
        .navigationTitle("Employee Dashboard")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// Preview for EmployeeView
struct EmployeeView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeView()
    }
}

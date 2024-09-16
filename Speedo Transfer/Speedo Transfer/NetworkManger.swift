//
// Speedo Transfer
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    // MARK: - Registration
    func registerUser(user: User, country: String, dob: String, completion: @escaping (Result<Void, Error>) -> Void) {
        
        let baseURL = "http://13.60.187.217:8080/api/v1/auth/register"
        
        guard let url = URL(string: baseURL) else {
            completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let inputDateFormatter = DateFormatter()
            inputDateFormatter.dateFormat = "dd/MM/yyyy"
        
        let outputDateFormatter = DateFormatter()
           outputDateFormatter.dateFormat = "yyyy-MM-dd"
        
        // Convert dob string to Date
        guard let dobDate = inputDateFormatter.date(from: dob) else {
                print("Failed to parse date with format dd/MM/yyyy")
                completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid date format. Expected dd/MM/yyyy."])))
                return
            }
        
        let formattedDob = outputDateFormatter.string(from: dobDate)
        
        let userData: [String: Any] = [
            "name": user.name,
            "email": user.email,
            "password": user.password,
            "confirmPassword": user.pass2,
            "dateOfBirth": formattedDob,
            "country": country
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: userData, options: [])
        } catch {
            completion(.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Status Code: \(httpResponse.statusCode)")
                
                if !(200...299).contains(httpResponse.statusCode) {
                    if let data = data, let responseString = String(data: data, encoding: .utf8) {
                        print("Server Response: \(responseString)") // Log the error message from the server
                    }
                    completion(.failure(NSError(domain: "", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: "Server error with status code: \(httpResponse.statusCode)"])))
                    return
                }
            }
            
            // Success: Proceed
            completion(.success(()))
        }
        
        task.resume()
    }

    // MARK: - Login
    func loginUser(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        let loginURL = "http://13.60.187.217:8080/api/v1/auth/login" 
        
        guard let url = URL(string: loginURL) else {
            completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let loginData: [String: Any] = [
            "email": email,
            "password": password
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: loginData, options: [])
        } catch {
            completion(.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Status Code: \(httpResponse.statusCode)")
                
                if !(200...299).contains(httpResponse.statusCode) {
                    if let data = data, let responseString = String(data: data, encoding: .utf8) {
                        print("Server Response: \(responseString)")
                        
                    }
                    completion(.failure(NSError(domain: "", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: "Server error with status code: \(httpResponse.statusCode)"])))
                    return
                }
            }
            
            completion(.success(()))
        }
        
        task.resume()
    }


    
}

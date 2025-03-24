# ShopyWell

ShopyWell is a fully functional e-commerce mobile application developed using Flutter. This project follows clean code practices, state management using Provider, and MVVM architecture. It integrates Firebase for authentication and Firestore for data management, along with Stripe for payment processing.

## Features

### **Authentication & User Management**
- Firebase Authentication (Email/Password, Google Sign-In)
- Logout functionality

### **E-Commerce Features**
- Product listing fetched from Firestore
- Product detail screen with full descriptions
- Add to cart functionality
- Checkout process with Stripe payment gateway integration

### **Technical Implementation**
- **State Management:** Provider
- **Architecture:** MVVM (Model-View-ViewModel)
- **Database:** Firestore
- **Payment Integration:** Stripe
- **UI Design:** Based on Figma design (see link below)
- **Cross-Platform:** Works on both Android & iOS

## Setup & Installation

### **Prerequisites**
- Flutter SDK installed ([Get Flutter](https://flutter.dev/docs/get-started/install))
- Dart installed
- Firebase project setup
- Stripe account & API keys

### **Clone the Repository**
```sh
 git clone https://github.com/AhmmedThanveer/shoppywell.git
 cd shoppywell
```

### **Install Dependencies**
```sh
 flutter pub get
```

### **Firebase Setup**
1. Create a Firebase project at [Firebase Console](https://console.firebase.google.com/)
2. Add an Android and iOS app to the project
3. Download `google-services.json` (Android) & `GoogleService-Info.plist` (iOS) and place them in their respective directories (`android/app/` and `ios/Runner/`)
4. Enable Email/Password and Google authentication in Firebase Authentication settings
5. Set up Firestore with product data

### **Stripe Setup**
1. Create an account at [Stripe](https://stripe.com/)
2. Get the API keys and add them to the project

### **Run the Application**
```sh
 flutter run
```

## Design Reference
Figma Design: [ShopyWell Figma Design](https://www.figma.com/design/H63EWkcBYgItXxpB5542Cy/Flutter-Task---Shopywell---E-Commerce?node-id=0-1&p=f&t=JKgW69uFRzTLJhaw-0)

## Evaluation Criteria
- Completion of core features
- Code quality and structure
- Proper use of state management and architecture
- UI adherence to the Figma design
- Proper usage of Firebase and Stripe SDKs

## Submission Details
- Code is shared via [GitHub Repository](https://github.com/AhmmedThanveer/shoppywell)
- This README file includes setup instructions

## Time Duration
Project completed in **3 days** as per company requirements.

---

### Best of luck! 🚀


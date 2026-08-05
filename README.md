# Travello - Modern Travel UI 

A premium, high-fidelity mobile application UI built with **Flutter**. This project demonstrates professional UI implementation, focusing on pixel-perfect accuracy from Figma designs, smooth transitions, and clean, modular code.

## Repository Link
[https://github.com/Ayaezz1101/task2](https://github.com/Ayaezz1101/task2)

## Key Features
Secure Authentication: Fully integrated with Supabase Auth (Email/Password).

Safety First (OTP): Implemented One-Time Password (OTP) verification for new sign-ups and password recovery.

Dynamic Data Management: Products are no longer hardcoded; they are fetched dynamically from a PostgreSQL database on Supabase.

Smart Search & Filtering: Optimized Server-side queries to filter products and categories directly from the database for better performance.

Efficient State Management: Utilized Provider to manage data flow and ensure selective UI rebuilds, enhancing the app's responsiveness.

Fully Responsive: Built using flutter_screenutil for consistent scaling across all devices.

## Tech Stack
Frontend: Flutter SDK (Dart)

Backend as a Service (BaaS): Supabase

Database: PostgreSQL (Cloud-hosted)

State Management: Provider

Environment: Developed on Windows via WSL/Ubuntu & VS Code.

## Application Screenshots

### Splash & Onboarding
| Splash Screen | Step 1 | Step 2 | Step 3 |
| :---: | :---: | :---: | :---: |
| <img src="assets\screenshots\splash.jpg" width="180"> | <img src="assets\screenshots\onboarding1.jpg" width="180"> | <img src="assets\screenshots\onboarding2.jpg" width="180"> | <img src="assets\screenshots\onboarding3.jpg" width="180"> |


### authentication
| sign in | sign up | verify | reset password |
| :---: | :---: | :---: | :---: |
| <img src="assets\screenshots\signin.jpg" width="180"> | <img src="assets\screenshots\signup.jpg" width="180"> | <img src="assets\screenshots\verify screen.jpg" width="180"> | <img src="assets\screenshots\reset password.jpg" width="180"> |

### home && details
| home | details |
| :---: | :---: |
| <img src="assets\screenshots\home screen.jpg" width="180"> | <img src="assets\screenshots\details screen.jpg" width="180"> | 



## Installation

Follow these steps to run the project locally:

1.  **Clone the repository**:
    ```bash
    git clone [https://github.com/Ayaezz1101/task2.git](https://github.com/Ayaezz1101/task2.git)
    ```
2.  **Navigate to project directory**:
    ```bash
    cd task2
    ```
3.  **Install dependencies**:
    ```bash
    flutter pub get
    ```
4.  **Run the app**:
    ```bash
    flutter run
    ```

## Project Structure
```text
lib/
├── providers/      # Centralized State Management (Product & Auth Providers)
├── models/         # Data models for Supabase integration
├── theme/          # Global AppTheme and color constants
├── services/       # Supabase client & API services
├── widgets/        # Reusable UI components (CustomTextField, OTPBox...)
└── pages/          # Screen implementations (splash , onboarding ,Auth, Home, details)

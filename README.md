# MindWellness 🧠💚

> Flutter mobile app with Flask ML API for depression detection and mental wellness support

**Final Year Project - Lahore Garrison University (2023-2024)**

---

## 📖 About

MindWellness is a mental health application that uses Machine Learning to assess depression levels through the PHQ-9 questionnaire. The app provides personalized wellness activities and AI chatbot support for mental health guidance.

**Key Components:**
- 📱 Flutter mobile app with Firebase authentication
- 🔬 Flask REST API for ML model predictions
- 🧠 scikit-learn ML model (5-class depression classifier)
- 💬 ChatGPT-powered support chatbot
- 🧘 Wellness activities (breathing, yoga, walking)

---

## ✨ Features

- **PHQ-9 Depression Assessment** - Standardized 9-question screening tool
- **ML Prediction** - Classifies depression into 5 levels (Severe to Normal)
- **AI Chatbot** - ChatGPT integration for mental health conversations
- **Wellness Activities** - Guided breathing, yoga, and walking exercises with animations
- **Visual Results** - Color-coded severity indicators with circular progress bars
- **Secure Authentication** - Firebase login/signup

---

## 🛠️ Tech Stack

**Frontend:** Flutter 3.1.5 | Dart | GetX | Firebase | Lottie  
**Backend:** Flask 3.0.0 | Flask-CORS  
**ML:** scikit-learn 1.2.1 | pandas | numpy | joblib  
**Other:** ChatGPT SDK | Google Fonts | HTTP

---

## 📁 Project Structure

```
Mindwellness_flutter_flask/
├── Flask API integration/          # Backend
│   ├── app.py                      # Flask server (3 endpoints)
│   ├── requirements.txt            # Python dependencies
│   ├── model/                      # ML model (1.5 MB joblib file)
│   └── templates/                  # Web interface (optional)
│
└── Flutter app code/               # Mobile app
    ├── lib/                        # Dart source code
    │   ├── screens/                # assessment.dart, result.dart
    │   ├── models/                 # questions.dart
    │   └── *.dart                  # Dashboard, ChatScreen, activity, etc.
    ├── assets/                     # Images and Lottie animations
    └── pubspec.yaml                # Flutter dependencies
```

---

## 🚀 Quick Start

### Prerequisites
- Python 3.11+
- Flutter SDK 3.1.5+
- Android Studio or VS Code
- Firebase account (for authentication)

### Backend Setup (Flask API)

```bash
# 1. Navigate to backend folder
cd "Flask API integration"

# 2. Create & activate virtual environment
python -m venv myenv
myenv\Scripts\activate          # Windows
source myenv/bin/activate       # macOS/Linux

# 3. Install dependencies
pip install -r requirements.txt

# 4. Run Flask server
python app.py
# Server runs on http://0.0.0.0:5000
```

### Frontend Setup (Flutter App)

```bash
# 1. Navigate to Flutter folder
cd "Flutter app code"

# 2. Install dependencies
flutter pub get

# 3. Configure API endpoint in lib/screens/assessment.dart (line 132)
# For Android Emulator: http://10.0.2.2:5000/api/predict
# For Physical Device: http://YOUR_LAPTOP_IP:5000/api/predict

# 4. Add Firebase config files:
# - android/app/google-services.json
# - ios/Runner/GoogleService-Info.plist

# 5. Run app
flutter run
```

---

## 📡 API Endpoints

### POST `/api/predict`
Predicts depression level from PHQ-9 responses.

**Request:**
```json
{
  "answers": [
    "0) Not at all", "1) Several days", "0) Not at all", 
    "0) Not at all", "0) Not at all", "0) Not at all",
    "0) Not at all", "0) Not at all", "0) Not at all",
    "Male", "Morning"
  ],
  "age": "25"
}
```

**Response:**
```json
{
  "success": true,
  "prediction": "4",
  "prediction_label": "Minimal Depression / Happy / Normal"
}
```

**Depression Levels:**
- 0: Severe Depression (Red)
- 1: Moderately Severe (Yellow)
- 2: Moderate (Orange)
- 3: Mild (Blue)
- 4: Normal (Green)

---

## 🧠 ML Model

- **Type:** scikit-learn pipeline with preprocessing
- **Input:** 12 features (9 PHQ-9 scores + age + gender + time period)
- **Output:** 5-class classification (0-4)
- **Format:** Joblib file (~1.5 MB)
- **Location:** `Flask API integration/model/trained_model_with_preprocessing.joblib`

---

## 🐛 Common Issues

### "Connection refused" error
- **Emulator:** Use `http://10.0.2.2:5000/api/predict`
- **Physical device:** Use laptop IP (e.g., `http://192.168.1.100:5000`) and ensure same WiFi

### "ModuleNotFoundError"
```bash
myenv\Scripts\activate
pip install -r requirements.txt
```

### Firebase not working
- Verify `google-services.json` in `android/app/`
- Enable Firebase Auth in Firebase Console

---

## 👥 Team

**Final Year Project - Lahore Garrison University**

| Name | Role |
|------|------|
| **Abida** | Backend Developer (Flask API, ML integration) |
| **Shakila** | Frontend Developer (Flutter Mobile app, UI/UX) |

**Supervisor:**Hafiz Burhan ul Haq**

---

## 📄 License

Academic project © 2024 - Lahore Garrison University

---

**Built with dedication by MindWellness Team**

from flask import Flask, render_template, request, redirect, url_for, jsonify
from flask_cors import CORS
import joblib
import pandas as pd

app = Flask(__name__)
CORS(app)  # Allow Flutter to connect

# Load the trained model and preprocessing steps
loaded_pipeline = joblib.load ('model/trained_model_with_preprocessing.joblib')

# Define categories based on predicted numerical labels
def map_to_category(label):
    if label == 0:
        return "Severe Depression"
    elif label == 1:
        return "Moderately Severe Depression"
    elif label == 2:
        return "Moderate Depression"
    elif label == 3:
        return "Mild Depression"
    elif label == 4:
        return "Minimal  Depression  /   Happy   /    Normal"
    else:
        return "Unknown Label"

@app.route('/')
def home():
    return render_template('fyp_form.html', predictions=None)

@app.route('/predict', methods=['POST'])
def predict():
    try:
        # Get input values from the form
        phq1 = int(request.form['phq1'])
        phq2 = int(request.form['phq2'])
        phq3 = int(request.form['phq3'])
        phq4 = int(request.form['phq4'])
        phq5 = int(request.form['phq5'])
        phq6 = int(request.form['phq6'])
        phq7 = int(request.form['phq7'])
        phq8 = int(request.form['phq8'])
        phq9 = int(request.form['phq9'])
        age = int(request.form['age'])
        sex = request.form['sex']
        period_name = request.form['period_name']

        # Create a DataFrame with the input data
        input_data = pd.DataFrame({
            'phq1': [phq1],
            'phq2': [phq2],
            'phq3': [phq3],
            'phq4': [phq4],
            'phq5': [phq5],
            'phq6': [phq6],
            'phq7': [phq7],
            'phq8': [phq8],
            'phq9': [phq9],
            'age' : [age],
            'sex' : [sex],
            'period.name': [period_name]
        })

        # Make predictions using the loaded model
        predictions = loaded_pipeline.predict(input_data)

        # Map predicted numerical labels to descriptive labels
        prediction_labels = list(map(map_to_category, predictions))

        # Redirect to prediction result page with predictions
        return redirect(url_for('prediction_result', predictions=prediction_labels))

    except Exception as e:
        # Handle any errors and display an error message
        return render_template('fyp_form.html', error=str(e), predictions=None)

@app.route('/prediction_result')
def prediction_result():
    predictions = request.args.get('predictions')
    return render_template('prediction_result.html', predictions=predictions)

@app.route('/api/predict', methods=['POST'])
def api_predict():
    try:
        # Get JSON data from Flutter app
        data = request.get_json()

        # Extract answers array and age
        answers = data.get('answers', [])
        age = data.get('age', '')

        # Parse Flutter answers format
        # Questions 0-8: PHQ questions (extract first character as number)
        phq_values = []
        for i in range(9):
            answer = answers[i]
            # Extract the numeric value (first character before ')')
            numeric_value = int(answer.split(')')[0])
            phq_values.append(numeric_value)

        # Question 9: Gender (Male/Female)
        sex = answers[9]

        # Question 10: Time period (Morning/Evening/Mid Day)
        period_name = answers[10].lower()  # Convert to lowercase

        # Question 11: Age (already extracted)
        age = int(age)

        # Create DataFrame with correct structure
        input_data = pd.DataFrame({
            'phq1': [phq_values[0]],
            'phq2': [phq_values[1]],
            'phq3': [phq_values[2]],
            'phq4': [phq_values[3]],
            'phq5': [phq_values[4]],
            'phq6': [phq_values[5]],
            'phq7': [phq_values[6]],
            'phq8': [phq_values[7]],
            'phq9': [phq_values[8]],
            'age': [age],
            'sex': [sex],
            'period.name': [period_name]
        })

        # Make prediction
        predictions = loaded_pipeline.predict(input_data)
        prediction_label = map_to_category(predictions[0])

        # Return JSON response
        return jsonify({
            'success': True,
            'prediction': str(predictions[0]),
            'prediction_label': prediction_label
        }), 200

    except Exception as e:
        # Return error as JSON
        return jsonify({
            'success': False,
            'error': str(e)
        }), 400

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)

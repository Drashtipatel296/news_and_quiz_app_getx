# News app (api) with getx

1. **Set Up Your Flutter Project:**
   - Ensure you have Flutter installed and set up on your machine.
   - Create a new Flutter project if you haven't already.

2. **Add Dependencies:**
   - Open your `pubspec.yaml` file and add the `get` package as a dependency.
   - Also, include the `http` package for making API calls.

    ```yaml
    dependencies:
      flutter:
        sdk: flutter
      get: ^4.3.8  
      http: ^0.13.3  
    ```

3. **Create a Model:**
   - Define a model class that represents the data structure you expect from the API response. This helps in organizing the data you receive.

4. **Set Up a Controller:**
   - Use GetX to create a controller class. This controller will manage the state of your data and handle the API call logic.
   - In the controller, you will write the logic to make the API call using the `http` package and store the response data in a variable.

5. **Bind the Controller to Your UI:**
   - In your Flutter widget tree, use GetX to bind the controller to your UI. This ensures that when the data changes, the UI updates automatically.

6. **Build the UI:**
   - Design your UI to display the data. Use GetX's reactive state management to update the UI when new data is loaded from the API.

7. **Run Your App:**
   - Finally, run your Flutter app and observe how the data from the API is loaded and displayed in the UI.
  
### ScreenShorts


<p align='center'>
   <img src='https://github.com/user-attachments/assets/6ae7ae11-b9b6-4f33-a79e-67c8476f1394' width=230>
   <img src='https://github.com/user-attachments/assets/bd56dc96-c408-43fa-bea5-fa1f721ed342' width=230>
  <img src='https://github.com/user-attachments/assets/4793da42-eaab-4579-a425-8ed03cc0a177' width=230>
</p>

### video

https://github.com/user-attachments/assets/f4bc12e0-200a-43d5-9e99-62ccb4f2d456


# Quiz App

A Flutter-based Quiz App utilizing GetX for state management. This app allows users to take a 10-question quiz, navigate through questions, and submit their answers. The app displays the user's score as a percentage and rates their performance.

### Screenshots

<img src="https://github.com/user-attachments/assets/229698a7-aee0-4e03-9c9f-d1b4492f4bc8" width=230> 
<img src="https://github.com/user-attachments/assets/c0b86eb2-c596-435e-8617-8f0ea1c6e1a8" width=230> 
<img src="https://github.com/user-attachments/assets/f1b78559-0b6f-48a7-9d86-8d699ced6061" width=230> 

### Video

https://github.com/user-attachments/assets/87d59750-b4a3-46d1-9f6e-be6f362a085b



















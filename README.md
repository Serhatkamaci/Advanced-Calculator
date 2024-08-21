# Flutter Advanced Calculator
We are pleased to share our Advanced Calculator project with you. We have coded this project in four different ways using three different state management packages available in the Flutter framework. The state management packages we used are Riverpod, Bloc, and Get, respectively.

When you first open the Advanced Calculator application, you will be greeted with a simple calculator interface. Using the icon on the AppBar at the top of the application, you can switch to the scientific calculator interface. The most distinguishing feature of this application from other calculators is its graph drawing interface. Users can instantly perform graph drawing operations based on the equations they enter into the TextFormField.

The main features of the project are as follows:
- Responsive Design: Dynamic design that adapts to different device sizes.
- Google Material3 Design: Modern and user-friendly interfaces created using Google's latest design language.
- Dynamic Theme Switching: The app offers the ability to dynamically switch between light and dark themes.

## App Screenshot:
<p align="center">
  <img hspace="20" src="https://github.com/user-attachments/assets/37753bb5-1cac-4192-b2f5-9405392fcc9c">
  <img hspace="20" src="https://github.com/user-attachments/assets/5ce54d78-75d6-4bc2-9d05-b6f223a44826">
  <img hspace="20" src="https://github.com/user-attachments/assets/4b0801de-12ec-468e-9aed-441f93814d43">
<p>
<p align="center">
  <img hspace="20" src="https://github.com/user-attachments/assets/616e7c07-e3b5-495f-8442-0bcdedb32181">
  <img hspace="20" src="https://github.com/user-attachments/assets/277cbc6c-f48c-40cd-8d4b-a1df09d722a0">
  <img hspace="20" src="https://github.com/user-attachments/assets/fa283e8c-fb8d-4489-a332-ceddf9f6ce8b">
<p>

## Branches:

| Version | Riverpod | Get | Bloc | Cubit |
| --|:-------:|:-------:|:-------:|:-------:|
| Branch | [Source](https://github.com/Serhatkamaci/Advanced-Calculator/tree/riverpod)  | [Source](https://github.com/Serhatkamaci/Advanced-Calculator/tree/getx)  | [Source](https://github.com/Serhatkamaci/Advanced-Calculator/tree/bloc)  | [Source](https://github.com/Serhatkamaci/Advanced-Calculator/tree/cubit) |

## External packages used in the project:

| packages | links |
| --| --|
| url_launcher (v6.3.0) | [Link](https://pub.dev/packages/url_launcher) |
| auto_size_text (v3.0.0) | [Link](https://pub.dev/packages/auto_size_text) |
| syncfusion_flutter_charts (v26.2.8) | [Link](https://pub.dev/packages/syncfusion_flutter_charts) |
| eval_ex (v1.1.8) | [Link](https://pub.dev/packages/eval_ex) |
| device_preview (v1.2.0) |[Link](https://pub.dev/packages/device_preview)  |
| icons_plus (v5.0.0) | [Link](https://pub.dev/packages/icons_plus) |
| flutter_hooks (v0.20.5) | [Link](https://pub.dev/packages/flutter_hooks) |

## Directory Structure (Riverpod version)
```
📂lib
 │───main.dart
 │───📂core
 │   │──button_styles.dart
 │   │──text_styles.dart
 │   └──theme.dart
 └───📂src
     │────📂business_logic/provider
     │    │   |──garbage_collactor_provider.dart
     │    │   |──general_providers.dart
     │    │   |──process_provider.dart
     │    │   └──result_provider.dart
     │────📂model
     │    │   |──exception.dart
     │    │   |──graph_drawer.dart
     │    │   └──unique_converter.dart
     └────📂view
          └───📂screen
              │   |──calculator_screen.dart
              │   └──graph_screen.dart
              └───📂widget
                   |──calculator_widgets.dart
                   └──graph_widgets.dart
```
## Directory Structure (Bloc version)
```
📂lib
 │───main.dart
 │───📂core
 │   │──button_styles.dart
 │   │──text_styles.dart
 │   └──theme.dart
 └───📂src
     │────📂business_logic
     │    └───📂bloc
     │        |──garbage_bloc.dart
     │        |──process_bloc.dart
     │        └──result_bloc.dart
     └────📂model
     │        |──exception.dart
     │        |──graph_drawer.dart
     │        └──unique_converter.dart
     └────📂view
          └───📂screen
              │   |──calculator_screen.dart
              │   └──graph_screen.dart
              └───📂widget
                   |──calculator_widgets.dart
                   └──graph_widgets.dart
```
## Directory Structure (Cubit version)
```
📂lib
 │───main.dart
 │───📂core
 │   │──button_styles.dart
 │   │──text_styles.dart
 │   └──theme.dart
 └───📂src
     │────📂business_logic
     │    │───📂cubits
     │    │   |──garbage_collactor_cubit.dart
     │    │   |──process_cubit.dart
     │    │   └──result_cubit.dart
     └────📂model
     │    │   |──exception.dart
     │    │   |──graph_drawer.dart
     │    │   └──unique_converter.dart
     └────📂view
          └───📂screen
              │   |──calculator_screen.dart
              │   └──graph_screen.dart
              └───📂widget
                   |──calculator_widgets.dart
                   └──graph_widgets.dart
```

## Directory Structure (GetX version)
```
📂lib
   │───main.dart
   │───📂core
   |   │──button_styles.dart
   |   │──text_styles.dart
   |   └──theme.dart
   └───📂src
       │────📂controller
       │     │──garbage_controller.dart
       |     │──general_variable.dart
       |     │──process_controller.dart
       |     └──result_controller.dart
       │────📂model
       │     │──exception.dart
       |     │──graph_drawer.dart
       |     └──unique_converter.dart
       └────📂view
             │───📂screen
             |   |──calculator_screen.dart
             |   └──graph_screen.dart
             └───📂widget
                 |──calculator_widgets.dart
                 └──graph_widgets.dart 
```

## Created & Maintained By
[Serhat Kamacı](https://github.com/Serhatkamaci)

[Muhammed Furkan Akyol](https://github.com/furkanakyol1050)

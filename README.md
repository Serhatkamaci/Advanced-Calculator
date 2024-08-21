# Flutter Advanced Calculator
We are pleased to share our Advanced Calculator project with you. We have coded this project in four different ways using three different state management packages available in the Flutter framework. The state management packages we used are Riverpod, Bloc, and Get, respectively.

When you first open the Advanced Calculator application, you will be greeted with a simple calculator interface. Using the icon on the AppBar at the top of the application, you can switch to the scientific calculator interface. The most distinguishing feature of this application from other calculators is its graph drawing interface. Users can instantly perform graph drawing operations based on the equations they enter into the TextFormField.

The main features of the project are as follows:
- Responsive Design: Dynamic design that adapts to different device sizes.
- Google Material3 Design: Modern and user-friendly interfaces created using Google's latest design language.
- Dynamic Theme Switching: The app offers the ability to dynamically switch between light and dark themes.

## App Screenshot:
<p align="center">
  <img hspace="20" src="https://github.com/user-attachments/assets/9039d1ce-c1a2-4844-98af-3c3fab3f2ce2">
  <img hspace="20" src="https://github.com/user-attachments/assets/e4183156-a18c-473a-985f-8c3dbcd09e43">
  <img hspace="20" src="https://github.com/user-attachments/assets/1d4d65c9-d8cf-454a-85da-1bb977bed10a">
<p>
<p align="center">
  <img hspace="20" src="https://github.com/user-attachments/assets/843fa466-cced-41cf-b5c5-952f12e1a38a">
  <img hspace="20" src="https://github.com/user-attachments/assets/ed51a91d-6773-44d3-bddf-9adba4970800">
  <img hspace="20" src="https://github.com/user-attachments/assets/89f44113-65cb-4032-a88d-07c7d7732b7e">
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

# flutter_ffi_grpc

A Flutter project to test 2 backends: ffi and gRpc


# Installer Flutter 

    Sous Windows:
    https://docs.flutter.dev/get-started/install/windows/desktop

    Sous Linux:
    https://docs.flutter.dev/get-started/install/linux/desktop


    Ajouter le chemin d'installation dans le PATH.


# Ouverture du projet dans vscode (ou autre...)

    # Dans un Terminal
    cd D:\dev\cpp\flutter_ffi_grpc

    # On vérifie que Flutter est bien installé
    flutter doctor

    PS C:\Dev\cpp\flutter_ffi_grpc> flutter doctor
    Doctor summary (to see all details, run flutter doctor -v):
    [√] Flutter (Channel stable, 3.35.1, on Microsoft Windows [version 10.0.22631.5768], locale fr-FR)
    [√] Windows Version (11 Enterprise 64-bit, 23H2, 2009)
    [X] Android toolchain - develop for Android devices
        X Unable to locate Android SDK.
        Install Android Studio from: https://developer.android.com/studio/index.html
        On first launch it will assist you in installing the Android SDK components.
        (or visit https://flutter.dev/to/windows-android-setup for detailed instructions).
        If the Android SDK has been installed to a custom location, please use
        `flutter config --android-sdk` to update to that location.

    [√] Chrome - develop for the web
    [√] Visual Studio - develop Windows apps (Visual Studio Community 2022 17.13.4)
    [!] Android Studio (not installed)
    [√] VS Code, 64-bit edition (version 1.103.2)
    [√] Connected device (3 available)
    [√] Network resources

    => Good.

    # Mise à jour des paquets
    flutter pub get
    
    # Generation des proto pour gRpc
    protoc.exe  -I C:\Dev\cpp\grpc_persons_server\proto  --plugin=protoc-gen-dart="$env:USERPROFILE\AppData\Local\Pub\Cache\bin\protoc-gen-dart.bat"   --dart_out=grpc:lib/src/generated   C:\Dev\cpp\grpc_persons_server\proto\persons.proto

    # Build en debug => menu vscode 
    # ou bien:

    flutter build [windows|linux] --release
    flutter build [windows|linux] --debug

    # Compilation du backend ffi
    cd native
    cmake -B build -DCMAKE_BUILD_TYPE=Debug
    cmake --build build --config Debug
    cp native\Debug\persons.dll .\build\windows\x64\runner\Debug

    # Execution...
    
    # Clean du projet
    flutter clean





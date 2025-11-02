plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    id("com.google.gms.google-services") // only if using Firebase
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.jhf.task_manager"
    compileSdk = 36       // Updated to satisfy plugin requirements
    ndkVersion = "27.0.12077973"

    defaultConfig {
        applicationId = "com.jhf.task_manager"
        minSdk = 24        // Updated to avoid SDK warnings
        targetSdk = 36     // Match compileSdk
        versionCode = 1
        versionName = "1.0.0"
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }

    buildTypes {
        debug {
            isMinifyEnabled = false
            isShrinkResources = false
        }
        release {
            signingConfig = signingConfigs.getByName("debug")
            isMinifyEnabled = false
            isShrinkResources = false
        }
    }
}

flutter {
    source = "../.."
}


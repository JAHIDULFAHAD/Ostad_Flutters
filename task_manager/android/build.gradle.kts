import org.gradle.api.tasks.Delete
import org.gradle.api.file.Directory

// Repositories for all projects
allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Shared build directory configuration
val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.set(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    layout.buildDirectory.set(newSubprojectBuildDir)
}

// Ensure app project evaluates first
subprojects {
    evaluationDependsOn(":app")
}

// Clean task
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}

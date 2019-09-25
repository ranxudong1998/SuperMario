# allows to add DEPLOYMENTFOLDERS and links to the Felgo library and QtCreator auto-completion
CONFIG += felgo
QT += quick
CONFIG += c++11

# uncomment this line to add the Live Client Module and use live reloading with your custom C++ code
# for the remaining steps to build a custom Live Code Reload app see here: https://felgo.com/custom-code-reload-app/
# CONFIG += felgo-live

# Project identifier and version
# More information: https://felgo.com/doc/felgo-publishing/#project-configuration
PRODUCT_IDENTIFIER = com.yourcompany.wizardEVP.SuperStart
PRODUCT_VERSION_NAME = 1.0.0
PRODUCT_VERSION_CODE = 1

# Optionally set a license key that is used instead of the license key from
# main.qml file (App::licenseKey for your app or GameWindow::licenseKey for your game)
# Only used for local builds and Felgo Cloud Builds (https://felgo.com/cloud-builds)
# Not used if using Felgo Live
PRODUCT_LICENSE_KEY = ""

qmlFolder.source = qml
DEPLOYMENTFOLDERS += qmlFolder # comment for publishing

assetsFolder.source = assets
DEPLOYMENTFOLDERS += assetsFolder

# Add more folders to ship with the application here

RESOURCES += \ #    resources.qrc # uncomment for publishing
    resources.qrc

# NOTE: for PUBLISHING, perform the following steps:
# 1. comment the DEPLOYMENTFOLDERS += qmlFolder line above, to avoid shipping your qml files with the application (instead they get compiled to the app binary)
# 2. uncomment the resources.qrc file inclusion and add any qml subfolders to the .qrc file; this compiles your qml files and js files to the app binary and protects your source code
# 3. change the setMainQmlFile() call in main.cpp to the one starting with "qrc:/" - this loads the qml files from the resources
# for more details see the "Deployment Guides" in the Felgo Documentation

# during development, use the qmlFolder deployment because you then get shorter compilation times (the qml files do not need to be compiled to the binary but are just copied)
# also, for quickest deployment on Desktop disable the "Shadow Build" option in Projects/Builds - you can then select "Run Without Deployment" from the Build menu in Qt Creator if you only changed QML files; this speeds up application start, because your app is not copied & re-compiled but just re-interpreted


# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    rankui.cpp


android {
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
    OTHER_FILES += android/AndroidManifest.xml       android/build.gradle
}

ios {
    QMAKE_INFO_PLIST = ios/Project-Info.plist
    OTHER_FILES += $$QMAKE_INFO_PLIST
}

# set application icons for win and macx
win32 {
    RC_FILE += win/app_icon.rc
}
macx {
    ICON = macx/app_icon.icns
}

DISTFILES += \
    qml/Main.qml \
    qml/scene/GameScene.qml \
    qml/scene/LevelScene.qml \
    qml/scene/MenuScene.qml \
    qml/scene/OptionScene.qml \
    qml/scene/RankScene.qml \
    qml/scene/SceneBase.qml \
    qml/scene/OurGameButtons.qml \
    qml/entities/Bat.qml \
    qml/entities/Bear.qml \
    qml/entities/Bullet.qml \
    qml/entities/Coin.qml \
    qml/entities/Diamond.qml \
    qml/entities/Enemy.qml \
    qml/entities/Golden.qml \
    qml/entities/Ground.qml \
    qml/entities/Home.qml \
    qml/entities/Magic.qml \
    qml/entities/Mushroom.qml \
    qml/entities/Platform_litter.qml \
    qml/entities/Platform.qml \
    qml/entities/Player.qml \
    qml/entities/Scorpion.qml \
    qml/entities/Snail.qml \
    qml/entities/Spikerock.qml \
    qml/entities/TiledEntityBase.qml \
    qml/entities/Trampoline.qml \
    qml/entities/Wall.qml \
    qml/entities/Water.qml \
    qml/entities/WaterNew.qml \
    qml/entities/Wheel.qml \
    qml/gameElements/SceneShow.qml \
    qml/gameElements/PhoneViewRL.qml \
    qml/gameElements/PhoneView.qml \
    qml/common/Suspend.qml \
    qml/common/FinalSuccess.qml \
    qml/common/Failed.qml \
    qml/common/MediaSound.qml \
    qml/common/PlatformerImageButton.qml \
    qml/levels/TestLevel.qml \
    qml/levels/Level1.qml \
    qml/levels/Level2.qml \
    qml/levels/Level3.qml \
    qml/levels/Level4.qml \
    qml/common/RecordDialog.qml

HEADERS += \
    rankui.h

cmake_minimum_required(VERSION 3.16)

project(IntroToQML_1_BusinessCard VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(1_BusinessCard
    main.cpp
)

qt_add_qml_module(1_BusinessCard
    URI IntroToQML
    VERSION 1.0
    QML_FILES
        Main.qml
        QtWebLinkLogo.qml
        CustomBorderedImage.qml
        CustomLabel.qml
        CustomLabelWithIcon.qml
    RESOURCES
        IMG_Neil_BusinessCard.jpg
        qt-logo.png
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(1_BusinessCard PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.1_BusinessCard
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(1_BusinessCard
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS 1_BusinessCard
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

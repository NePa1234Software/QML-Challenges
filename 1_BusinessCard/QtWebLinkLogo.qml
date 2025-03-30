import QtQuick

Image {
    id: control

    required property url webSiteUrl

    height: detailsSwitch.height
    fillMode: Image.PreserveAspectFit
    source: Qt.resolvedUrl("qt-logo.png")

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: Qt.openUrlExternally(control.webSiteUrl)
    }
}

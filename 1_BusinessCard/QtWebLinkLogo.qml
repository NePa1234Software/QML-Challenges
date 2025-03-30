import QtQuick

Image {
    id: control

    required property url webSiteUrl

    anchors {
        bottom: parent.bottom
        right: parent.right
        bottomMargin: 24
        rightMargin: 24
    }
    height: detailsSwitch.height
    fillMode: Image.PreserveAspectFit
    source: Qt.resolvedUrl("qt-logo.png")

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: Qt.openUrlExternally(control.webSiteUrl)
    }
}

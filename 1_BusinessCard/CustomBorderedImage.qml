import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects

// Create a photo background with a rounded corner border.
Item {
    id: control

    property alias image: image.source
    property alias borderColor: roundedBorder.border.color

    implicitWidth: image.implicitWidth + 2 * 4
    implicitHeight: image.implicitHeight + 2 * 4

    Rectangle {
        id: roundedBorder
        anchors.fill: parent
        color: "transparent"
        border.color: "green"
        border.width: 2
        radius: 14
    }

    Image {
        id: image
        anchors.fill: parent
        anchors.margins: 6
        source: control.image
        fillMode: Image.PreserveAspectCrop
        verticalAlignment: Image.AlignTop
        visible: false
        clip: true
    }

    Rectangle {
        id: mask
        anchors.fill: parent
        anchors.margins: 6
        layer.enabled: true
        color: "black"
        radius: 12
        visible: false
        border.width: 0
    }

    MultiEffect {
        anchors.fill: mask
        source: image
        maskEnabled: true
        maskSource: mask
    }
}

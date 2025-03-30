import QtQuick
import QtQuick.Controls

// See here for more icon names
// https://github.com/NePa1234Software/builtInIconsQML
Item {
    id: control

    property alias text: label.text
    property alias iconName: label.icon.name
    property alias pixelSize: label.font.pixelSize
    property color color: "white"

    implicitHeight: label.implicitHeight
    implicitWidth: label.implicitWidth

    IconLabel {
        id: label
        icon.color: control.color
        icon.height: control.pixelSize
        icon.width: control.pixelSize
        color: control.color
        spacing: 4
    }
}

import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Window {
    id: root

    /* Your menu ordering application should contain the following:

        - A variety of Controls from the Qt Quick Controls module
          such as Page, Pane, Button, Slider, RadioButton or Dials.
        - An ApplicationWindow that has a suitably appetising background
        - A cuisine-themed font to use across your whole design.
        - A restaurant name that you can put in the ApplicationWindow header.
        - Customise the ApplicationWindow palette to adjust your Controls' colors
        - Organise your menu into visual Pages with titles for Starters, Mains and Desserts,
          listing some menu items, showing a price and a quantity selection.
        - The total cost of the selected items should be shown in the ApplicationWindow footer
        - Consider how your design could be made from re-usable components as QML Files
        - Add a Button for "submitting" the order and show a visual status that the order
          is busy being processed, and then completed. A Timer can be used to simulate this.
        - If using anchors to arrange your design becomes complex, try using
          RowLayout and ColumnLayout from the Qt Quick Layouts module.
    */

    width: 600
    height: 800
    visible: true
    title: qsTr("Home Restaurant") + (" (w:%1/h:%2, x:%3/y:%4)"
                                      .arg(root.width).arg(root.height)
                                      .arg(root.x).arg(root.y))

    //color: "black"

    // colors that are not customized here come from SystemPalette
    palette.active.window: "peachpuff"
    palette.inactive.window: Qt.color("peachpuff").darker(1.5)
    palette.windowText: "brown"

    component TitleLabel: Label {
        font.family: "Vivaldi"
        font.pointSize: 14
    }
    component MenuPane: Pane {
        padding: 2  // default is 12 (undocumented !?)
        Rectangle {
            anchors.fill: parent
            border.width: 2
            border.color: "black"
            color: "transparent"
        }
    }

    Page
    {
        anchors.fill: root.contentItem
        header: RowLayout
        {
            id: header
            height: headerLabel.contentHeight + 20
            TitleLabel {
                id: headerLabel
                text: qsTr("English Breakfast")
                Layout.alignment: Qt.AlignHCenter
            }
        }
        Rectangle {
            anchors.fill: parent
            border.color: "black"
            border.width: 2
            color: "transparent"
            //implicitWidth: menuContainer.implicitWidth
            //implicitHeight: menuContainer.implicitHeight

            RowLayout
            {
                id: menuContainer
                anchors.fill: parent
                anchors.margins:2
                spacing: 0
                MenuPane
                {
                    id: leftMenu
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    TitleLabel {
                        text: parent.width
                    }
                }
                MenuPane
                {
                    id: rightMenu
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            }
        }

        footer: RowLayout
        {
            id: footer
            height: footerLabel.contentHeight + 20
            TitleLabel {
                id: footerLabel
                text: qsTr("Total cost: ")
                Layout.alignment: Qt.AlignHCenter
            }
        }
    }

    Component.onCompleted: {
        root.x = (Screen.desktopAvailableWidth - root.width) - 20
        root.y = 50
        root.height = Screen.desktopAvailableHeight - 100

    }
}

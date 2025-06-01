//pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import QtQml.Models

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
        font.pointSize: 20
        font.bold: true
    }
    component TopicLabel: Label {
        font.family: "Vivaldi"
        font.pointSize: 18
        font.bold: true
        font.underline: true
    }
    component ItemLabel: Label {
        font.family: "Vivaldi"
        font.pointSize: 16
    }
    component MenuPane: Pane {
        padding: 0  // default is 12 (undocumented !?)
        Rectangle {
            anchors.fill: parent
            border.width: 1
            border.color: "black"
            color: "transparent"
        }
    }
    component ShopItem: Row {
        id: shopItem
        property double price
        property string name
        ItemLabel { text: "%1 %2 €".arg(shopItem.name).arg(shopItem.price, ) }
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
            border.width: 1
            color: "transparent"
            //implicitWidth: menuContainer.implicitWidth
            //implicitHeight: menuContainer.implicitHeight

            RowLayout
            {
                id: menuContainer
                anchors.fill: parent
                //anchors.margins:1
                spacing: 0
                MenuPane
                {
                    id: leftMenu
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    ListModel {
                        id: shopItemList
                        ListElement { iname: qsTr("Toast"); iprice: 0.50 }
                        ListElement { iname: qsTr("Sausages"); iprice: 1.00 }
                        ListElement { iname: qsTr("Bacon"); iprice: 0.50 }
                        ListElement { iname: qsTr("Mushrooms"); iprice: 0.75 }
                        ListElement { iname: qsTr("Baked beans"); iprice: 1.00 }
                        ListElement { iname: qsTr("Tomato"); iprice: 0.60 }
                    }

                    Column {

                        TopicLabel { text: qsTr("Meal") }

                        Repeater {
                            id: repeaterId
                            model: shopItemList
                            delegate: ShopItem {
                                name: iname
                                price: iprice
                            }
                        }
                    }
                }
                MenuPane
                {
                    id: rightMenu
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    ListModel {
                        id: shopItemDrinksList
                        ListElement { iname: qsTr("Coffee"); iprice: 1.00 }
                        ListElement { iname: qsTr("Tea"); iprice: 1.00 }
                        ListElement { iname: qsTr("Orange juice"); iprice: 1.50 }
                        ListElement { iname: qsTr("Apple juice"); iprice: 1.50 }
                    }

                    Column {

                        TopicLabel { text: qsTr("Drinks") }

                        Repeater {
                            id: repeaterDrinksId
                            model: shopItemDrinksList
                            delegate: ShopItem {
                                name: iname
                                price: iprice
                            }
                        }
                    }
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

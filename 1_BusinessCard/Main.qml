import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects

Window {
    id: root

    property alias details: detailsSwitch.checked

    width: root.height * 1.586
    height: 320

    visible: true
    title: qsTr("Neils Business Card")

    component ContactInfo: QtObject {

        // This is a ContactInfo object which provides the properties to fill in.
        // You can create as many instances of this as you like with different property values.

        // show these properties all the time:
        property string name
        property url photo

        // Basic Info properties:
        property string occupation
        property string company

        // Detailed Info properties:
        property string address
        property string country
        property string phone
        property string email
        property url webSite
    }

    ContactInfo {
        id: myContactInfo

        // this is one example instance of a ContactInfo inline Component
        // showing how the properties are populated.

        name: "Neil Parker"
        photo: Qt.resolvedUrl("IMG_Neil_BusinessCard.jpg")
        occupation: "C++ and Qt Fanatic"
        company: "NepaSoft GmbH"
        address: "Hamburg"
        country: "Germany"
        phone: "+49 40 123456789"
        email: "neil@hamburg.de"
        webSite: Qt.url("https://www.qt.io")
    }

    /* Your solution should contain these key features:

        - A Text element for each of the ContactInfo properties.
        - The name and photo image should be shown all the time.
        - These should be grouped into two categories "Basic Info" and "Details".
        - Create a button using a MouseArea or TapHandler that can be used to
          toggle between showing the two categories of information.
        - Use a larger font size for the name
    */

    CustomBorderedImage {
        id: backgroundImage
        anchors.fill: parent
        anchors.margins: 8
        image: myContactInfo.photo
    }

    ColumnLayout {

        anchors {
            fill: parent
            topMargin: 16
            bottomMargin: 24
            leftMargin: 24
            rightMargin: 20
        }

        CustomLabel
        {
            text: myContactInfo.name
            font.pixelSize: 32
            font.bold: true
        }
        CustomLabel
        {
            text: myContactInfo.occupation
            font.pixelSize: 24
            font.bold: true
        }
        CustomLabel
        {
            text: myContactInfo.company
            font.pixelSize: 24
            font.bold: true
        }
        CustomLabel
        {
            text: myContactInfo.address
            font.pixelSize: 20
            Behavior on opacity { NumberAnimation { duration: 500 } }
            opacity: root.details ? 1.0 : 0.0
        }
        CustomLabel
        {
            text: myContactInfo.country
            font.pixelSize: 20
            Behavior on opacity { NumberAnimation { duration: 500 } }
            opacity: root.details ? 1.0 : 0.0
        }
        CustomLabelWithIcon
        {
            text: myContactInfo.email
            iconName: "mail-send"
            pixelSize: 16
            Behavior on opacity { NumberAnimation { duration: 1000 } }
            opacity: root.details ? 1.0 : 0.0
        }
        CustomLabelWithIcon
        {
            text: myContactInfo.phone
            iconName: "phone"
            pixelSize: 16
            //visible: root.details
            Behavior on opacity { NumberAnimation { duration: 1500 } }
            opacity: root.details ? 1.0 : 0.0
        }

        Item { Layout.fillHeight: true }

        Button {
            id: detailsSwitch
            text: "Details"
            checkable: true
        }
    }

    QtWebLinkLogo {
        id: webSiteButton

        anchors {
            bottom: parent.bottom
            right: parent.right
            bottomMargin: 24
            rightMargin: 24
        }
        height: detailsSwitch.height
        webSiteUrl: myContactInfo.webSite
    }
}

import QtQuick 2.0

Rectangle {
    id: dayItem
    property int index: 0;
    width: (calendarMain.width-8)/7
    height: calendarMain.height / 8
    x: (calendar_context.calendar_ctrl.calendartype >= 3)?(7-calendar_context.calendar_ctrl.daysofcurrentmonth[index].getDayOfCustomWeek()) * (dayOfCalendar.width + 1):
                                          (calendar_context.calendar_ctrl.daysofcurrentmonth[index].getDayOfCustomWeek()-1) * (dayOfCalendar.width + 1)
    y: (calendar_context.calendar_ctrl.daysofcurrentmonth[index].getDayInCustomWeekNOfMonth()-1) * (dayOfCalendar.height+1)
    border.width: 3
    radius: 10
    color: "#555555"
    opacity: ((calendar_context.calendar_ctrl.daysofcurrentmonth[index].isDayOver())?0.7:1)
    border.color: ((calendar_context.calendar_ctrl.daysofcurrentmonth[index].isToday())?"#00ff00":
                                           ((calendar_context.calendar_ctrl.daysofcurrentmonth[index] == calendar_context.calendar_ctrl.getCurrentSelectedDay())?"#6666ff":"#000000"))
            Text {
                id: georgianTxt
                color: (calendar_context.calendar_ctrl.daysofcurrentmonth[index].is_holiday === true)?"#ff6666":"#ffffff";
                horizontalAlignment: Text.Center
                verticalAlignment:  Text.Center
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                font.family: englishFont.name
                anchors.margins: 10
                font.pixelSize: 18
                text: qsTr(calendar_context.calendar_ctrl.daysofcurrentmonth[index].getGeorgianDay().toString())
            }
            Text {
                id: jalaliTxt
                color: (calendar_context.calendar_ctrl.daysofcurrentmonth[index].is_holiday === true)?"#ff6666":"#ffffff";
                horizontalAlignment: Text.Center
                verticalAlignment:  Text.Center
                anchors.centerIn: parent.Center
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.family: persianFont.name
                font.pixelSize: 18
                text: qsTr(calendar_context.calendar_ctrl.daysofcurrentmonth[index].getDayOfCustomMonth().toString())
            }
            Text {
                id: islamicTxt
                color: (calendar_context.calendar_ctrl.daysofcurrentmonth[index].is_holiday === true)?"#ff6666":"#ffffff";
                horizontalAlignment: Text.Center
                verticalAlignment:  Text.Center
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                font.family: persianFont.name
                anchors.margins: 10
                font.pixelSize: 13
                text: qsTr(calendar_context.calendar_ctrl.daysofcurrentmonth[index].getIslamicDay().toString())
            }
    MouseArea
    {
        anchors.fill: parent
        onClicked:
        {
            calendar_context.calendar_ctrl.selectDayByClick(calendar_context.calendar_ctrl.daysofcurrentmonth[index]);
        }
    }
}

import os
import sys
from datetime import datetime
from dateutil.relativedelta import relativedelta

from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QTableWidgetItem
from PyQt5.QtGui import QPainter, QColor, QFont
from PyQt5.QtCore import QRect, QDate ,Qt , QPoint

import hospital_gui
from DB_Management import DatabaseUtilities as DU

DB = DU()


class ApplicationWindow(hospital_gui.Ui_MainWindow):
    def __init__(self, mainWindow):
        super(ApplicationWindow, self).setupUi(mainWindow)
        dates_list =self.highlight_dates()
        class Scheduler(QtWidgets.QCalendarWidget):

            def __init__(self, parent=None  ):
                    super().__init__(parent)
                    self.events = dates_list

            def paintCell(self, painter, rect, date):
                    super().paintCell(painter, rect, date)
                    if date in self.events:
                            painter.setBrush(Qt.green)
                            painter.drawEllipse(rect.topLeft() + QPoint(12, 7), 6, 6)
        # copy the initiallization lines of the calendar from the gui file and paste them here 
        self.calendarWidget = Scheduler(self.tab_2)
        sizePolicy = QtWidgets.QSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Expanding)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.calendarWidget.sizePolicy().hasHeightForWidth())
        self.calendarWidget.setSizePolicy(sizePolicy)
        self.calendarWidget.setMinimumSize(QtCore.QSize(750, 300))
        self.calendarWidget.setGridVisible(True)
        self.calendarWidget.setObjectName("calendarWidget")
        self.gridLayout_8.addWidget(self.calendarWidget, 0, 0, 1, 1, QtCore.Qt.AlignHCenter)
        #################################################################
        self.calendarWidget.selectedDate
        self.todo_dateEdit.dateChanged.connect(
            lambda: self.ppms_today(self.todo_dateEdit.date(
            ).toPyDate()))
        # print(self.lineEdit_6.text())
        self.CurrDate = datetime.now()
        self.CurrTime = datetime.now().strftime("%H:%M")
        self.CurrYear = str(self.CurrDate)[:4]
        self.CurrMonth = str(self.CurrDate)[5:7]
        self.CurrDay = str(self.CurrDate)[8:10]
        """ print(
            str(self.CurrDate)[:9], self.CurrYear,
            self.CurrMonth, self.CurrDay) """
        self.todo_dateEdit.setDate(
            QDate(int(self.CurrYear), int(self.CurrMonth),
                  int(self.CurrDay)))
        self.calendarWidget.setSelectedDate(
            QDate(int(self.CurrYear), int(self.CurrMonth),
                  int(self.CurrDay)))
        self.installation_dateEdit.setDate(
            QDate(int(self.CurrYear), int(self.CurrMonth),
                  int(self.CurrDay)))
        # self.highlight_date()
        # self.next_PPMs()
        self.dockWidget_AddDeviceWindow.close()
        self.dockWidget_CreateFormWindow.close()
        self.dockWidget_AboutWindow.close()

        self.InitVariables()
        self.InitCheckBoxes()
        self.InitActions()
        self.UpdateDevCombo()
        self.UpdateTables()
        self.InitComboBoxes()
        self.InitButtons()
        self.ppms_today(self.todo_dateEdit.date().toPyDate())

    def InitVariables(self):
        self.question1 = [
            self.q1, self.q2, self.q3, self.q4, self.q5,
            self.q6, self.q7, self.q8, self.q9, self.q10
        ]
        self.question2 = [
            self.q11, self.q12, self.q13, self.q14, self.q15,
            self.q16, self.q17, self.q18, self.q19, self.q20
        ]
        self.questions = [self.question1, self.question2]
        self.tabs = [
            self.followUp_tabWidget,
            self.information_tabWidget
        ]
        ############################################ adding device , Form #############################################
        self.newDevice = [
            str(self.lineEdit.text()),
            self.lineEdit_2.text(),
            self.lineEdit_3.text(),
            self.lineEdit_4.text(),
            self.lineEdit_5.text(),
            self.lineEdit_6.text(),
            str(self.installation_dateEdit.date().toPyDate()
                ),
            self.lineEdit_8.text(),
            self.lineEdit_9.text(),
            self.lineEdit_10.text(),
            self.lineEdit_11.text(),
            self.lineEdit_12.currentIndex()+1
        ]
        self.newForm = [
            self.createForm_ans1.text(),
            self.createForm_ans2.currentText(),
            self.createForm_ans3.text(),
            self.createForm_ans4.toPlainText()
        ]
        self.Form_comboBoxes = [
            self.Inspection_comboBox, self.ppm_comboBox
        ]
        self.formTypes = ['daily inspection', 'PPM']
        ################################################################################################################
        # print(
        #     str(self.installation_dateEdit.date().toPyDate())
        # )

    def InitCheckBoxes(self):
        self.checks1 = [
            self.checkq1, self.checkq2, self.checkq3,
            self.checkq4, self.checkq5, self.checkq6,
            self.checkq7, self.checkq8, self.checkq9,
            self.checkq10
        ]
        self.checks2 = [
            self.checkq11, self.checkq12, self.checkq13,
            self.checkq14, self.checkq15, self.checkq16,
            self.checkq17, self.checkq18, self.checkq19,
            self.checkq20
        ]
        self.checks = [self.checks1, self.checks2]

        self.CheckAll_checkBox.stateChanged.connect(
            self.CheckAll)
        for i in range(10):
            self.checks[0][i].stateChanged.connect(
                self.FormIsFilling)

    def InitActions(self):
        # Ordered by the actual toolbar order
        self.actionFollow_Up.triggered.connect(
            lambda: self.toolBox.setCurrentIndex(0))
        self.actionHome.triggered.connect(
            lambda: self.NavTo(0, 0))
        self.actionTo_Do.triggered.connect(
            lambda: self.NavTo(0, 1))
        self.actionDaily_Inspection.triggered.connect(
            lambda: self.NavTo(0, 2))
        self.actionPPM.triggered.connect(
            lambda: self.NavTo(0, 3))
        self.actionInformation.triggered.connect(
            lambda: self.toolBox.setCurrentIndex(1))
        self.actionTools.triggered.connect(
            lambda: self.toolBox.setCurrentIndex(2))
        self.actionAdd_Device.triggered.connect(
            self.dockWidget_AddDeviceWindow.show)
        self.actionCreate_Form.triggered.connect(
            self.dockWidget_CreateFormWindow.show)
        self.actionManage_Tasks.triggered.connect(
            lambda: self.NavTo(0, 1))
        self.actionCMMS.triggered.connect(
            self.dockWidget_AboutWindow.show)

    def InitComboBoxes(self):
        # gives an error when we choose all departmenst after changing the department from the combo
        # because there is no department with id ==0
        self.DepartmentSelection_combo.currentIndexChanged.connect(
            lambda: self.UpdateTable(
                DB.SelectRows_22(
                    'device', 'depid = %s' % self
                    .DepartmentSelection_combo.currentIndex(
                    )), self.Devices_table))
        self.DepartmentSelection_combo_2.currentIndexChanged.connect(
            lambda: self.UpdateTable(
                DB.GetDF(self.DepartmentSelection_combo_2.
                         currentIndex()), self.Forms_table))

        self.Inspection_comboBox.currentIndexChanged.connect(
            lambda: self.UpdateForm(0))
        self.ppm_comboBox.currentIndexChanged.connect(
            lambda: self.UpdateForm(1))

    def InitButtons(self):
        self.Dash_ToDo_Button.clicked.connect(
            lambda: self.NavTo(0, 1))
        self.Dash_Forms_Button.clicked.connect(
            lambda: self.NavTo(1, 2))
        self.Dash_Devices_Button.clicked.connect(
            lambda: self.NavTo(1, 0))
        self.Dash_Dept_Button.clicked.connect(
            lambda: self.NavTo(1, 1))
        self.Dash_Inspection_Button.clicked.connect(
            lambda: self.NavTo(0, 2))

        self.AddDevice_button.clicked.connect(
            self.dockWidget_AddDeviceWindow.show)
        self.CreateForm_button.clicked.connect(
            self.dockWidget_CreateFormWindow.show)
        self.ManageTasks_button.clicked.connect(
            lambda: self.NavTo(0, 1))

        self.SubmitInspectionAnswers_button.clicked.connect(
            lambda: self.submit_inspection())
        self.SubmitPPMAnswers_button.clicked.connect(
            lambda: self.submit_ppm())

        self.pushButton_AddDeviceWindow.clicked.connect(
            lambda: self.insert2DB(1, "device"))
        self.pushButton_CreateFormWindow.clicked.connect(
            lambda: self.insert2DB(2, "form"))

    def UpdateDevCombo(self):
        self.Inspection_comboBox.clear()
        self.ppm_comboBox.clear()
        dailyDevices_names = DB.RunCommand(
            "SELECT DevName, DevId FROM device")
        dailyDevices_names = [
            str(device[0]) + " ,ID:" + str(device[1])
            for device in dailyDevices_names
        ]
        self.Inspection_comboBox.addItems(dailyDevices_names)
        self.ppm_comboBox.addItems(dailyDevices_names)

    def UpdateTables(self):
        self.UpdateTable(DB.GetRows('department'),
                         self.Department_table)
        self.UpdateTable(DB.GetRows('device'),
                         self.Devices_table)
        self.UpdateTable(DB.GetRows('form'),
                         self.Forms_table)
        self.UpdateForm(0)
        self.UpdateForm(1)

    def UpdateTable(self, rows, UItable):
        if str(type(rows)) != "<class 'NoneType'>" and len(
                rows[0]) > 0:
            UItable.setRowCount(len(rows))

            UItable.setColumnCount(len(rows[0]))

            for row_number, row_data in enumerate(rows):
                for column_number, column_data in enumerate(
                        row_data):
                    self.InsertAtIndex(UItable, row_number,
                                       column_number,
                                       str(column_data))
        else:
            UItable.clearContents()

    def UpdateForm(self, i):
        family = DB.SelectRows(
            "device", "DevName='{}'".format(
                str(self.Form_comboBoxes[i].currentText()).
                split(" ,ID:")[0]))
        if len(family) > 0:
            form = DB.SelectRows(
                "form",
                "formfamily='{}' AND formtype= '{}' ".format(
                    str(family[0][8]), self.formTypes[i]))
            if len(form) > 0:
                form = form[0][3].split("?")
                form = [
                    str(question) + str('  ?')
                    for question in form
                ]
                EnableVar = len(form)
                for idx, quest in enumerate(form):
                    if quest != "  ?":
                        self.questions[i][idx -
                                          1].setText(quest)
                    else:
                        EnableVar -= 1
                # generalize these functions ---> enable_form(self,checklist, amount) , clear_Form(self, questionList,checklist,lenlist, amount)
                self.clear_form(i, len(self.checks[i]),
                                10 - EnableVar)
                self.enable_form(i, EnableVar)
            else:
                self.clear_form(i, 10, 10)
                self.questions[i][0].setText(
                    'No Form To Display For This Device')
        else:
            self.clear_form(i, 10, 10)
            self.questions[i][0].setText(
                'No Form To Display For This Device')

    def next_PPMs(
        self, device_ID):  #for a given device untill 2021/4
        cmd = "SELECT DevName , DevID , InstallationDate , PpmPeriod FROM device WHERE DevID='{}'".format(
            device_ID)
        data = DB.RunCommand(cmd)
        # print(data)
        installation_date = data[0][2]
        devID = data[0][1]
        name = data[0][0]
        ppm_period = data[0][3].split()[0]
        # print(ppm_period)
        this_year = datetime.strptime(
            str(installation_date),
            '%Y-%m-%d').replace(year=2019)
        # print(this_year)
        nextPPMs = list()
        while this_year < datetime.strptime(
                "2021-04-15", '%Y-%m-%d'):
            this_year += relativedelta(
                months=+int(ppm_period))
            # print(this_year)
            nextPPMs.append(str(this_year).split()[0])

        # print(nextPPMs)
        return (nextPPMs)

    def ppms_today(self, date):
        """ppms_today [takes date string]

        Args:
            date ([date string]): [selected day to invistigate it's tasks]
        """
        # date = date.date().toPyDate()
        cmd = "SELECT DevName , DevID , DepID  FROM device "  ### returns all devices (name,id,department number)
        data = DB.RunCommand(cmd)

        satisfied_devices = []
        if len(data) > 0:
            for device in data:
                # print(device)
                ID = int(device[1])
                device = list(device)
                device.append("basement")
                """ print(device) """
                if device[2] == 1:
                    device[2] = "Operating Room"
                elif device[2] == 2:
                    device[2] = "Radiology"
                elif device[2] == 3:
                    device[2] = "Intensive Care Unit (ICU)"
                nextPPMs = self.next_PPMs(
                    ID
                )  #### a list of next ppms for this device
                device = tuple(device)

                # print(len(nextPPMs))
                for day in nextPPMs:
                    # print("days+++++++++++++",day,"date+++++++++++++++++",date)
                    # print(type(day), type(str(date)))
                    if day == str(date):
                        # print("****************",True)
                        satisfied_devices.append(
                            device
                        )  #### append the device (name,id ,dep)
            if len(satisfied_devices) > 0:
                self.UpdateTable(satisfied_devices,
                                 self.ToDo_table)
            else:
                self.ToDo_table.clearContents()
        """ print("*********************devices are",
              satisfied_devices) """
        return (satisfied_devices)


    def highlight_dates(self) :
        days_highlighted = []
        for i in range(90) :
            day = "2020-04-1"
            date = datetime.strptime( str(day),'%Y-%m-%d')
            date +=  relativedelta( days=+int(i))
            # print(date[:10])
            size= len(self.ppms_today(str(date).split(" ")[0]))
            # print(size)
            if size>0 :
                date = str(date).split(" ")[0].split("-")
                
                year  = int(date[0]) 
                month = int(date[1])
                day   = int(date[2])
                qt_date = QDate(year,month,day)
                days_highlighted.append(qt_date)
        return(days_highlighted)
            



    def InsertAtIndex(self, table, y, x, Item):
        table.setItem(y, x, QTableWidgetItem(Item))

    def clear_form(self, group, lenlist, amount):
        for i in range(amount):
            self.questions[group][lenlist - i - 1].clear()
            self.checks[group][lenlist - i - 1].hide()
            self.checks[group][lenlist - i -
                               1].setDisabled(True)

    def enable_form(self, group, amount):
        for i in range(amount):
            self.checks[group][i].setDisabled(False)
            self.checks[group][i].show()

    def NavTo(self, toolboxidx, tabidx):
        self.toolBox.setCurrentIndex(toolboxidx)
        self.tabs[toolboxidx].setCurrentIndex(tabidx)

    def CheckAll(self):
        for i in range(10):
            if self.CheckAll_checkBox.isChecked():
                self.checks[0][i].setChecked(True)
                self.FormIsFilling()
            else:
                self.checks[0][i].setChecked(False)
                self.FormIsFilling()

    def FormIsFilling(self):
        self.CheckStates = [
            False, False, False, False, False, False, False,
            False, False, False, False
        ]
        self.CheckStates[
            10] = self.CheckAll_checkBox.isChecked()
        for i in range(10):
            self.CheckStates[i] = self.checks[0][
                i].isChecked()

        if any(self.CheckStates):
            self.Inspection_comboBox.setDisabled(True)
        else:
            self.Inspection_comboBox.setDisabled(False)

    def CollectingForm(self, num):
        Answers = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

        for i in range(10):
            if len(self.questions[num][i].text()
                   ) > 3 and self.checks[num][i].isChecked():
                Answers[i] = 1
        # print(Answers)
        return (Answers)

    def insert2DB(self, typeOfData, table):
        ############################################ adding device , Form #############################################
        self.newDevice = [
            str(self.lineEdit.text()),
            self.lineEdit_2.text(),
            self.lineEdit_3.text(),
            self.lineEdit_4.text(),
            self.lineEdit_5.text(),
            self.lineEdit_6.text(),
            str(self.installation_dateEdit.date().toPyDate()
                ),
            self.lineEdit_8.text(),
            self.lineEdit_9.text(),
            self.lineEdit_10.text(),
            self.lineEdit_11.text(),
            self.lineEdit_12.currentIndex()+1
        ]
        self.newForm = [
            self.createForm_ans1.text(),
            self.createForm_ans2.currentText(),
            self.createForm_ans3.text(),
            self.createForm_ans4.toPlainText()
        ]
        ################################################################################################################
        if typeOfData == 1:
            data = self.newDevice
        else:
            data = self.newForm
        # print("------------list", data)
        # print("--------tuple", tuple(data))

        cmd = " INSERT INTO " + table
        cmd += " VALUES %r;" % (tuple(data), )
        DB.RunInsert(cmd)
        self.UpdateTables()

    def submit_inspection(self):

        device_id = self.Inspection_comboBox.currentText(
        ).split(" ,ID:")[1]
        date = str(
            self.dateEdit_inspection.date().toPyDate())
        notes = self.insp_notes.toPlainText()
        result = self.CollectingForm(0)
        result = [str(num) for num in result]
        result = ''.join(result)
        self.save_inspectionAnswers(device_id, date, notes,
                                    result)

    def save_inspectionAnswers(self, device_id, date, notes,
                               result):  ## send it to DB

        cmd = " INSERT INTO Daily_Inspection ( DevID,InspDate , InspExtraNotes, InspResult )"
        cmd += " VALUES ('{}', '{}', '{}', '{}' );".format(
            device_id,
            date,
            notes,
            result,
        )
        DB.RunInsert(cmd)
        self.UpdateTables()

    def submit_ppm(self):

        device_id = self.ppm_comboBox.currentText().split(
            " ,ID:")[1]
        date = str(self.dateEdit_ppm.date().toPyDate())
        notes = self.ppmNotes_text.toPlainText()
        result = self.CollectingForm(1)
        result = [str(num) for num in result]
        result = ''.join(result)
        cost = self.ppmCost_text.toPlainText()

        self.save_ppm(device_id, date, notes, result, cost)

    def save_ppm(self, device_id, date, notes, result, cost):

        cmd = " INSERT INTO PPM ( DevID, PpmDate , PpmExtraNotes, PpmResult, Cost)"
        cmd += " VALUES ('{}', '{}', '{}', '{}', '{}' );".format(
            device_id,
            date,
            notes,
            result,
            cost,
        )
        DB.RunInsert(cmd)
        self.UpdateTables()

    # def highlight_date(self) :

    #     painter = QPainter()
    #     painter.fillRect(QRect(25, 25, 25, 25), QColor(200, 200, 0) )
    #     self.calendarWidget.paintCell(painter, QRect(25, 25, 25, 25), QDate(2020, 5, 15))
    #


def main():
    app = QtWidgets.QApplication(sys.argv)
    mainWindow = QtWidgets.QMainWindow()
    ApplicationWindow(mainWindow)
    mainWindow.show()
    sys.exit(app.exec_())


if __name__ == "__main__":
    main()

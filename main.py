import os
import sys
from datetime import datetime

from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QTableWidgetItem

import hospital_gui
from DB_Management import DatabaseUtilities as DU

DB = DU()


class ApplicationWindow(hospital_gui.Ui_MainWindow):
    def __init__(self, mainWindow):
        super(ApplicationWindow, self).setupUi(mainWindow)
        ''' Buttons
        self.SubmitAnswers_button.clicked.connect(lambda: self.InsertAtIndex(self.Devices_table, 1, 0, 'Test'))
        self.ManageTasks_button.clicked.connect(lambda: self.InsertAtIndex(self.Devices_table, 1, 0, 'Test'))
        self.Export_button.clicked.connect(lambda: self.InsertAtIndex(self.Devices_table, 1, 0, 'Test'))
        self.Print_button.clicked.connect(lambda: self.InsertAtIndex(self.Devices_table, 1, 0, 'Test'))
        '''
        ''' Tables
        self.ToDo_table
        '''
        ''' LineEdit
        self.Search_lineEdit
        '''
        ''' Combos
        self.Date_comboBox
        '''
        self.Dash_ToDo_Button
        self.Dash_Forms_Button
        self.Dash_Devices_Button
        self.Dash_Dept_Button
        self.Dash_Inspection_Button

        self.CurrDate = datetime.now().strftime("%y-%m-%d")
        self.CurrTime = datetime.now().strftime("%H:%M")

        self.dockWidget_AddDeviceWindow.close()
        self.dockWidget_CreateFormWindow.close()
        self.dockWidget_AboutWindow.close()

        self.question1 = [
            self.q1, self.q2, self.q3, self.q4, self.q5, self.q6, self.q7,
            self.q8, self.q9, self.q10
        ]
        self.question2 = [
            self.q11, self.q12, self.q13, self.q14, self.q15, self.q16,
            self.q17, self.q18, self.q19, self.q20
        ]
        self.tabs = [self.followUp_tabWidget, self.information_tabWidget]
        self.questions = [self.question1, self.question2]
        self.InitCheckBoxes()
        self.InitActions()
        self.UpdateDevCombo()
        self.UpdateTables()
        self.InitComboBoxes()
        self.InitButtons()

    def InitCheckBoxes(self):
        self.checks1 = [
            self.checkq1, self.checkq2, self.checkq3, self.checkq4,
            self.checkq5, self.checkq6, self.checkq7, self.checkq8,
            self.checkq9, self.checkq10
        ]
        self.checks2 = [
            self.checkq11, self.checkq12, self.checkq13, self.checkq14,
            self.checkq15, self.checkq16, self.checkq17, self.checkq18,
            self.checkq19, self.checkq20
        ]
        self.checks = [self.checks1, self.checks2]
        self.CheckAll_checkBox.stateChanged.connect(self.CheckAll)

        for i in range(10):
            self.checks[0][i].stateChanged.connect(self.FormIsFilling)

    def InitActions(self):
        #Ordered by the actual toolbar order
        self.actionFollow_Up.triggered.connect(
            lambda: self.toolBox.setCurrentIndex(0))
        self.actionHome.triggered.connect(lambda: self.NavTo(0, 0))
        self.actionTo_Do.triggered.connect(lambda: self.NavTo(0, 1))
        self.actionDaily_Inspection.triggered.connect(lambda: self.NavTo(0, 2))
        self.actionPPM.triggered.connect(lambda: self.NavTo(0, 3))
        self.actionInformation.triggered.connect(
            lambda: self.toolBox.setCurrentIndex(1))
        self.actionTools.triggered.connect(
            lambda: self.toolBox.setCurrentIndex(2))
        self.actionAdd_Device.triggered.connect(
            self.dockWidget_AddDeviceWindow.show)
        self.actionCreate_Form.triggered.connect(
            self.dockWidget_CreateFormWindow.show)
        self.actionManage_Tasks.triggered.connect(lambda: self.NavTo(0, 1))
        self.actionCMMS.triggered.connect(self.dockWidget_AboutWindow.show)

    def InitComboBoxes(self):
        ## gives an error when we choose all departmenst after changing the department from the combo
        ## because there is no department with id ==0
        self.DepartmentSelection_combo.currentIndexChanged.connect(
            lambda: self.UpdateTable(
                DB.SelectRows(
                    'device', 'depid = %s' % self.DepartmentSelection_combo.
                    currentIndex()), self.Devices_table))
        self.DepartmentSelection_combo_2.currentIndexChanged.connect(
            lambda: self.UpdateTable(
                DB.GetDF(self.DepartmentSelection_combo_2.currentIndex()), self
                .Forms_table))

        self.Inspection_comboBox.currentIndexChanged.connect(self.UpdateForm)
        self.ppm_comboBox.currentIndexChanged.connect(self.update_form2)

    def InitButtons(self):
        self.Dash_ToDo_Button.clicked.connect(lambda: self.NavTo(0, 1))
        self.Dash_Forms_Button.clicked.connect(lambda: self.NavTo(1, 2))
        self.Dash_Devices_Button.clicked.connect(lambda: self.NavTo(1, 0))
        self.Dash_Dept_Button.clicked.connect(lambda: self.NavTo(1, 1))
        self.Dash_Inspection_Button.clicked.connect(lambda: self.NavTo(0, 2))

        self.AddDevice_button.clicked.connect(
            self.dockWidget_AddDeviceWindow.show)
        self.CreateForm_button.clicked.connect(
            self.dockWidget_CreateFormWindow.show)

    def UpdateDevCombo(self):
        self.Inspection_comboBox.clear()
        self.ppm_comboBox.clear()
        dailyDevices_names = DB.RunCommand("SELECT DevName ,DevId FROM device")
        dailyDevices_names = [
            str(device[0]) + " ,ID:" + str(device[1])
            for device in dailyDevices_names
        ]
        self.Inspection_comboBox.addItems(dailyDevices_names)
        self.ppm_comboBox.addItems(dailyDevices_names)

    def UpdateTables(self):
        self.UpdateTable(DB.GetRows('department'), self.Department_table)
        self.UpdateTable(DB.GetRows('device'), self.Devices_table)
        self.UpdateTable(DB.GetRows('form'), self.Forms_table)
        self.UpdateForm()
        self.update_form2()

    def UpdateTable(self, rows, UItable):
        if str(type(rows)) != "<class 'NoneType'>" and len(rows[0]) > 0:
            UItable.setRowCount(len(rows))

            UItable.setColumnCount(len(rows[0]))

            for row_number, row_data in enumerate(rows):
                for column_number, column_data in enumerate(row_data):
                    self.InsertAtIndex(UItable, row_number, column_number,
                                       str(column_data))
        else:
            UItable.clearContents()

    def UpdateForm(self):
        family = DB.SelectRows(
            "device", "DevName='{}'".format(
                str(self.Inspection_comboBox.currentText()).split(" ,ID:")[0]))
        # print(str(self.Inspection_comboBox.currentText()).split(" ,ID:")[0])
        # print(family)
        if len(family) > 0:
            form = DB.SelectRows(
                "form",
                "formfamily='{}' AND formtype= 'daily inspection' ".format(
                    str(family[0][8])))
            print(form)
            if len(form) > 0:
                form = form[0][3].split("?")
                form = [str(question) + str('  ?') for question in form]
                print(form)
                EnableVar = len(form)
                for i, quest in enumerate(form):
                    if quest != "  ?":
                        self.question1[i - 1].setText(quest)
                    else:
                        EnableVar -= 1
                self.clear_form(0, len(self.checks1), 10 - EnableVar)
                self.enable_form(0, EnableVar)  #######
            else:
                self.clear_form(0, 10, 10)
                self.question1[0].setText('No Form To Display For This Device')
        else:
            self.clear_form(0, 10, 10)
            self.question1[0].setText('No Form To Display For This Device')

    def update_form2(self):
        family = DB.SelectRows(
            "device", "DevName='{}'".format(
                str(self.ppm_comboBox.currentText()).split(" ,ID:")[0]))
        if len(family) > 0:
            form = DB.SelectRows(
                "form", "formfamily='{}' AND formtype= 'PPM' ".format(
                    str(family[0][8])))
            if len(form) > 0:
                form = form[0][3].split("?")
                form = [str(question) + str('  ?') for question in form]
                EnableVar = len(form)
                for i, quest in enumerate(form):
                    if quest != "  ?":
                        self.question2[i - 1].setText(quest)
                    else:
                        EnableVar -= 1
                self.clear_form(
                    1, len(self.checks2), 10 - EnableVar
                )  ############generalize these functions ---> enable_form(self,checklist, amount) , clear_Form(self, questionList,checklist,lenlist, amount)
                self.enable_form(1, EnableVar)  #######
            else:
                self.clear_form(1, 10, 10)
                self.question2[0].setText('No Form To Display For This Device')
        else:
            self.clear_form(1, 10, 10)
            self.question2[0].setText('No Form To Display For This Device')

    def InsertAtIndex(self, table, y, x, Item):
        table.setItem(y, x, QTableWidgetItem(Item))

    def clear_form(self, group, lenlist, amount):
        for i in range(amount):
            self.questions[group][lenlist - i - 1].clear()
            self.checks[group][lenlist - i - 1].hide()
            self.checks[group][lenlist - i - 1].setDisabled(True)

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
            False, False, False, False, False, False, False, False, False,
            False, False
        ]
        self.CheckStates[10] = self.CheckAll_checkBox.isChecked()
        for i in range(10):
            self.CheckStates[i] = self.checks[0][i].isChecked()

        if any(self.CheckStates):
            self.Inspection_comboBox.setDisabled(True)
        else:
            self.Inspection_comboBox.setDisabled(False)


def main():
    app = QtWidgets.QApplication(sys.argv)
    mainWindow = QtWidgets.QMainWindow()
    ApplicationWindow(mainWindow)
    mainWindow.show()
    sys.exit(app.exec_())


if __name__ == "__main__":
    main()

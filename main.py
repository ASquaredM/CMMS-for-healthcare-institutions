import os
import sys

from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QTableWidgetItem

from DB_Management import DatabaseUtilities as DU
import hospital_gui

DB = DU()

class ApplicationWindow(hospital_gui.Ui_MainWindow):
    def __init__(self,mainWindow):
        super(ApplicationWindow, self).setupUi(mainWindow)
        
        self.UpdateTables()

        ''' Buttons
        self.AddDevice_button.clicked.connect(lambda: self.InsertAtIndex(self.Devices_table, 1, 0, 'Test'))
        self.SubmitAnswers_button.clicked.connect(lambda: self.InsertAtIndex(self.Devices_table, 1, 0, 'Test'))
        self.CreateForm_button.clicked.connect(lambda: self.InsertAtIndex(self.Devices_table, 1, 0, 'Test'))
        self.ManageTasks_button.clicked.connect(lambda: self.InsertAtIndex(self.Devices_table, 1, 0, 'Test'))
        self.Export_button.clicked.connect(lambda: self.InsertAtIndex(self.Devices_table, 1, 0, 'Test'))
        self.Print_button.clicked.connect(lambda: self.InsertAtIndex(self.Devices_table, 1, 0, 'Test'))
        '''
        ''' Tables
        self.Forms_table
        self.Department_table
        self.Devices_table
        self.ToDo_table
        '''
        ''' LineEdit
        self.Search_lineEdit
        '''
        ''' Actions (Ordered by the actual toolbar order)
        self.actionFollow_Up.triggere seld.connect(lambda: self.InsertAtIndex(self.Devices_table, 1, 0, 'Test'))
        self.actionHome.triggered.connect(lambda: self.InsertAtIndex(self.Devices_table, 1, 0, 'Test'))
        self.actionTo_Do.triggered.connect(lambda:f.InsertAtIndex(self.Devices_table, 1, 0, 'Test'))
        self.actionDaily_Inspection.triggered.connect(lambda: self.InsertAtIndex(self.Devices_table, 1, 0, 'Test'))
        self.actionInformation.triggered.connect(lambda: self.InsertAtIndex(self.Devices_table, 1, 0, 'Test'))
        self.actionTools.triggered.connect(lambda: self.InsertAtIndex(self.Devices_table, 1, 0, 'Test'))
        self.actionAdd_Device.triggered.connect(lambda: self.InsertAtIndex(self.Devices_table, 1, 0, 'Test'))
        self.actionCreate_Form.triggered.connect(lambda: self.InsertAtIndex(self.Devices_table, 1, 0, 'Test'))
        self.actionManage_Tasks.triggered.connect(lambda: self.InsertAtIndex(self.Devices_table, 1, 0, 'Test'))
        self.actionCMMS.triggered.connect(lambda: self.InsertAtIndex(self.Devices_table, 1, 0, 'Test'))
        '''
        ''' Combos
        self.DepartmentSelection_combo
        self.DepartmentSelection_combo_2
        self.DepartmentSelection_combo_3
        self.Date_comboBox
        self.Inspection_comboBox
        '''
        
        self.DepartmentSelection_combo.currentIndexChanged.connect(lambda: self.UpdateTable(DB.SelectRows('device','depid = %s'% self.DepartmentSelection_combo.currentIndex()),self.Devices_table))



    def UpdateTables(self):
        self.UpdateTable(DB.GetRows('department'),self.Department_table)
        self.UpdateTable(DB.GetRows('device'),self.Devices_table)

    def UpdateTable(self,rows,UItable):
        UItable.setRowCount(len(rows))
        UItable.setColumnCount(len(rows[0]))
        
        for row_number, row_data in enumerate(rows):
            for column_number, column_data in enumerate(row_data):
                self.InsertAtIndex(UItable, row_number, column_number, str(column_data))
        

    def InsertAtIndex(self, table, y, x, Item):
        table.setItem(y, x, QTableWidgetItem(Item))


def main():
    app = QtWidgets.QApplication(sys.argv)
    mainWindow = QtWidgets.QMainWindow()
    ApplicationWindow(mainWindow)
    mainWindow.show()
    sys.exit(app.exec_())


if __name__ == "__main__":
    main()

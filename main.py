import os
import sys

from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QTableWidgetItem

from DB_Management import DatabaseUtilities as DU
import hospital_gui


class ApplicationWindow(hospital_gui.Ui_MainWindow):
    def __init__(self,mainWindow):
        super(ApplicationWindow, self).setupUi(mainWindow)

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

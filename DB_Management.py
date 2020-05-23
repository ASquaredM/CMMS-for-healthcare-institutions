import mysql.connector
from mysql.connector import errorcode
from datetime import datetime


class DatabaseUtilities:
    def __init__(self):
        self.DB_init()

    def DB_init(self):
        self.mydb = mysql.connector.connect(host="localhost",
                                            user="root",
                                            passwd="mysql",
                                            database="Hospital")
        self.cursor = self.mydb.cursor()

    def CreateTable(self, tableName):
        cmd = (" CREATE TABLE IF NOT EXISTS " + tableName)
        self.RunCommand(cmd)

    def GetTable(self, tableName):
        return self.RunCommand("SELECT * FROM %s;" % tableName)

    def GetTables(self):
        return self.RunCommand("SHOW Tables")

    def GetColumns(self, tableName):
        return self.RunCommand("SHOW COLUMNS FROM %s;" % tableName)

    def GetRows(self, tableName):
        return self.RunCommand("SELECT * FROM %s;" % tableName)

    def SelectRows(self, tableName, Condition):
        cmd = tableName + ' where ' + Condition
        return self.RunCommand("SELECT * FROM %s;" % cmd)

    def GetDF(self, i):
        cmd = '''
        SELECT T1.text, T1.formid, T1.formtype, T1.formfamily FROM (SELECT form.text, form.formid, form.formtype, form.formfamily, device.depid 
                                                                    FROM form 
                                                                    JOIN device on form.formfamily = device.family) AS T1 
        WHERE depid = {};)
        '''.format(i)
        result = self.RunCommand(cmd)
        self.cursor.close()
        self.DB_init()
        return result

    def RunCommand(self, cmd):
        print("RUNNING COMMAND: " + cmd)
        try:
            self.cursor.execute(cmd, multi=True)
        except mysql.connector.Error as err:
            print('ERROR MESSAGE: ' + str(err.msg))
            print('WITH ' + cmd)
        try:
            msg = self.cursor.fetchall()

            print("NOICE")
        except:
            msg = self.cursor.fetchone()
            print("shiiiiiiiiit")

        return msg

    def AddEntryToTable(self, tableName, message):
        Date = datetime.now().strftime("%y-%m-%d")
        Time = datetime.now().strftime("%H:%M")

        cmd = " INSERT INTO " + tableName + " (date, time, message)"
        cmd += " VALUES ('%s', '%s', '%s' );" % (Date, Time, message)
        self.RunCommand(cmd)

    def __del__(self):
        self.mydb.commit()
        self.cursor.close()
        self.mydb.close()

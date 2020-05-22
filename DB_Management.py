import mysql.connector
from mysql.connector import errorcode
from datetime import datetime

class DatabaseUtilities: 
	def __init__(self):
		self.mydb = mysql.connector.connect(
								host="localhost",
								user="root",
								passwd="mysql",
								database="Hospital"
								)
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
		return self.RunCommand("SELECT * from %s;" % tableName)

	def SelectRows(self, tableName, Condition):
		cmd = tableName + ' where ' + Condition
		return self.RunCommand("SELECT * from %s;" % cmd)

	def RunCommand(self, cmd):
		print ("RUNNING COMMAND: " + cmd)
		try:
			self.cursor.execute(cmd)
		except mysql.connector.Error as err:
			print ('ERROR MESSAGE: ' + str(err.msg))
			print ('WITH ' + cmd)
		try:
			msg = self.cursor.fetchall()
		except:
			msg = self.cursor.fetchone()
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

from selenium import webdriver
import time
import win32com.client
from selenium.webdriver.chrome.webdriver import WebDriver
driver: WebDriver=webdriver.Chrome()
driver.maximize_window()
driver.get('https://av-abc.com/')
shell = win32com.client.Dispatch("WScript.Shell")
shell.Sendkeys("ro_user")
time.sleep(2)
shell.Sendkeys("{TAB}")
time.sleep(2)
shell.Sendkeys("ro##123!")
time.sleep(2)
shell.Sendkeys("{ENTER}")
time.sleep(2)
driver.quit()
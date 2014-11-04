# This is a test harness for your module
# You should do something interesting in this harness 
# to test out the module and to provide instructions 
# to users on how to use it by example.

# open a single window
win = Ti.UI.createWindow(backgroundColor: "white")

win.open()

# TODO: write your module tests here
iosutil = require("jp.coe.util")
Ti.API.info "module is => " + iosutil
arr = iosutil.getFontList()
Ti.API.info "arr is => " + arr
Ti.API.info "module exampleProp is => " + iosutil.exampleProp
Ti.API.info "touchID => " + iosutil.isTouchID()

iosutil.exampleProp = "This is a test value"
table = Ti.UI.createTable
  top:0
  bottom:0

if Ti.Platform.name is "android"
  proxy = iosutil.createExample(
    message: "Creating an example Proxy"
    backgroundColor: "red"
    width: 100
    height: 100
    top: 100
    left: 150
  )
  proxy.printMessage "Hello world!"
  proxy.message = "Hi world!.  It's me again."
  proxy.printMessage "Hello world!"
  win.add proxy
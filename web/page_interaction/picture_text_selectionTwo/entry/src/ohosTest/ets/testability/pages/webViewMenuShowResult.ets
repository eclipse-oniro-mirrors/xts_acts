/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { BusinessError } from '@ohos.base';
import { Driver, MouseButton, UiWindow, ON, On } from '@kit.TestKit';

const EVENT_ID_SET_SUITE_KEY = 183601;
let driver = Driver.create()
@Entry
@Component
struct WebViewMenuShowResult {
  @State str: string = ""
  @State count: number = 0
  @State menuShowState: string = ''
  @State userAgentPC:string = "";
  controller: webView.WebviewController = new webView.WebviewController();

  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State isPermissionCBEnd: number = -1;
  @State isOnContextMenuShow: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebViewMenuShowResultTestButton").key('WebViewMenuShowResultTestButton').onClick(async () => {
          console.info("key==>" + this.str)
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
          switch (this.str) {
            case "emitCloseContextMenu": {
              this.menuShowState = 'CloseContextMenu'
              let webRect = Utils.getComponentRect('WebViewMenuShowResultTestWebView');
              let X = Utils.getRectHorizontalCenterX(webRect)
              let Y = Utils.getRectVerticalCenterY(webRect)
              await Utils.sleep(2000);
              await driver.mouseClick({ x: X, y: Y - 80 }, MouseButton.MOUSE_BUTTON_RIGHT);
              setTimeout(async () => {
                await driver.mouseClick({ x: X, y: Y - 80 }, MouseButton.MOUSE_BUTTON_RIGHT);
              }, 5000)
              break;
            }
            case "emitCopyGetEditStateFlags001": {
              this.menuShowState = 'SelectAll'
              this.userAgentPC = this.controller.getUserAgent();
              this.isPageEnd = -1;
              if ((this.userAgentPC).includes("PC")) {
                this.controller.loadUrl("resource://rawfile/MenuTestPastePC.html")
                let window: UiWindow = await driver.findWindow({actived: true});
                await window.maximize()
                await Utils.sleep(2000)
              } else {
                this.controller.loadUrl("resource://rawfile/MenuTestPaste.html")
              }
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              let webRect = Utils.getComponentRect('WebViewMenuShowResultTestWebView');
              let X = Utils.getRectHorizontalCenterX(webRect)
              let Y = Utils.getRectVerticalCenterY(webRect)
              if ((this.userAgentPC).includes("PC")) {
                //点击第二个input框copy聚焦
                await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_RIGHT);
              } else {
                let buttonOne = await driver.findComponent(ON.text('1301234'));
                let point = await buttonOne.getBoundsCenter();
                await driver.mouseClick(point, MouseButton.MOUSE_BUTTON_RIGHT);
              }
              await Utils.sleep(2000);
              this.menuShowState = 'Copy'
              if ((this.userAgentPC).includes("PC")) {
                //点击第二个input框copy聚焦
                await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_RIGHT);
              } else {
                let buttonOne = await driver.findComponent(ON.text('1301234'));
                let point = await buttonOne.getBoundsCenter();
                await driver.mouseClick(point, MouseButton.MOUSE_BUTTON_RIGHT);
              }
              await Utils.sleep(2000);
              this.menuShowState = 'copyPastetest'
              await Utils.sleep(2000);
              if ((this.userAgentPC).includes("PC")) {
                await driver.mouseClick({ x: webRect.left + 120, y: Y }, MouseButton.MOUSE_BUTTON_RIGHT)
              } else {
                //点击第一个input框粘贴
                await driver.mouseClick({ x: webRect.left + 160, y: webRect.top + 40 }, MouseButton.MOUSE_BUTTON_RIGHT)
              }
              await Utils.sleep(2000);
              break;
            }
            case "emitCopy001": {
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes("Wearable")) {
                Utils.emitEvent(true, 176630)
                break;
              }
              webView.WebviewController.setWebDebuggingAccess(true);
              let atManager = abilityAccessCtrl.createAtManager();
              atManager.requestPermissionsFromUser(getContext(this), ['ohos.permission.READ_PASTEBOARD'])
                .then((data) => {
                  console.info('data:' + JSON.stringify(data));
                  console.info('data permissions:' + data.permissions);
                  console.info('data authResults:' + data.authResults);
                  this.isPermissionCBEnd = 1;
                }).catch((error: BusinessError) => {
                console.error(`Failed to request permissions from user. Code is ${error.code}, message is ${error.message}`);
              })
              await Utils.sleep(4000)
              let buttontwo = await driver.findComponent(ON.text('仅本次允许'));
              let buttonThree = await driver.findComponent(ON.text('始终允许'));
              if (buttontwo) {
                await buttontwo.click();
              } else if(buttonThree) {
                await buttonThree.click();
              }
              await Utils.sleep(4000)
              this.menuShowState = 'SelectAll'
              this.isPageEnd = -1;
              if ((this.userAgentPC).includes("PC")) {
                this.controller.loadUrl("resource://rawfile/MenuTestPastePC.html")
              } else {
                this.controller.loadUrl("resource://rawfile/MenuTestPaste.html")
              }
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              await Utils.sleep(2000);
              let webRect = Utils.getComponentRect('WebViewMenuShowResultTestWebView');
              let X = Utils.getRectHorizontalCenterX(webRect)
              let Y = Utils.getRectVerticalCenterY(webRect)
              if ((this.userAgentPC).includes("PC")) {
                await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_RIGHT);
              } else {
                //点击第二个input框copy聚焦
                await driver.mouseClick({ x: webRect.left + 120, y: webRect.top + 60 }, MouseButton.MOUSE_BUTTON_RIGHT);
              }
              await Utils.sleep(2000);
              this.menuShowState = 'Copy'
              this.isOnContextMenuShow = -1
              await driver.mouseClick({ x: webRect.left + 120, y: webRect.top + 60 }, MouseButton.MOUSE_BUTTON_RIGHT);
              await Utils.sleep(2000);
              this.menuShowState = 'copyPaste'
              await Utils.sleep(2000);
              if ((this.userAgentPC).includes("PC")) {
                await driver.mouseClick({ x: webRect.left + 120, y: Y }, MouseButton.MOUSE_BUTTON_RIGHT)
              } else {
                //点击第一个input框粘贴
                await driver.mouseClick({ x: webRect.left + 120, y: webRect.top + 40 }, MouseButton.MOUSE_BUTTON_RIGHT)
              }
              await Utils.sleep(2000);
              this.controller.runJavaScript('getInputValue()', (error, result) => {
                console.log("getInputValue return data >>> ", result, error)
                if (result == '"1301234"') {
                  Utils.emitEvent(true, 176630)
                } else {
                  Utils.emitEvent(false, 176630)
                }
              })
              break;
            }
            case "emitCut001": {
              webView.WebviewController.setWebDebuggingAccess(true);
              let atManager = abilityAccessCtrl.createAtManager();
              this.isPermissionCBEnd = -1
              atManager.requestPermissionsFromUser(getContext(this), ['ohos.permission.READ_PASTEBOARD'])
                .then((data) => {
                  console.info('data:' + JSON.stringify(data));
                  console.info('data permissions:' + data.permissions);
                  console.info('data authResults:' + data.authResults);
                  this.isPermissionCBEnd = 1;
                }).catch((error: BusinessError) => {
                console.error(`Failed to request permissions from user. Code is ${error.code}, message is ${error.message}`);
              })
              await Utils.waitForExist(()=>this.isPermissionCBEnd, this.str+' isPermissionCBEnd', 1, 500);
              let buttontwo = await driver.findComponent(ON.text('仅本次允许'));
              let buttonThree = await driver.findComponent(ON.text('始终允许'));
              if (buttontwo) {
                await buttontwo.click();
              } else if(buttonThree) {
                await buttonThree.click();
              }
              await Utils.waitForReleaseDriver(this.str,driver)
              this.menuShowState = 'SelectAll'
              this.userAgentPC = this.controller.getUserAgent();
              this.isPageEnd = -1;
              if ((this.userAgentPC).includes("PC")) {
                this.controller.loadUrl("resource://rawfile/MenuTestPastePC.html")
              } else {
                this.controller.loadUrl("resource://rawfile/MenuTestPaste.html")
              }
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              let webRect = Utils.getComponentRect('WebViewMenuShowResultTestWebView');
              let X = Utils.getRectHorizontalCenterX(webRect)
              let Y = Utils.getRectVerticalCenterY(webRect)
              if ((this.userAgentPC).includes("PC")) {
                await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_RIGHT);
              } else {
                await driver.mouseClick({ x: webRect.left + 120, y: webRect.top + 60 }, MouseButton.MOUSE_BUTTON_RIGHT);
              }
              await Utils.sleep(2000);
              this.menuShowState = 'Cut'
              this.isOnContextMenuShow = -1
              await driver.mouseClick({ x: webRect.left + 120, y: webRect.top + 60 }, MouseButton.MOUSE_BUTTON_RIGHT);
              await Utils.waitForExist(()=>this.isOnContextMenuShow, this.str+' isOnContextMenuShow', 1, 1000);
              await Utils.sleep(2000);
              this.menuShowState = 'cutPaste'
              await Utils.sleep(2000);
              if ((this.userAgentPC).includes("PC")) {
                await driver.mouseClick({ x: webRect.left + 120, y: Y }, MouseButton.MOUSE_BUTTON_RIGHT)
              } else {
                await driver.mouseClick({ x: webRect.left + 120, y: webRect.top + 40 }, MouseButton.MOUSE_BUTTON_RIGHT)
              }
              await Utils.sleep(2000);
              this.controller.runJavaScript('getInputValue()', (error, result) => {
                console.log("getInputValue return data >>> ", result, error)
                if (result == '"1301234"') {
                  Utils.emitEvent(true, 176640)
                } else {
                  Utils.emitEvent(false, 176640)
                }
              })
              let window: UiWindow = await driver.findWindow({actived: true});
              await window.resume();
              await Utils.sleep(2000);
              break;
            }

          }
        })
      }

      Web({ src: $rawfile("indexJru.html"), controller: this.controller })
        .key("WebViewMenuShowResultTestWebView")
        .onContextMenuShow((event) => {
          if (event) {
            console.log("==>onContextMenuShow callback getEditStateFlags:", event.param.getEditStateFlags())
            switch (this.menuShowState) {
              case 'CloseContextMenu': {
                if (this.count == 1) {
                  Utils.emitEvent(true, 176610)
                  this.count = 0
                }
                this.count++
                break
              }
              case 'SelectAll': {
                event.result.selectAll()
                break
              }
              case 'Copy': {
                event.result.copy()
                break
              }
              case 'copyPaste': {
                console.log('==>case copyPaste:'+event.result)
                event.result.paste()
                break
              }
              case 'Cut': {
                event.result.cut()
                break
              }
              case 'copyPastetest': {
                console.log('getEditStateFlags:'+event.param.getEditStateFlags())
                Utils.emitEvent(event.param.getEditStateFlags(), 176620);
                break
              }
              case 'cutPaste': {
                event.result.paste()
                break
              }
            }
            this.isOnContextMenuShow = 1
            event.result.closeContextMenu()
          }
          return true
        })
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}

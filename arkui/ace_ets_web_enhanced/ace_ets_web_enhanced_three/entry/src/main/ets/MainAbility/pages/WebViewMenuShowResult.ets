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
import { Driver, MouseButton, UiWindow  } from '@ohos.UiTest';

@Entry
@Component
struct WebViewMenuShowResult {
  @State str: string = ""
  @State count: number = 0
  @State menuShowState: string = ''
  @State userAgentPC:string = "";
  controller: webView.WebviewController = new webView.WebviewController();

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(10)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebViewMenuShowResultTestButton").key('WebViewMenuShowResultTestButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitCloseContextMenu": {
              this.menuShowState = 'CloseContextMenu'
              let webRect = Utils.getComponentRect('WebViewMenuShowResultTestWebView');
              let driver = Driver.create();
              let X = Utils.getRectHorizontalCenterX(webRect)
              let Y = Utils.getRectVerticalCenterY(webRect)
              await driver.mouseClick({ x: X, y: Y - 80 }, MouseButton.MOUSE_BUTTON_RIGHT);
              setTimeout(async () => {
                await driver.mouseClick({ x: X, y: Y - 80 }, MouseButton.MOUSE_BUTTON_RIGHT);
              }, 5000)
              break;
            }
            case "emitCopy001": {
              let driver: Driver = Driver.create();
              this.menuShowState = 'SelectAll'
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes("PC")) {
                this.controller.loadUrl("resource://rawfile/MenuTestPastePC.html")
                await Utils.sleep(2000)
                let window: UiWindow = await driver.findWindow({actived: true});
                await window.maximize()
                await Utils.sleep(2000)
              } else {
                this.controller.loadUrl("resource://rawfile/MenuTestPaste.html")
              }
              await Utils.sleep(2000);
              let webRect = Utils.getComponentRect('WebViewMenuShowResultTestWebView');
              let X = Utils.getRectHorizontalCenterX(webRect)
              let Y = Utils.getRectVerticalCenterY(webRect)
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_RIGHT);
              await Utils.sleep(2000);
              this.menuShowState = 'Copy'
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_RIGHT);
              await Utils.sleep(2000);
              this.menuShowState = 'copyPaste'
              await Utils.sleep(2000);
              if ((this.userAgentPC).includes("PC")) {
                await driver.mouseClick({ x: webRect.left + 120, y: webRect.top + 400 }, MouseButton.MOUSE_BUTTON_RIGHT)
              } else {
                await driver.mouseClick({ x: webRect.left + 120, y: webRect.top + 40 }, MouseButton.MOUSE_BUTTON_RIGHT)
              }
              await Utils.sleep(2000);
              break;
            }
            case "emitCut001": {
              this.menuShowState = 'SelectAll'
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes("PC")) {
                this.controller.loadUrl("resource://rawfile/MenuTestPastePC.html")
              } else {
                this.controller.loadUrl("resource://rawfile/MenuTestPaste.html")
              }
              await Utils.sleep(2000);
              let webRect = Utils.getComponentRect('WebViewMenuShowResultTestWebView');
              let driver = Driver.create();
              let X = Utils.getRectHorizontalCenterX(webRect)
              let Y = Utils.getRectVerticalCenterY(webRect)
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_RIGHT);
              await Utils.sleep(2000);
              this.menuShowState = 'Cut'
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_RIGHT);
              await Utils.sleep(2000);
              this.menuShowState = 'cutPaste'
              await Utils.sleep(2000);
              if ((this.userAgentPC).includes("PC")) {
                await driver.mouseClick({ x: webRect.left + 120, y: webRect.top + 400 }, MouseButton.MOUSE_BUTTON_RIGHT)
              } else {
                await driver.mouseClick({ x: webRect.left + 120, y: webRect.top + 40 }, MouseButton.MOUSE_BUTTON_RIGHT)
              }
              await Utils.sleep(2000);
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
            switch (this.menuShowState) {
              case 'CloseContextMenu': {
                if (this.count == 1) {
                  Utils.emitEvent(true, 3501)
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
                event.result.paste()
                this.controller.runJavaScript('getInputValue()', (error, result) => {
                  console.log("getInputValue return data >>> ", result, error)
                  if (result == '"1301234"') {
                    Utils.emitEvent(true, 3502)
                  } else {
                    Utils.emitEvent(false, 3502)
                  }
                })
                break
              }
              case 'Cut': {
                event.result.cut()
                break
              }
              case 'cutPaste': {
                event.result.paste()
                this.controller.runJavaScript('getInputValue()', (error, result) => {
                  console.log("getInputValue return data >>> ", result, error)
                  if (result == '"1301234"') {
                    Utils.emitEvent(true, 3504)
                  } else {
                    Utils.emitEvent(false, 3504)
                  }
                })
                break
              }
            }
            event.result.closeContextMenu()
          }
          return true
        })
    }
  }
}

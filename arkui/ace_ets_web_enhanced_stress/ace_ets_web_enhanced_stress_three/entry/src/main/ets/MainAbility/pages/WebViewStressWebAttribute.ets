/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { Driver, MouseButton, ON } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';


@Entry
@Component
struct WebViewStressWebAttribute {
  controller: webView.WebviewController = new webView.WebviewController();
  controllerNull: webView.WebviewController = new webView.WebviewController();
  @State Permission: Boolean = false
  @State str: string = ""
  @State webId: number = 0
  @State startTime: number = 0
  @State endTime: number = 0
  @State paramString: string = ''
  @State callBackId: number = 0
  @State stressTimes: number = 0;
  @State onPageVisibleState: boolean = false
  @State count: number = 0
  WebResult: WebContextMenuResult = new WebContextMenuResult;
  @State buttonKey: string = '';

  onPageShow() {
    Utils.registerEventPage((eventData: events_emitter.EventData) => {
      if (eventData.data) {
        this.str = eventData.data.CASE_NAME;
        this.callBackId = eventData.data.CALL_BACK_ID;
        this.stressTimes = eventData.data.STRESS_TIMES;
        this.buttonKey = eventData.data.BUTTON_KEY
      }
    })
  }

  onPageHide() {
    Utils.unRegisterEventPage()
  }

  build() {
    Column() {
      Row() {
        Button(this.buttonKey)
          .key(this.buttonKey)
          .onClick(async () => {
            console.info("key==>" + this.str)
            switch (this.str) {
              case "testOnPermissionRequest001": {
                this.controller.loadUrl("resource://rawfile/indexVideo.html")
                await Utils.sleep(100);
                try {
                  let driver = Driver.create();
                  let button = await driver.findComponent(ON.id('WebViewStressWebAttributeWebView'));
                  for (let i = 0; i < this.stressTimes; i++) {
                    await button.click();
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case "testOnContextMenuShow001": {
                this.controller.loadUrl("resource://rawfile/indexJru.html")
                try {
                  let webRect = Utils.getComponentRect('WebViewStressWebAttributeWebView');
                  let driver = Driver.create();
                  let X = Utils.getRectHorizontalCenterX(webRect)
                  let Y = Utils.getRectVerticalCenterY(webRect)
                  for (let i = 0; i <= this.stressTimes; i++) {
                    await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_RIGHT);
                    console.log('Attribute.i =>>>' + i)
                    await Utils.sleep(500);
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case "testOnTouchIconUrlReceived001": {
                try {
                  this.controller.loadUrl("resource://rawfile/indexFour.html")
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case "testOnPageVisible001": {
                this.onPageVisibleState = true
                try {
                  this.controller.loadUrl("resource://rawfile/indexJru.html")
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }

                break;
              }
              case "testOnScreenCaptureRequest001": {
                console.log("Attribute.onScreenCaptureRequest () : in")
                this.controller.loadUrl("resource://rawfile/screenCaptureTest.html");
                await Utils.sleep(2000);
                this.controller.loadUrl("resource://rawfile/screenCaptureTest.html");
                await Utils.sleep(2000);
                this.controller.runJavaScript('getScreenStream()')
                break;
              }
            }
          })
      }

      Web({ src: $rawfile("indexJru.html"), controller: this.controller })
        .key("WebViewStressWebAttributeWebView")
        .javaScriptAccess(true)
        .geolocationAccess(true)
        .databaseAccess(true)
        .onScreenCaptureRequest(async (event) => {
          if (event) {
            try {
              for (let i = 0; i <= this.stressTimes; i++) {
                this.count = i
                this.controller.runJavaScript('getScreenStream()')
                console.log('Attribute.onScreenCaptureRequest () :' + this.count + " --- " + this.stressTimes)
              }
              if (this.count == this.stressTimes) {
                Utils.emitEvent(true, this.callBackId)
              }
            } catch (error) {
              console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              Utils.emitEvent(false, this.callBackId)
            }
          }
        })
        .onPageVisible((event) => {
          if (this.onPageVisibleState) {
            this.count++
            console.log('onPageVisible url:' + event.url)
            console.log('Attribute.onPageVisible () :' + this.count + " --- " + this.stressTimes)
            if (this.count == this.stressTimes) {
              Utils.emitEvent(true, this.callBackId)
              this.onPageVisibleState = false
              this.count = 0
            } else {
              this.controller.loadUrl("resource://rawfile/indexJru.html")
            }
          }
        })
        .onTouchIconUrlReceived((event) => {
          this.count++
          console.log('Attribute.onTouchIconUrlReceived:' + this.count + " --- " + this.stressTimes)
          if (this.count == this.stressTimes) {
            Utils.emitEvent(true, this.callBackId)
            this.count = 0
          } else {
            this.controller.loadUrl("resource://rawfile/indexFour.html")
          }
        })
        .onPermissionRequest((event) => {
          this.count++
          console.log('Attribute.PermissionRequest() : ' + this.count + " --- " + this.stressTimes)
          if (this.count == this.stressTimes) {
            Utils.emitEvent(true, this.callBackId)
            this.count = 0
          } else {
            if (event) {
              setTimeout(() => {
                event.request.deny()
              }, 100)
            }
          }
        })
        .onContextMenuShow((event) => {
          this.count++
          console.log('Attribute.onContextMenuShow() : ' + this.count + " --- " + this.stressTimes)
          if (this.count == this.stressTimes) {
            Utils.emitEvent(true, this.callBackId)
            this.count = 0
          }
          if (event) {
            event.result.closeContextMenu()
          }
          return true
        })
    }
  }
}

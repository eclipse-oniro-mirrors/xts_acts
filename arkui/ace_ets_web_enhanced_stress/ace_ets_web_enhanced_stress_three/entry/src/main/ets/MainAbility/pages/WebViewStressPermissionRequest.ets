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
import { Driver, ON } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct WebViewStressPermissionRequest {
  controller: webView.WebviewController = new webView.WebviewController();
  controllerNull: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State startTime: number = 0
  @State endTime: number = 0
  @State paramString: string = ''
  @State runJavaString: boolean = false
  @State callBackId: number = 0
  @State onRequest: boolean = false
  @State onRequestState: boolean = false
  @State RequestState: string = ''
  @State stressTimes: number = 0;
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
            case "testOnPermissionRequestGetOrigin001": {
              this.RequestState = 'GetOrigin'
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/indexVideo.html")
              await Utils.sleep(2000);
              let driver = Driver.create();
              let button = await driver.findComponent(ON.id('WebViewStressPermissionRequestWebView'));
              await button.click();
              break;
            }
            case "testOnPermissionRequestGetAccessibleResource001": {
              this.RequestState = 'GetAccessibleResource'
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/indexVideo.html")
              await Utils.sleep(2000);
              let driver = Driver.create();
              let button = await driver.findComponent(ON.id('WebViewStressPermissionRequestWebView'));
              await button.click();
              break;
            }
            case "testOnPermissionRequestDeny001": {
              this.RequestState = 'Deny'
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/indexVideo.html")
              await Utils.sleep(2000);
              let driver = Driver.create();
              let button = await driver.findComponent(ON.id('WebViewStressPermissionRequestWebView'));
              await button.click();
              break;
            }
            case "testOnPermissionRequestGrant001": {
              this.RequestState = 'Grant'
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/indexVideo.html")
              await Utils.sleep(2000);
              let driver = Driver.create();
              let button = await driver.findComponent(ON.id('WebViewStressPermissionRequestWebView'));
              await button.click();
              break;
            }
          }
        })
      }

      Web({ src: $rawfile("indexJru.html"), controller: this.controller })
        .key("WebViewStressPermissionRequestWebView")
        .javaScriptAccess(true)
        .geolocationAccess(true)
        .databaseAccess(true)
        .onPermissionRequest((event) => {
          console.log("emitProtectedResourceType >>>111")
          if (event) {
            switch (this.RequestState) {
              case 'GetOrigin': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    event.request.getOrigin()
                    Utils.stressingLog('ProtectedResource.getOrigin()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'GetAccessibleResource': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    event.request.getAccessibleResource()
                    Utils.stressingLog('ProtectedResource.getAccessibleResource()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'Deny': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    event.request.deny()
                    Utils.stressingLog('ProtectedResource.deny()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'Grant': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    event.request.grant(event.request.getAccessibleResource())
                    Utils.stressingLog('ProtectedResource.grant()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
            }
          }
        })
    }
  }
}

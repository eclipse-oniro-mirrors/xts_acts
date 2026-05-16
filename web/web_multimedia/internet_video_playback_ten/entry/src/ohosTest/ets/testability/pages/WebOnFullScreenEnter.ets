/**
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

import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils.test';
import webView from '@ohos.web.webview';
import { waitForExist } from '../../test/WaitTest.test';
import { Driver, ON } from '@kit.TestKit';

@Entry
@Component
struct WebOnFullScreenEnter {
  controller: webView.WebviewController = new webView.WebviewController();
  handler?: FullScreenExitHandler
  @State str: string = '';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State onFullScreenEnterCalled: boolean = false;
  @State checkEleResult: string = "";
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State isGetComEnd:number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 300750,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(300750)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('OnFullScreenEnterTestButton').onClick(async () => {
          console.info('key==>' + this.str)
          await waitForExist(()=>this.isReceive,  this.str + 'IsReceive', 0);
          await waitForExist(()=>this.isPageEnd, this.str + 'IsPageEnd', 0);
          this.isReceive = -1;
          switch (this.str) {
            case "emitOnFullScreenEnter": {
              try {
                await Utils.sleep(1000);
                const driver = Driver.create();
                await Utils.waitAndClickComponent(driver,'OnFullScreenEnterTestWeb')
                await waitForExist(() => this.onFullScreenEnterCalled ? 1 : 0, this.str, 1);
                this.controller.runJavaScript("checkIsFullScreen()", (error, result) => {
                  if (error) {
                    console.log(`The checkIsFullScreen() return error is: ${error}`);
                  }
                  this.checkEleResult = JSON.stringify(result)
                  console.log(`The checkIsFullScreen() return value is: ${result}`);
                  Utils.emitEvent(this.onFullScreenEnterCalled + '_' + this.checkEleResult, 300760)
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('webFullScreenTest.html'), controller: this.controller })
        .key('OnFullScreenEnterTestWeb')
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .onPageEnd(()=>{
          console.log("onPageEnd******")
          this.isPageEnd = 0;
        })
        .onFullScreenEnter((event) => {
          console.log("onFullScreenEnter...")
          this.handler = event.handler
          console.log("this.handler: " + JSON.stringify(this.handler))
          this.onFullScreenEnterCalled = true
        })
    }
  }
}
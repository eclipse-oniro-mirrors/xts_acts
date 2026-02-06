/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';
import {waitForExist} from '../../test/WaitTest.test';

@Entry
@Component
struct webViewDefaultFontSize {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "emitdefaultFontSize73AndminFontSize1";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State userAgent: string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";
  @State defaultFontSize: number = 13;
  @State minFontSize: number = 13;
  @State checkEleResult: string | [] = [];
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 150250,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("webViewDefaultFontSize page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('webViewDefaultFontSize').onClick(async () => {
          await waitForExist(() => this.isPageEnd, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitdefaultFontSize73AndminFontSize1": {
              try {
                this.defaultFontSize = 73;
                this.minFontSize = 1;
                this.isPageEnd = -1;
                this.controller.refresh();
                await waitForExist(() => this.isPageEnd, this.str, 0);
                console.log("fonsize of emitdefaultFontSize73AndminFontSize1 is :" + this.defaultFontSize + this.minFontSize);
                this.controller.runJavaScript("getPageFontsize()", (error, result) => {
                  this.checkEleResult = JSON.parse(result)
                  Utils.sleep(2000)
                  console.log(`The getPageFontsize() return value is: ${result}`);
                  Utils.emitEvent(this.checkEleResult[1], 150260)
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitdefaultFontSize73AndminFontSize73": {
              try {
                this.defaultFontSize = 73;
                this.minFontSize = 73;
                this.isPageEnd = -1;
                this.controller.refresh();
                await waitForExist(() => this.isPageEnd, this.str, 0);
                console.log("fonsize of emitdefaultFontSize73AndminFontSize73 is :" + this.defaultFontSize + this.minFontSize);
                this.controller.runJavaScript("getPageFontsize()", (error, result) => {
                  this.checkEleResult = JSON.parse(result)
                  Utils.sleep(2000)
                  console.log(`The getPageFontsize() return value is: ${result}`);
                  Utils.emitEvent(this.checkEleResult[1], 150270)
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('indexFive.html'), controller: this.controller })
        .defaultFontSize(this.defaultFontSize)
        .minFontSize(this.minFontSize)
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent)
        .onPageEnd((event) => {
            if (event) {
              this.isPageEnd = 0;
              console.log('onPageEnd url:' + event.url);
            }
          })
    }
  }
}
/**
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
import business_error from '@ohos.base';

@Entry
@Component
struct WebPageSnapshot {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  controllerTwo: web_webview.WebviewController = new web_webview.WebviewController();
  controllerThree: web_webview.WebviewController = new web_webview.WebviewController();
  delegate: web_webview.WebDownloadDelegate = new web_webview.WebDownloadDelegate();
  failedDownload: Uint8Array | null = null;
  @State str: string = "emitGetWebId";
  @State webId: number = 0;
  @State webId2: number = 0;
  @State webId3: number = 0;
  @State webIdTol: number = 0;
  @State userAgent: string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " CHROME/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";
  @State userAgent2: string = "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " Chrome/86.0.4240.198 Safari/537.36";
  @State userAgentAll: string = "";
  @State userAgentPC:string = "";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 154080,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }
  onPageHide() {
    events_emitter.off(154080)
  }
  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('webWebPageSnapshot').onClick(async () => {
          console.info("key==>" + this.str)
          await Utils.waitForExist(() => this.isReceive, this.str + ' isReceive', 1, 1000);
          await Utils.waitForExist(() => this.isPageEnd, this.str + ' isPageEnd', 1, 1000);
          switch (this.str) {
            case "testWebPageSnapshot001": {
              try {
                this.controller.webPageSnapshot({ id: "1234", size: { width: 100, height: 100 } }, (error, result) => {
                  if (error) {
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    Utils.emitEvent(false, 154210)
                  } else {
                    console.log('testWebPageSnapshot001 result is :' + JSON.stringify(result));
                    Utils.emitEvent(true, 154210)
                  }
                });
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(true, 154210)
              }
            }
            case "testWebPageSnapshot002": {
              try {
                  this.controller.webPageSnapshot(undefined,
                    (error: business_error.BusinessError, result: web_webview.SnapshotResult) => {
                      if (error) {
                        console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                        Utils.emitEvent("null_error", 154100)
                      } else {
                        console.log('testWebPageSnapshot002 result is :' + JSON.stringify(result));
                        Utils.emitEvent("null", 154100)
                      }
                    });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent("null_error", 154100)
              }
              break;
            }
            case "testWebPageSnapshot003": {
              try {
                this.controller.webPageSnapshot(null,
                  (error: business_error.BusinessError, result: web_webview.SnapshotResult) => {
                    if (error) {
                      console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                      Utils.emitEvent("undefined_error", 154110)
                    } else {
                      console.log('testWebPageSnapshot003 result is :' + JSON.stringify(result));
                      Utils.emitEvent("undefined", 154110)
                    }
                  });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent("undefined_error", 154110)
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('indexCopy.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent)
        .overScrollMode(OverScrollMode.NEVER)
        .onPageEnd((event) => {
          if (event) {
            this.isPageEnd = 1;
            console.log("onPageEnd==> event.url:" + event.url)
          }
        })
       }
    }
  }

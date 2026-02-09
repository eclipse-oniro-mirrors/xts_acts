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

import webView from '@ohos.web.webview';
import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';
import {waitForExist} from '../../test/WaitTest';

@Entry
@Component
struct WebDownloadEnumTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 119110,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(119110)
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
    Row() {
      Column() {
        Button('WebDownloadEnumTestButton').key('WebDownloadEnumTestButton')
          .onClick(async () => {
            await waitForExist(()=>this.isReceive, 'WebDownloadEnumTestButtonIsReceive', 0);
            console.info('key==>' + this.str);
            this.isReceive = -1;
            switch (this.str) {
              case "testWebDownloadEnum001": {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.ERROR_UNKNOWN, 119120)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum002": {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.FILE_FAILED, 119130)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum003": {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.FILE_ACCESS_DENIED, 119140)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum004": {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.FILE_NO_SPACE, 119150)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum005": {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.FILE_NAME_TOO_LONG, 119160)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum006": {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.FILE_TOO_LARGE, 119170)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum007": {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.FILE_TRANSIENT_ERROR, 119180)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum008": {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.FILE_BLOCKED, 119190)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum009": {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.FILE_TOO_SHORT, 119200)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum010": {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.FILE_HASH_MISMATCH, 119210)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum011": {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.FILE_SAME_AS_SOURCE, 119220)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum012": {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.NETWORK_FAILED, 119230)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum013": {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.NETWORK_TIMEOUT, 119240)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum014": {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.NETWORK_DISCONNECTED, 119250)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum015": {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.NETWORK_SERVER_DOWN, 119260)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum016": {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.NETWORK_INVALID_REQUEST, 119270)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum017": {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.SERVER_FAILED, 119280)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum018": {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.SERVER_NO_RANGE, 119290)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum019": {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.SERVER_BAD_CONTENT, 119300)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum020": {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.SERVER_UNAUTHORIZED, 119310)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum021": {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.SERVER_CERT_PROBLEM, 119320)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum022": {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.SERVER_FORBIDDEN, 119330)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum023": {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.SERVER_UNREACHABLE, 119340)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum024": {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.SERVER_CONTENT_LENGTH_MISMATCH, 119350)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum025": {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.SERVER_CROSS_ORIGIN_REDIRECT, 119360)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum026": {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.USER_CANCELED, 119370)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum027": {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.USER_SHUTDOWN, 119380)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum028": {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.CRASH, 119390)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum029": {
                try {
                  Utils.emitEvent(webView.WebDownloadState.IN_PROGRESS, 119400)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum030": {
                try {
                  Utils.emitEvent(webView.WebDownloadState.COMPLETED, 119410)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum031": {
                try {
                  Utils.emitEvent(webView.WebDownloadState.CANCELED, 119420)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum032": {
                try {
                  Utils.emitEvent(webView.WebDownloadState.INTERRUPTED, 119430)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum033": {
                try {
                  Utils.emitEvent(webView.WebDownloadState.PENDING, 119440)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum034": {
                try {
                  Utils.emitEvent(webView.WebDownloadState.PAUSED, 119450)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum035": {
                try {
                  Utils.emitEvent(webView.WebDownloadState.UNKNOWN, 119460)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
            }
          })

        Web({ src: $rawfile('index.html'), controller: this.controller })
          .javaScriptAccess(true)
          .javaScriptAccess(true)
          .horizontalScrollBarAccess(true)
          .verticalScrollBarAccess(true)
          .geolocationAccess(true)
          .databaseAccess(true)
          .onPageEnd(()=>{
            this.isPageEnd = 0;
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
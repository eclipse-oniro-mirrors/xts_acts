/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
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
  @State str: string = ''
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 119470,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(119470)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
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
            await waitForExist(()=>this.isPageEnd, 'WebDownloadEnumTestButtonIsPageEnd', 0);
            console.info('key==>' + this.str);
            this.isReceive = -1;
            switch (this.str) {
              case 'testWebDownloadEnum001': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.ERROR_UNKNOWN, 119480)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum002': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.FILE_FAILED, 119490)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum003': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.FILE_ACCESS_DENIED, 119500)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum004': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.FILE_NO_SPACE, 119510)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum005': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.FILE_NAME_TOO_LONG, 119520)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum006': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.FILE_TOO_LARGE, 119530)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum007': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.FILE_TRANSIENT_ERROR, 119540)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum008': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.FILE_BLOCKED, 119550)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum009': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.FILE_TOO_SHORT, 119560)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum010': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.FILE_HASH_MISMATCH, 119570)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum011': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.FILE_SAME_AS_SOURCE, 119580)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum012': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.NETWORK_FAILED, 119590)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum013': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.NETWORK_TIMEOUT, 119600)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum014': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.NETWORK_DISCONNECTED, 119610)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum015': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.NETWORK_SERVER_DOWN, 119620)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum016': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.NETWORK_INVALID_REQUEST, 119630)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum017': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.SERVER_FAILED, 119640)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum018': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.SERVER_NO_RANGE, 119650)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum019': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.SERVER_BAD_CONTENT, 119660)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum020': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.SERVER_UNAUTHORIZED, 119670)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum021': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.SERVER_CERT_PROBLEM, 119680)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum022': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.SERVER_FORBIDDEN, 119690)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum023': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.SERVER_UNREACHABLE, 119700)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum024': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.SERVER_CONTENT_LENGTH_MISMATCH, 119710)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum025': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.SERVER_CROSS_ORIGIN_REDIRECT, 119720)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum026': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.USER_CANCELED, 119730)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum027': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.USER_SHUTDOWN, 119740)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum028': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.CRASH, 119750)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              
            }
          })

        Web({ src: $rawfile('second.html'), controller: this.controller })
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
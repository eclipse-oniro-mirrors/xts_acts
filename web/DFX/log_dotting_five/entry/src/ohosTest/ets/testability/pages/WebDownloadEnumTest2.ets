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

@Entry
@Component
struct WebDownloadEnumTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ''

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
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  build() {
    Row() {
      Column() {
        Button('WebDownloadEnumTestButton').key('WebDownloadEnumTestButton')
          .onClick(async () => {
            console.info('key==>' + this.str)
            switch (this.str) {
              case 'testWebDownloadEnum001': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.ERROR_UNKNOWN, 70250)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum002': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.FILE_FAILED, 70251)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum003': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.FILE_ACCESS_DENIED, 70252)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum004': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.FILE_NO_SPACE, 70253)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum005': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.FILE_NAME_TOO_LONG, 70254)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum006': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.FILE_TOO_LARGE, 70255)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum007': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.FILE_TRANSIENT_ERROR, 70256)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum008': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.FILE_BLOCKED, 70257)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum009': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.FILE_TOO_SHORT, 70258)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum010': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.FILE_HASH_MISMATCH, 70259)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum011': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.FILE_SAME_AS_SOURCE, 70260)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum012': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.NETWORK_FAILED, 70261)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum013': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.NETWORK_TIMEOUT, 70262)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum014': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.NETWORK_DISCONNECTED, 70263)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum015': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.NETWORK_SERVER_DOWN, 70264)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum016': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.NETWORK_INVALID_REQUEST, 70265)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum017': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.SERVER_FAILED, 70266)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum018': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.SERVER_NO_RANGE, 70267)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum019': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.SERVER_BAD_CONTENT, 70268)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum020': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.SERVER_UNAUTHORIZED, 70269)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum021': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.SERVER_CERT_PROBLEM, 70270)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum022': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.SERVER_FORBIDDEN, 70271)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum023': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.SERVER_UNREACHABLE, 70272)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum024': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.SERVER_CONTENT_LENGTH_MISMATCH, 70273)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum025': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.SERVER_CROSS_ORIGIN_REDIRECT, 70274)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum026': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.USER_CANCELED, 70275)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum027': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.USER_SHUTDOWN, 70276)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebDownloadEnum028': {
                try {
                  Utils.emitEvent(webView.WebDownloadErrorCode.CRASH, 70277)
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
      }
      .width('100%')
    }
    .height('100%')
  }
}
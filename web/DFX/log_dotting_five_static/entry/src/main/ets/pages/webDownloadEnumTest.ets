/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import {
  Entry,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  Web,
} from '@ohos.arkui.component'
import webview from '@ohos.web.webview'
import emitter from '@ohos.events.emitter'
import events_emitter from '@ohos.events.emitter'
import Utils from '../../src/test/Utils.test';
import { BusinessError } from '@ohos.base'
import { Callback, RecordData } from '@ohos.base'
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
class StringFields {
  public str: string = '';
}

@Entry
@Component
struct WebDownloadEnumTest {
  stringObj: StringFields  = new StringFields ();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  @State str: string = ""

aboutToAppear() {
  let valueChangeEvent: events_emitter.InnerEvent = {
    eventId: 10,
    priority: events_emitter.EventPriority.LOW
  }
  events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
}

private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
  if (eventData != null) {
    console.info('valueChangeCallBack:' + JSON.stringify(eventData));
    const data = eventData.data as Record<string, RecordData>;
    if (data != null && data['ACTION'] != null) {
      let strValue: string = String(data['ACTION']);
      this.stringObj.str = strValue;
    }
  }
}

  build() {
    Row() {
      Column() {
        Button("WebDownloadEnumTestButton").key('WebDownloadEnumTestButton').onClick((e: ClickEvent) => {
          console.info("key==>" +  this.stringObj.str)
          switch ( this.stringObj.str) {
              case "testWebDownloadEnum001": {
                try {
                  Utils.emitEvent(webview.WebDownloadErrorCode.ERROR_UNKNOWN, 70250)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum002": {
                try {
                  Utils.emitEvent(webview.WebDownloadErrorCode.FILE_FAILED, 70251)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum003": {
                try {
                  Utils.emitEvent(webview.WebDownloadErrorCode.FILE_ACCESS_DENIED, 70252)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum004": {
                try {
                  Utils.emitEvent(webview.WebDownloadErrorCode.FILE_NO_SPACE, 70253)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum005": {
                try {
                  Utils.emitEvent(webview.WebDownloadErrorCode.FILE_NAME_TOO_LONG, 70254)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum006": {
                try {
                  Utils.emitEvent(webview.WebDownloadErrorCode.FILE_TOO_LARGE, 70255)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum007": {
                try {
                  Utils.emitEvent(webview.WebDownloadErrorCode.FILE_TRANSIENT_ERROR, 70256)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum008": {
                try {
                  Utils.emitEvent(webview.WebDownloadErrorCode.FILE_BLOCKED, 70257)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum009": {
                try {
                  Utils.emitEvent(webview.WebDownloadErrorCode.FILE_TOO_SHORT, 70258)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum010": {
                try {
                  Utils.emitEvent(webview.WebDownloadErrorCode.FILE_HASH_MISMATCH, 70259)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum011": {
                try {
                  Utils.emitEvent(webview.WebDownloadErrorCode.FILE_SAME_AS_SOURCE, 70260)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum012": {
                try {
                  Utils.emitEvent(webview.WebDownloadErrorCode.NETWORK_FAILED, 70261)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum013": {
                try {
                  Utils.emitEvent(webview.WebDownloadErrorCode.NETWORK_TIMEOUT, 70262)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum014": {
                try {
                  Utils.emitEvent(webview.WebDownloadErrorCode.NETWORK_DISCONNECTED, 70263)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum015": {
                try {
                  Utils.emitEvent(webview.WebDownloadErrorCode.NETWORK_SERVER_DOWN, 70264)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum016": {
                try {
                  Utils.emitEvent(webview.WebDownloadErrorCode.NETWORK_INVALID_REQUEST, 70265)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum017": {
                try {
                  Utils.emitEvent(webview.WebDownloadErrorCode.SERVER_FAILED, 70266)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum018": {
                try {
                  Utils.emitEvent(webview.WebDownloadErrorCode.SERVER_NO_RANGE, 70267)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum019": {
                try {
                  Utils.emitEvent(webview.WebDownloadErrorCode.SERVER_BAD_CONTENT, 70268)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum020": {
                try {
                  Utils.emitEvent(webview.WebDownloadErrorCode.SERVER_UNAUTHORIZED, 70269)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum021": {
                try {
                  Utils.emitEvent(webview.WebDownloadErrorCode.SERVER_CERT_PROBLEM, 70270)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum022": {
                try {
                  Utils.emitEvent(webview.WebDownloadErrorCode.SERVER_FORBIDDEN, 70271)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum023": {
                try {
                  Utils.emitEvent(webview.WebDownloadErrorCode.SERVER_UNREACHABLE, 70272)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum024": {
                try {
                  Utils.emitEvent(webview.WebDownloadErrorCode.SERVER_CONTENT_LENGTH_MISMATCH, 70273)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum025": {
                try {
                  Utils.emitEvent(webview.WebDownloadErrorCode.SERVER_CROSS_ORIGIN_REDIRECT, 70274)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum026": {
                try {
                  Utils.emitEvent(webview.WebDownloadErrorCode.USER_CANCELED, 70275)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum027": {
                try {
                  Utils.emitEvent(webview.WebDownloadErrorCode.USER_SHUTDOWN, 70276)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum028": {
                try {
                  Utils.emitEvent(webview.WebDownloadErrorCode.CRASH, 70277)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum029": {
                try {
                  Utils.emitEvent(webview.WebDownloadState.IN_PROGRESS, 70278)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum030": {
                try {
                  Utils.emitEvent(webview.WebDownloadState.COMPLETED, 70279)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum031": {
                try {
                  Utils.emitEvent(webview.WebDownloadState.CANCELED, 70280)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum032": {
                try {
                  Utils.emitEvent(webview.WebDownloadState.INTERRUPTED, 70281)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum033": {
                try {
                  Utils.emitEvent(webview.WebDownloadState.PENDING, 70282)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum034": {
                try {
                  Utils.emitEvent(webview.WebDownloadState.PAUSED, 70283)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebDownloadEnum035": {
                try {
                  Utils.emitEvent(webview.WebDownloadState.UNKNOWN, 70284)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
            case 'emitonSwitchNextPage': {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/webInitTest' })
              console.log('push URL success')
            }
            }
          })

        Web({ src: 'resource://rawfile/index.html', controller: this.controller })
          .javaScriptAccess(true)
      }
    }
  }
}
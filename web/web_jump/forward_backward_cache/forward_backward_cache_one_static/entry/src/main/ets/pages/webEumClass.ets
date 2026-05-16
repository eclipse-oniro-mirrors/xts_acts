/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { Entry, Text,Column, Component, Button, ClickEvent, Web, Row, Stack,ThreatType ,WebNavigationType,ViewportFit,CredentialType,PinVerifyResult,PdfLoadResult,ProtectedResourceType} from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State} from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import emitter from '@ohos.events.emitter';
import { Callback, RecordData, BusinessError } from '@ohos.base'
import web_webview from '@ohos.web.webview';
import webview from '@ohos.web.webview';
import { UIContext, Router } from '@ohos.arkui.UIContext'

export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct Second {
  stringObj: StringFields  = new StringFields ();
  @State outputStr: string = '';
  webviewCtl: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State str: string = 'emitonDownloadFailed';

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
    Column() {
      Row() {
        Button('web click').key('web').onClick((e: ClickEvent) => {
          console.info('key==>' + this.stringObj.str)
          switch (this.stringObj.str) {
            case 'testWebSecurityLevel0001': {
              try {
                Utils.emitEvent(webview.SecurityLevel.NONE, 1)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testWebSecurityLevel0002': {
              try {
                Utils.emitEvent(webview.SecurityLevel.SECURE, 2)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testWebSecurityLevel0003': {
              try {
                Utils.emitEvent(webview.SecurityLevel.WARNING, 3)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testWebSecurityLevel0004': {
              try {
                Utils.emitEvent(webview.SecurityLevel.DANGEROUS, 4)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'testWebNavigationType0001': {
              try {
                Utils.emitEvent(WebNavigationType.UNKNOWN, 5)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testWebNavigationType0002': {
              try {
                Utils.emitEvent(WebNavigationType.MAIN_FRAME_NEW_ENTRY, 6)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testWebNavigationType0003': {
              try {
                Utils.emitEvent(WebNavigationType.MAIN_FRAME_EXISTING_ENTRY, 7)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testWebNavigationType0004': {
              try {
                Utils.emitEvent(WebNavigationType.NAVIGATION_TYPE_NEW_SUBFRAME, 8)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testWebNavigationType0005': {
              try {
                Utils.emitEvent(WebNavigationType.NAVIGATION_TYPE_AUTO_SUBFRAME, 9)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testWebThreatType0001': {
              try {
                Utils.emitEvent(ThreatType.THREAT_ILLEGAL, 101)

              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testWebThreatType0002': {
              try {
                Utils.emitEvent(ThreatType.THREAT_FRAUD, 11)

              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testWebThreatType0003': {
              try {
                Utils.emitEvent(ThreatType.THREAT_RISK, 12)

              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testWebThreatType0004': {
              try {
                Utils.emitEvent(ThreatType.THREAT_WARNING, 13)

              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testWebThreatType0005': {
              try {
                Utils.emitEvent(ThreatType.THREAT_NONE, 14)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testWebThreatType0006': {
              try {
                Utils.emitEvent(ThreatType.THREAT_UNPROCESSED, 15)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'testViewportFit0001': {
              try {
                Utils.emitEvent(ViewportFit.AUTO, 16)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'testViewportFit0002': {
              try {
                Utils.emitEvent(ViewportFit.COVER, 17)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'testViewportFit0003': {
              try {
                Utils.emitEvent(ViewportFit.CONTAINS, 18)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testPdfLoadResult0001': {
              try {
                Utils.emitEvent(PdfLoadResult.LOAD_SUCCESS, 19)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testPdfLoadResult0002': {
              try {
                Utils.emitEvent(PdfLoadResult.PARSE_ERROR_FILE, 20)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testPdfLoadResult0003': {
              try {
                Utils.emitEvent(PdfLoadResult.PARSE_ERROR_FORMAT, 21)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testPdfLoadResult0004': {
              try {
                Utils.emitEvent(PdfLoadResult.PARSE_ERROR_PASSWORD, 22)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testPdfLoadResult0005': {
              try {
                Utils.emitEvent(PdfLoadResult.PARSE_ERROR_HANDLER, 23)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testPinVerifyResult0001': {
              try {
                Utils.emitEvent(PinVerifyResult.PIN_VERIFICATION_SUCCESS, 24)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testPinVerifyResult0002': {
              try {
                Utils.emitEvent(PinVerifyResult.PIN_VERIFICATION_FAILED, 25)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testCredentialType0001': {
              try {
                Utils.emitEvent(CredentialType.CREDENTIAL_USER, 26)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testCredentialType0002': {
              try {
                Utils.emitEvent(CredentialType.CREDENTIAL_APP, 27)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testCredentialType0003': {
              try {
                Utils.emitEvent(CredentialType.CREDENTIAL_UKEY, 28)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testProtectedResourceType': {
              try {
                Utils.emitEvent(ProtectedResourceType.MIDI_SYSEX, 29)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'emitonSwitchNextPage': {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/webViewRotateRenderEffect' })
              console.log('push URL success')
            }
          }
        })
      }

      Stack() {
        Web({ src: 'www.baidu.com', controller: this.webviewCtl })
      }
    }
  }
}
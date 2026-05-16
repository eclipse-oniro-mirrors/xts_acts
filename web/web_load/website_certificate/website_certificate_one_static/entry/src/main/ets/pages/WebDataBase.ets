/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import Utils from '../../src/test/Util.test';
import web_webview from '@ohos.web.webview';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';
import { Entry, Component, Column, Row, Button, ClickEvent, Web, WebResourceResponse } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { Callback, BusinessError, RecordData } from '@ohos.base'
import { UIContext, Router } from '@ohos.arkui.UIContext'

export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct WebDataBase {
  stringObj: StringFields  = new StringFields ();
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State str: string = 'testDeleteHttpAuthCredentials001'
  @State username_password: string = '';
  @State host: string = 'www.baidu.com';
  @State realm: string = 'example';

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
        Button('WebDataBase click').key('WebDataBaseButton').onClick((e: ClickEvent) => {
          console.info('key==>' + this.stringObj.str)
          switch (this.stringObj.str) {
            case 'testSaveHttpAuthCredentials001': {
              try {
               web_webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, 'StrOmgGol', 'LaRoChe');
               Utils.emitEvent(true, 30040)
              } catch (error) {
               console.info('key==>error' )
              }
              break;
            }

            case 'testSaveHttpAuthCredentials002': {
              try {
                web_webview.WebDataBase.saveHttpAuthCredentials("", this.realm, 'StrOmgGol', 'LaRoChe');
                Utils.emitEvent(true, 30040312)
              } catch (e) {
                e = e as BusinessError;
                console.error('==>' + JSON.stringify(e))
                Utils.emitEvent(e.code, 3004512)
              }
              break;
            }

            case 'testSaveHttpAuthCredentials003': {
              try {
                web_webview.WebDataBase.saveHttpAuthCredentials(this.host, "", 'StrOmgGol', 'LaRoChe');
                Utils.emitEvent(true, 30040313)
              } catch (e) {
                e = e as BusinessError;
                console.error('==>' + JSON.stringify(e))
                Utils.emitEvent(e.code, 30040313)
              }
              break;
            }

            case 'testSaveHttpAuthCredentials004': {
              try {
                web_webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, '', 'LaRoChe');
                Utils.emitEvent(true, 30040314)
              } catch (e) {
                e = e as BusinessError;
                console.error('==>' + JSON.stringify(e))
                Utils.emitEvent(e.code, 30040314)
              }
              break;
            }

            case 'testSaveHttpAuthCredentials005': {
              try {
                web_webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, 'StrOmgGol', '');
                Utils.emitEvent(true, 30040315)
              } catch (e) {
                e = e as BusinessError;
                console.error('==>' + JSON.stringify(e))
                Utils.emitEvent(e.code, 30040315)
              }
              break;
            }


            case 'testGetHttpAuthCredentials001': {
              try {
                web_webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, 'StrOmgGol', 'LaRoChe');
                let arr: string[] = web_webview.WebDataBase.getHttpAuthCredentials(this.host, this.realm)
                setTimeout(() => {
                  if (arr) {
                    this.username_password = arr[0]
                    Utils.emitEvent(this.username_password, 30045)
                  } else {
                    Utils.emitEvent(false, 30045)
                  }
                }, 2000)
              } catch (e) {
                e = e as BusinessError;
                console.error('==>' + JSON.stringify(e))
                Utils.emitEvent(e.code, 30045)
              }
              break;
            }

            case 'testGetHttpAuthCredentials002': {
              try {
                web_webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, '', '');
                let arr: string[] = web_webview.WebDataBase.getHttpAuthCredentials(this.host, this.realm)
                setTimeout(() => {
                  if (arr) {
                    this.username_password = arr[0]
                    Utils.emitEvent(this.username_password, 3004511)
                  } else {
                    Utils.emitEvent(false, 3004511)
                  }
                }, 2000)
              } catch (e) {
                e = e as BusinessError;
                console.error('==>' + JSON.stringify(e))
                Utils.emitEvent(e.code, 3004511)
              }
              break;
            }

            case 'testGetHttpAuthCredentials003': {
              try {
                web_webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, 'StrOmgGol', 'LaRoChe');
                let arr: string[] = web_webview.WebDataBase.getHttpAuthCredentials("", this.realm)
                setTimeout(() => {
                  if (arr) {
                    this.username_password = arr[0]
                    Utils.emitEvent(this.username_password, 3004512)
                  } else {
                    Utils.emitEvent(false, 3004512)
                  }
                }, 2000)
              } catch (e) {
                e = e as BusinessError;
                console.error('==>' + JSON.stringify(e))
                Utils.emitEvent(e.code, 3004512)
              }
              break;
            }

            case 'testExistHttpAuthCredentials001': {
              try {
                let result = web_webview.WebDataBase.existHttpAuthCredentials();
                setTimeout(() => {
                  Utils.emitEvent(result, 30046)
                }, 2000)
              } catch (e) {
                e = e as BusinessError;
                console.info('==>' + JSON.stringify(e))
                Utils.emitEvent(e.code, 30046)
              }
              break;
            }

            case 'testExistHttpAuthCredentials002': {
              try {
                web_webview.WebDataBase.deleteHttpAuthCredentials();
                setTimeout(() => {
                  let result = web_webview.WebDataBase.existHttpAuthCredentials();
                  setTimeout(() => {
                    Utils.emitEvent(result, 300463116)
                  }, 2000)
                }, 1000)
              } catch (e) {
                e = e as BusinessError;
                console.info('==>' + JSON.stringify(e))
                Utils.emitEvent(e.code, 300463116)
              }
              break;
            }

            case 'testDeleteHttpAuthCredentials001': {
              try {
                web_webview.WebDataBase.deleteHttpAuthCredentials();
                setTimeout(() => {
                  let result = web_webview.WebDataBase.existHttpAuthCredentials();
                  setTimeout(() => {
                    Utils.emitEvent(result, 30050)
                  }, 2000)
                }, 2000)
              } catch (e) {
                e = e as BusinessError;
                console.info('==>' + JSON.stringify(e))
                Utils.emitEvent(e.code, 30050)
              }
              break;
            }

            case 'testSaveHttpAuthCredentialsEmpty001': {
              try {
                web_webview.WebDataBase.saveHttpAuthCredentials("", "", "", "");
              } catch (e) {
                e = e as BusinessError;
                console.error('==>' + JSON.stringify(e))
                Utils.emitEvent(e.code, 300401)
              }
              break;
            }

            case 'testGetHttpAuthCredentialsEmpty001': {
              try {
                web_webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, 'StrOmgGol', 'LaRoChe');
                let arr: string[] = web_webview.WebDataBase.getHttpAuthCredentials("", "")
                setTimeout(() => {
                  if (arr) {
                    this.username_password = arr[0]
                    Utils.emitEvent(this.username_password, 300451)
                  } else {
                    Utils.emitEvent(false, 300451)
                  }
                }, 2000)
              } catch (e) {
                e = e as BusinessError;
                console.error('==>' + JSON.stringify(e))
                Utils.emitEvent(e.code, 300451)
              }
              break;
            }

            case 'emitonSwitchNextPage1': {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/onSslErrorEvent' })
              break;
            }

          }
        })
      }

      Web({ src: 'www.baidu.com', controller: this.controller })
    }
  }
}

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

import webview from '@ohos.web.webview'
import { State } from '@ohos.arkui.stateManagement'
import { Button, ClickEvent, Column, Component, Entry, Row, Text, Web, } from '@ohos.arkui.component'
import events_emitter from '@ohos.events.emitter'
import { BusinessError, Callback, RecordData } from '@ohos.base'
import { Hypium } from '../../../hypium/index';
import Utils from '../../src/test/Utils.test';
import { UIContext, Router } from '@ohos.arkui.UIContext'
export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct webViewController {
  stringObj: StringFields = new StringFields();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  controllerOne: webview.WebviewController = new webview.WebviewController(undefined);
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
    Column() {
      Row() {
        Button("web click").key('webcomponent').onClick((e: ClickEvent) => {
          console.info("key==>" + this.stringObj.str)
          switch (this.stringObj.str) {
            case "emitStoreWebArchive": {
              try {
                this.controller.storeWebArchive("/data/storage/el2/base/", true, (error, filename) => {
                  if (error) {
                    console.info(`save web archive error: ` + JSON.stringify(error));
                    return;
                  }
                  if (filename && filename.includes('/data/storage/el2/base')) {
                    Utils.emitEvent(true, 29);
                  }
                });
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitStoreWebArchive02": {
              try {
                this.controller.storeWebArchive("", true, (error, filename) => {
                  if (error) {
                    console.info(`save web archive error: ` + JSON.stringify(error));
                    Utils.emitEvent(false, 202603183);
                    return;
                  }
                  if (filename && filename.includes('/data/storage/el2/base')) {
                    Utils.emitEvent(true, 202603183);
                  }
                  Utils.emitEvent(false, 202603183);
                });
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitStoreWebArchive03": {
              try {
                this.controller.storeWebArchive("/data/storage/el2/base/", false, (error, filename) => {
                  if (error) {
                    console.info(`save web archive error: ` + JSON.stringify(error));
                    Utils.emitEvent(false, 202603184);
                    return;
                  }
                  if (filename && filename.includes('/data/storage/el2/base')) {
                    Utils.emitEvent(true, 202603184);
                  }
                  Utils.emitEvent(false, 202603184);
                });
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'emitonSwitchNextPage': {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/webViewControllerPart2' })
              console.log('push URL success')
            }
          }
        })
      }

      Web({ src: "www.example.com", controller: this.controller })
    }
  }
}

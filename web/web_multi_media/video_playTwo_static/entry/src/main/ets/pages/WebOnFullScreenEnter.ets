/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { Entry, Component, Column, Row, Button, ClickEvent, Web,FullScreenExitHandler} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import webView from '@ohos.web.webview'
import { BusinessError } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import emitter from '@ohos.events.emitter';
import { Callback, RecordData} from '@ohos.base'
import { UIContext, Router } from '@ohos.arkui.UIContext'
import inspector from '@ohos.arkui.inspector';
class StringFields {
  public str: string = '';
}

@Entry
@Component
struct WebOnFullScreenEnter {
  stringObj: StringFields  = new StringFields ();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  handler?: FullScreenExitHandler
  @State str: string = '';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State onFullScreenEnterCalled: boolean = false;
  @State checkEleResult: string = '';

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
        Button('web click').key('OnFullScreenEnterTestButton').onClick( (e:ClickEvent) => {
          this.stringObj.str = 'emitOnFullScreenEnter'
          console.info('key==>' +  this.stringObj.str)
          switch (this.stringObj.str) {
            case 'emitOnFullScreenEnter': {
              try {
                inspector.sendEventByKey('OnFullScreenEnterTestWeb', 10, '');

                setTimeout(() => {
                  inspector.sendEventByKey('OnFullScreenEnterTestWeb', 10, '');
                }, 2000)

                setTimeout(() => {
                this.controller.runJavaScript('checkIsFullScreen()', (error, result) => {
                  if (error) {
                    console.log(`The checkIsFullScreen() return error is: ${error}`);
                  }
                  this.checkEleResult = JSON.stringify(result)
                  console.log(`The checkIsFullScreen() return value is: ${result}`);
                  Utils.emitEvent(this.onFullScreenEnterCalled , 442)
                })
                }, 4000)

              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }

              break;
            }


          }
        })
      }

      Web({ src: 'resource://rawfile/webFullScreenTest.html', controller: this.controller })
        .key('OnFullScreenEnterTestWeb')
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .onFullScreenEnter((event) => {
          console.log('onFullScreenEnter...')
          this.handler = event.handler
          console.log('this.handler: ' + JSON.stringify(this.handler))
          this.onFullScreenEnterCalled = true
        })
    }
  }
}

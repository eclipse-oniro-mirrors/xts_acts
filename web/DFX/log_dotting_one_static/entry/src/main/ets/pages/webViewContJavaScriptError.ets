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

import { Entry, Row, Text, TextAttribute, Column, Component, Button, ClickEvent, Web } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import Utils from '../../src/test/Utils.test';
import events_emitter from '@ohos.events.emitter';
import emitter from '@ohos.events.emitter';
import { Callback, RecordData } from '@ohos.base'
import { Hypium } from '../../../hypium';
import testsuite from '../../src/test/List.test';
import { BusinessError } from '@ohos.base';
import web_webview from '@ohos.web.webview';

class StringFields {
  public str: string = '';
}

@Entry
@Component
struct clearPrefetchedResourceTest {
  stringObj: StringFields  = new StringFields ();
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  controllerTwo: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State webResult: string = '';


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
        Button('javaScriptErrorTest').key('webViewContJavaScriptError').onClick( (e:ClickEvent) => {
          console.info('key==>' + this.stringObj.str)
          switch (this.stringObj.str) {

            case 'emitRunJavaScriptCallbackInitErr': {
              try {
                this.controllerTwo.runJavaScript(
                  'test()',
                  (error, result) => {
                    if (error) {
                      console.info(`run JavaScript error: ` + JSON.stringify(error));
                      return;
                    }
                    if (result) {
                      this.webResult = result;
                      console.info('The test() return value is: result');
                    }
                  });
              } catch (error) {
                error = error as BusinessError;
                console.error(`emitRunJavaScriptCallbackInitErr ErrorCode: ${error.code}`);
                Utils.emitEvent(error.code, 652)
              }

              break;
            }

            case 'emitRunJavaScriptPromiseInitErr': {
              try {
                this.controllerTwo.runJavaScript('test()')
                  .then((result) => {
                    console.log('result: ' + result);
                  })
                  .catch((error) => {
                    console.error('error: ' + error);
                  })
              } catch (error) {
                error = error as BusinessError;
                console.error(`emitRunJavaScriptPromiseInitErr ErrorCode: ${error.code}`);
                Utils.emitEvent(error.code, 654)
              }

              break;
            }

            case 'emitRunJavaScriptExtCallbackInitErr': {
              try {
                this.controllerTwo.runJavaScriptExt(
                  'test()',
                  (error, result) => {
                    if (error) {
                      console.info(`run JavaScript error: ` + JSON.stringify(error));
                      return;
                    }
                    if (result) {
                      console.info(`The test() return value is: ${result}`);
                    }
                  });
              } catch (error) {
                error = error as BusinessError;
                console.error(`emitRunJavaScriptExtCallbackInitErr ErrorCode: ${error.code}`);
                Utils.emitEvent(error.code, 656)
              }


              break;
            }

            case 'emitRunJavaScriptExtPromiseInitErr': {
              try {
                this.controllerTwo.runJavaScriptExt('test()')
                  .then((result) => {
                    console.log('result: ' + result);
                  })
                  .catch((error) => {
                    console.error('error: ' + error);
                  })
              } catch (error) {
                error = error as BusinessError;
                console.error(`emitRunJavaScriptExtPromiseInitErr ErrorCode: ${error.code}`);
                Utils.emitEvent(error.code, 658)
              }

              break;
            }

          }
        })
      }

      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)

    }
  }
}
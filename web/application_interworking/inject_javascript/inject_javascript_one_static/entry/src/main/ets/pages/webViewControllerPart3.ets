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
import webview from '@ohos.web.webview';
import { FullScreenExitHandler,$rawfile,JavaScriptProxy,OnRenderExitedEvent, OnPageBeginEvent, RenderProcessNotRespondingReason, RenderProcessNotRespondingData, Entry, Component, Column, Row, Button, ClickEvent, Web } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import Utils from '../../src/test/Util.test';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'
import image from '@ohos.multimedia.image';
import web_webview from '@ohos.web.webview';
import { BusinessError, RecordData } from '@ohos.base';
export class TestObj {
  constructor() {
  }
  testString(test: string): string {
    console.info(`runJavaScript result 1:` + test)
    return test;
  }
  asyncTestString(test: string): string {
    console.info(`runJavaScript result 2:` + test)
    return test;
  }
}
export class StringFields {
  public str: string = '';
}
@Entry
@Component
struct WebViewControllerPart3 {
  stringObj: StringFields  = new StringFields ();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  controllerNew: webview.WebviewController = new webview.WebviewController(undefined);
  @State testObj: TestObj = new TestObj();
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
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
        Button('WebViewController click')
          .key('WebViewControllerTestButton')
          .onClick( (e:ClickEvent) => {
            console.info('key==>' + this.stringObj.str)
            switch (this.stringObj.str) {
              case 'javaScriptProxyTest001': {
                try {
                  this.controller.loadUrl('resource://rawfile/JavaScriptProxyPage.html');
                  setTimeout(() => {
                    this.controller.runJavaScript(
                      'testStringJS()',
                      (error, result) => {
                        setTimeout(() => {
                          if (error) {
                            let e: BusinessError = error as BusinessError;
                            console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                            Utils.emitEvent(e.code, 20260313)
                          }
                          console.info(`runJavaScript result 001:` + result)
                          if (result) {
                            Utils.emitEvent(result, 20260313)
                          }
                        }, 2000)
                      });
                  }, 2000)
                } catch (error) {
                  error = error as BusinessError;
                  let e: BusinessError = error as BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.code, 20260313)
                }
                break;
              }
              case 'javaScriptProxyTest002': {
                try {
                  this.controller.loadUrl('resource://rawfile/JavaScriptProxyPage.html');
                  setTimeout(() => {
                    this.controller.runJavaScript(
                      'asyncTestStringJS()',
                      (error, result) => {
                        setTimeout(() => {
                          if (error) {
                            let e: BusinessError = error as BusinessError;
                            console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                            Utils.emitEvent(e.code, 20260314)
                          }
                          console.info(`runJavaScript result 002:` + result)
                          if (result) {
                            Utils.emitEvent(result, 20260314)
                          }
                        }, 2000)
                      });
                  }, 2000)
                } catch (error) {
                  error = error as BusinessError;
                  let e: BusinessError = error as BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.code, 20260314)
                }
                break;
              }
              case 'javaScriptProxyTest003': {
                try {
                  this.controllerNew.loadUrl('resource://rawfile/JavaScriptProxyPage_1.html');
                  setTimeout(() => {
                    this.controllerNew.runJavaScript(
                      'testStringJS()',
                      (error, result) => {
                        setTimeout(() => {
                          if (error) {
                            let e: BusinessError = error as BusinessError;
                            console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                            Utils.emitEvent(e.code, 20260315)
                          }
                          console.info(`runJavaScript result 003:` + result)
                          if (result) {
                            Utils.emitEvent(result, 20260315)
                          }
                        }, 2000)
                      });
                  }, 2000)
                } catch (error) {
                  error = error as BusinessError;
                  let e: BusinessError = error as BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.code, 20260315)
                }
              }
            }
          })
      }

      Web({ src: 'resource://rawfile/JavaScriptProxyPage.html', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .metaViewport(false)
        .javaScriptProxy({
          jsObject: this.testObj,
          name: 'objName',
          methodList: ['testString'],
          asyncMethodList: ['asyncTestString'],
          controller: this.controller,
          permission: '{"javascriptProxyPermission":{"urlPermissionList":[{"scheme":"resource","host":"rawfile","port":"","path":""},' +
            '{"scheme":"e","host":"f","port":"g","path":"h"}],"methodList":[{"methodName":"test","urlPermissionList":' +
            '[{"scheme":"https","host":"xxx.com","port":"","path":""},{"scheme":"resource","host":"rawfile","port":"","path":""}]},' +
            '{"methodName":"test11","urlPermissionList":[{"scheme":"q","host":"r","port":"","path":"t"},' +
            '{"scheme":"u","host":"v","port":"","path":""}]}]}}'
        } as JavaScriptProxy)
      Web({ src: 'resource://rawfile/JavaScriptProxyPage_1.html', controller: this.controllerNew })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .metaViewport(false)
        .javaScriptProxy({
          jsObject: this.testObj,
          name: 'objName',
          methodList: ['testString'],
          controller: this.controllerNew
        } as JavaScriptProxy)
    }
  }
}

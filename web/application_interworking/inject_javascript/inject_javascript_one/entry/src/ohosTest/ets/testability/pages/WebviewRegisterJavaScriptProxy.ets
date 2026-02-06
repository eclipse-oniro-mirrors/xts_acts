/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@kit.BasicServicesKit';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils';
import {waitForAssert, waitForExist} from '../../test/WaitTest.test';

class TestClass {
  constructor(){
  }

  test(): string{
    return 'ArkUI Web Component';
  }

  toString(): void{
    console.log('Web Component toString');
  }
}

@Entry
@Component
struct Index {
  @State webviewController: webview.WebviewController = new webview.WebviewController();
  @State testObj: TestClass = new TestClass();
  @State str: string = 'SchemeMissed';
  @State permission: string =
    '{ "javascriptProxyPermission": { "urlPermissionList": [ { "scheme": "e","host": "f", "port": "", "path": "" } ], "methodList": [ { "methodName": "test", "urlPermissionList": [] } ] } }';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;


  onPageShow(){
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 172460,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(172460)
  }


  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  InitJavaScriptProxyTest(permission: string){
    if (permission != '') {
      this.permission = permission
      try {
        this.webviewController.registerJavaScriptProxy(this.testObj, 'testObjName', ['test', 'toString'],
          [],
          this.permission
        );
        this.webviewController.refresh();
        console.log('InitJavaScriptProxyTest SUCCESS')
      } catch (error) {
        console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
      }
    } else {
      console.log('permission没有值')
    }
  }

  build(){
    Column() {
      Row() {
        Button('0013')
          .onClick(async (event: ClickEvent) => {
            await waitForExist(() => this.isPageEnd, this.str, 0);
            await waitForExist(() => this.isReceive, this.str, 0);
            this.isReceive = -1;
            console.info('key==>' + this.str)
            this.isPageEnd = -1;
            this.InitJavaScriptProxyTest('{ "javascriptProxyPermission": { "urlPermissionList": [ { "scheme": "e","host": "f", "port": "", "path": "" } ], "methodList": [ { "methodName": "test", "urlPermissionList": [] } ] } }')
            await waitForExist(() => this.isPageEnd, this.str, 0);
              this.webviewController.runJavaScript(
                'callArkTS()',
                (error, result) => {
                  if (error) {
                    console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    Utils.emitEvent(result, 172470)
                  }
                }
              )
          })
          .key('testWebView_registerJavaScriptProxy_0013')

        Button('0014')
          .onClick(async (event: ClickEvent) => {
            await waitForExist(() => this.isPageEnd, this.str, 0);
            await waitForExist(() => this.isReceive, this.str, 0);
            this.isReceive = -1;
            console.info('key==>' + this.str)
            this.isPageEnd = -1;
            this.InitJavaScriptProxyTest('{ "javascriptProxyPermission": { "urlPermissionList": [{ "scheme": "e","host": "f", "port": "", "path": ""}, { "scheme": "j","host": "f", "port": "", "path": ""}], "methodList": [{ "methodName": "test", "urlPermissionList": [] }] } }')
            await waitForExist(() => this.isPageEnd, this.str, 0);
              this.webviewController.runJavaScript(
                'callArkTS()',
                (error, result) => {
                  if (error) {
                    console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    Utils.emitEvent(result, 172480)
                  }
                }
              )
          })
          .key('testWebView_registerJavaScriptProxy_0014')
      }

      Row() {
        Button('0015')
          .onClick(async (event: ClickEvent) => {
            await waitForExist(() => this.isPageEnd, this.str, 0);
            await waitForExist(() => this.isReceive, this.str, 0);
            this.isReceive = -1;
            console.info('key==>' + this.str)
            this.isPageEnd = -1;
            this.InitJavaScriptProxyTest('{ "javascriptProxyPermission": { "urlPermissionList": [ { "scheme": "resource", "host": "X&X","port": "", "path": "" } ], "methodList": [ { "methodName": "test", "urlPermissionList": [] } ] } }')
            await waitForExist(() => this.isPageEnd, this.str, 0);
              this.webviewController.runJavaScript(
                'callArkTS()',
                (error, result) => {
                  if (error) {
                    console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    Utils.emitEvent(result, 172490)
                  }
                }
              )
          })
          .key('testWebView_registerJavaScriptProxy_0015')

        Button('0016')
          .onClick(async (event: ClickEvent) => {
            await waitForExist(() => this.isPageEnd, this.str, 0);
            await waitForExist(() => this.isReceive, this.str, 0);
            this.isReceive = -1;
            console.info('key==>' + this.str)
            this.isPageEnd = -1;
            this.InitJavaScriptProxyTest('{ "javascriptProxyPermission": { "urlPermissionList": [ { "scheme": "resource", "host": "rawfile","port":"X&X","path": ""} ], "methodList": [ { "methodName": "test", "urlPermissionList": [] } ] } }')
            await waitForExist(() => this.isPageEnd, this.str, 0);
              this.webviewController.runJavaScript(
                'callArkTS()',
                (error, result) => {
                  if (error) {
                    console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    Utils.emitEvent(result, 172500)
                  }
                }
              )
          })
          .key('testWebView_registerJavaScriptProxy_0016')
      }

      Row() {
        Button('0017')
          .onClick(async (event: ClickEvent) => {
            await waitForExist(() => this.isPageEnd, this.str, 0);
            await waitForExist(() => this.isReceive, this.str, 0);
            this.isReceive = -1;
            console.info('key==>' + this.str)
            this.isPageEnd = -1;
            this.InitJavaScriptProxyTest('{ "javascriptProxyPermission": { "urlPermissionList": [ { "scheme": "resource", "host": "rawfile", "port": "", "path": ""} ], "methodList": [ { "methodName": "test", "urlPermissionList": [] } ] } }')
            await waitForExist(() => this.isPageEnd, this.str, 0);
              this.webviewController.runJavaScript(
                'callArkTS()',
                (error, result) => {
                  if (error) {
                    console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    Utils.emitEvent(result, 172510)
                  }
                }
              )
          })
          .key('testWebView_registerJavaScriptProxy_0017')

        Button('0018')
          .onClick(async (event: ClickEvent) => {
            await waitForExist(() => this.isPageEnd, this.str, 0);
            await waitForExist(() => this.isReceive, this.str, 0);
            this.isReceive = -1;
            console.info('key==>' + this.str)
            this.isPageEnd = -1;
            this.InitJavaScriptProxyTest('{ "javascriptProxyPermission": { "urlPermissionList": [ { "scheme": "resource", "host": "rawfile", "port": "X&X", "path": ""} ], "methodList": [ { "methodName": "test", "urlPermissionList": [] } ] } }')
            await waitForExist(() => this.isPageEnd, this.str, 0);
              this.webviewController.runJavaScript(
                'callArkTS()',
                (error, result) => {
                  if (error) {
                    console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    Utils.emitEvent(result, 172520)
                  }
                }
              )
          })
          .key('testWebView_registerJavaScriptProxy_0018')
      }

      Row() {
        Button('0019')
          .onClick(async (event: ClickEvent) => {
            await waitForExist(() => this.isPageEnd, this.str, 0);
            await waitForExist(() => this.isReceive, this.str, 0);
            this.isReceive = -1;
            console.info('key==>' + this.str)
            this.isPageEnd = -1;
            this.InitJavaScriptProxyTest('{ "javascriptProxyPermission": { "urlPermissionList": [ { "scheme": "resource", "host": "rawfile", "port": "", "path": ""} ], "methodList": [ { "methodName": "test", "urlPermissionList": [] } ] } }')
            await waitForExist(() => this.isPageEnd, this.str, 0);
              this.webviewController.runJavaScript(
                'callArkTS()',
                (error, result) => {
                  if (error) {
                    console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    Utils.emitEvent(result, 172530)
                  }
                }
              )
          })
          .key('testWebView_registerJavaScriptProxy_0019')

        Button('0020')
          .onClick(async (event: ClickEvent) => {
            await waitForExist(() => this.isPageEnd, this.str, 0);
            await waitForExist(() => this.isReceive, this.str, 0);
            this.isReceive = -1;
            console.info('key==>' + this.str)
            this.isPageEnd = -1;
            this.InitJavaScriptProxyTest('{ "javascriptProxyPermission": { "urlPermissionList": [ { "scheme": "resource", "host": "rawfile", "port": "", "path": "X&X"} ], "methodList": [ { "methodName": "test", "urlPermissionList": [] } ] } }')
            await waitForExist(() => this.isPageEnd, this.str, 0);
              this.webviewController.runJavaScript(
                'callArkTS()',
                (error, result) => {
                  if (error) {
                    console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    Utils.emitEvent(result, 172540)
                  }
                }
              )
          })
          .key('testWebView_registerJavaScriptProxy_0020')

        Button('0021')
          .onClick(async (event: ClickEvent) => {
            await waitForExist(() => this.isPageEnd, this.str, 0);
            await waitForExist(() => this.isReceive, this.str, 0);
            this.isReceive = -1;
            console.info('key==>' + this.str)
            this.isPageEnd = -1;
            this.InitJavaScriptProxyTest('{ "javascriptProxyPermission": { "urlPermissionList": [ { "scheme": "resource", "host": "rawfile", "port": "", "path": ""} ], "methodList": [ { "methodName": "test", "urlPermissionList": [] } ] } }')
            await waitForExist(() => this.isPageEnd, this.str, 0);
              this.webviewController.runJavaScript(
                'callArkTS()',
                (error, result) => {
                  if (error) {
                    console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    Utils.emitEvent(result, 172550)
                  }
                }
              )
          })
          .key('testWebView_registerJavaScriptProxy_0021')
      }

      Row() {
        Button('0022')
          .onClick(async (event: ClickEvent) => {
            await waitForExist(() => this.isPageEnd, this.str, 0);
            await waitForExist(() => this.isReceive, this.str, 0);
            this.isReceive = -1;
            console.info('key==>' + this.str)
            this.isPageEnd = -1;
            this.InitJavaScriptProxyTest('{ "javascriptProxyPermission": { "urlPermissionList": [ { "scheme": "resource", "host": "rawfile", "port": "", "path": ""} ], "methodList": [ { "methodName": "test", "urlPermissionList": [{ "scheme": "X&X", "host": "X&X", "port": "X&X", "path": "X&X" }] } ] } }')
            await waitForExist(() => this.isPageEnd, this.str, 0);
              this.webviewController.runJavaScript(
                'callArkTS()',
                (error, result) => {
                  if (error) {
                    console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    Utils.emitEvent(result, 172560)
                  }
                }
              )
          })
          .key('testWebView_registerJavaScriptProxy_0022')

        Button('0023')
          .onClick(async (event: ClickEvent) => {
            await waitForExist(() => this.isPageEnd, this.str, 0);
            await waitForExist(() => this.isReceive, this.str, 0);
            this.isReceive = -1;
            console.info('key==>' + this.str)
            this.isPageEnd = -1;
            this.InitJavaScriptProxyTest('{ "javascriptProxyPermission": { "urlPermissionList": [{ "scheme": "X&X", "host": "X&X", "port": "", "path": "" }], "methodList": [{ "methodName": "test", "urlPermissionList": [{ "scheme": "resource", "host": "rawfile", "port": "", "path": "" }] }] } }')
            await waitForExist(() => this.isPageEnd, this.str, 0);
              this.webviewController.runJavaScript(
                'callArkTS()',
                (error, result) => {
                  if (error) {
                    console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    Utils.emitEvent(result, 172570)
                  }
                }
              )
          })
          .key('testWebView_registerJavaScriptProxy_0023')
      }

      Row() {
        Button('0024')
          .onClick(async (event: ClickEvent) => {
            await waitForExist(() => this.isPageEnd, this.str, 0);
            await waitForExist(() => this.isReceive, this.str, 0);
            this.isReceive = -1;
            console.info('key==>' + this.str)
            this.isPageEnd = -1;
            this.InitJavaScriptProxyTest('{ "javascriptProxyPermission": { "urlPermissionList": [{ "scheme": "resource", "host": "rawfile", "port": "", "path": "" }], "methodList": [{ "methodName": "test", "urlPermissionList": [{ "scheme": "resource", "host": "rawfile", "port": "", "path": "" }] }] } }')
            await waitForExist(() => this.isPageEnd, this.str, 0);
              this.webviewController.runJavaScript(
                'callArkTS()',
                (error, result) => {
                  if (error) {
                    console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    Utils.emitEvent(result, 172580)
                  }
                }
              )
          })
          .key('testWebView_registerJavaScriptProxy_0024')

        Button('0025')
          .onClick(async (event: ClickEvent) => {
            await waitForExist(() => this.isPageEnd, this.str, 0);
            await waitForExist(() => this.isReceive, this.str, 0);
            this.isReceive = -1;
            console.info('key==>' + this.str)
            this.isPageEnd = -1;
            this.InitJavaScriptProxyTest('{ "javascriptProxyPermission": { "urlPermissionList": [{ "scheme": "resource", "host": "rawfile", "port": "", "path": "" }], "methodList": [{ "methodName": "test", "urlPermissionList": [{ "scheme": "resource", "host": "rawfile", "port": "", "path": "" }, { "scheme": "X&X", "host": "X&X", "port": "", "path": "" }] }, { "methodName": "test2", "urlPermissionList": [{ "scheme": "resource", "host": "rawfile", "port": "", "path": "" }, { "scheme": "X&X", "host": "X&X", "port": "", "path": "" }] }] } }')
            await waitForExist(() => this.isPageEnd, this.str, 0);
              this.webviewController.runJavaScript(
                'callArkTS()',
                (error, result) => {
                  if (error) {
                    console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    Utils.emitEvent(result, 172590)
                  }
                }
              )
          })
          .key('testWebView_registerJavaScriptProxy_0025')
      }

      Row() {
        Button('0026')
          .onClick(async (event: ClickEvent) => {
            await waitForExist(() => this.isPageEnd, this.str, 0);
            await waitForExist(() => this.isReceive, this.str, 0);
            this.isReceive = -1;
            console.info('key==>' + this.str)
            this.isPageEnd = -1;
            this.InitJavaScriptProxyTest('{ "javascriptProxyPermission": { "urlPermissionList": [{ "scheme": "resource", "host": "rawfile", "port": "", "path": "" },{ "scheme": "resource", "host": "rawfile", "port": "", "path": "" }], "methodList": [{ "methodName": "test", "urlPermissionList": [] }] } }')
            await waitForExist(() => this.isPageEnd, this.str, 0);
              this.webviewController.runJavaScript(
                'callArkTS()',
                (error, result) => {
                  if (error) {
                    console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    Utils.emitEvent(result, 172600)
                  }
                }
              )
          })
          .key('testWebView_registerJavaScriptProxy_0026')
      }

      Web({ src: $rawfile('index2.html'), controller: this.webviewController })
        .onPageEnd((event) => {
          if (event) {
            this.isPageEnd = 0;
            console.log('WebController onPageEnd url:' + event.url);
          }
        })
    }
  }
}

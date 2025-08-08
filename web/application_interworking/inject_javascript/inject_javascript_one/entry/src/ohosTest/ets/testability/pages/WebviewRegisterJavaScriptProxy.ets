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
          .onClick((event: ClickEvent) => {
            this.InitJavaScriptProxyTest('{ "javascriptProxyPermission": { "urlPermissionList": [ { "scheme": "e","host": "f", "port": "", "path": "" } ], "methodList": [ { "methodName": "test", "urlPermissionList": [] } ] } }')
            setTimeout(() => {
              this.webviewController.runJavaScript(
                'callArkTS()',
                (error, result) => {
                  if (error) {
                    console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    Utils.emitEvent(result, 10058)
                  }
                }
              )
            }, 300)
          })
          .key('testWebView_registerJavaScriptProxy_0013')

        Button('0014')
          .onClick((event: ClickEvent) => {
            this.InitJavaScriptProxyTest('{ "javascriptProxyPermission": { "urlPermissionList": [{ "scheme": "e","host": "f", "port": "", "path": ""}, { "scheme": "j","host": "f", "port": "", "path": ""}], "methodList": [{ "methodName": "test", "urlPermissionList": [] }] } }')
            setTimeout(() => {
              this.webviewController.runJavaScript(
                'callArkTS()',
                (error, result) => {
                  if (error) {
                    console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    Utils.emitEvent(result, 10059)
                  }
                }
              )
            }, 300)
          })
          .key('testWebView_registerJavaScriptProxy_0014')
      }

      Row() {
        Button('0015')
          .onClick((event: ClickEvent) => {
            this.InitJavaScriptProxyTest('{ "javascriptProxyPermission": { "urlPermissionList": [ { "scheme": "resource", "host": "X&X","port": "", "path": "" } ], "methodList": [ { "methodName": "test", "urlPermissionList": [] } ] } }')
            setTimeout(() => {
              this.webviewController.runJavaScript(
                'callArkTS()',
                (error, result) => {
                  if (error) {
                    console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    Utils.emitEvent(result, 10060)
                  }
                }
              )
            }, 300)
          })
          .key('testWebView_registerJavaScriptProxy_0015')

        Button('0016')
          .onClick((event: ClickEvent) => {
            this.InitJavaScriptProxyTest('{ "javascriptProxyPermission": { "urlPermissionList": [ { "scheme": "resource", "host": "rawfile","port":"X&X","path": ""} ], "methodList": [ { "methodName": "test", "urlPermissionList": [] } ] } }')
            setTimeout(() => {
              this.webviewController.runJavaScript(
                'callArkTS()',
                (error, result) => {
                  if (error) {
                    console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    Utils.emitEvent(result, 10061)
                  }
                }
              )
            }, 300)
          })
          .key('testWebView_registerJavaScriptProxy_0016')
      }

      Row() {
        Button('0017')
          .onClick((event: ClickEvent) => {
            this.InitJavaScriptProxyTest('{ "javascriptProxyPermission": { "urlPermissionList": [ { "scheme": "resource", "host": "rawfile", "port": "", "path": ""} ], "methodList": [ { "methodName": "test", "urlPermissionList": [] } ] } }')
            setTimeout(() => {
              this.webviewController.runJavaScript(
                'callArkTS()',
                (error, result) => {
                  if (error) {
                    console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    Utils.emitEvent(result, 10062)
                  }
                }
              )
            }, 300)
          })
          .key('testWebView_registerJavaScriptProxy_0017')

        Button('0018')
          .onClick((event: ClickEvent) => {
            this.InitJavaScriptProxyTest('{ "javascriptProxyPermission": { "urlPermissionList": [ { "scheme": "resource", "host": "rawfile", "port": "X&X", "path": ""} ], "methodList": [ { "methodName": "test", "urlPermissionList": [] } ] } }')
            setTimeout(() => {
              this.webviewController.runJavaScript(
                'callArkTS()',
                (error, result) => {
                  if (error) {
                    console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    Utils.emitEvent(result, 10063)
                  }
                }
              )
            }, 300)
          })
          .key('testWebView_registerJavaScriptProxy_0018')
      }

      Row() {
        Button('0019')
          .onClick((event: ClickEvent) => {
            this.InitJavaScriptProxyTest('{ "javascriptProxyPermission": { "urlPermissionList": [ { "scheme": "resource", "host": "rawfile", "port": "", "path": ""} ], "methodList": [ { "methodName": "test", "urlPermissionList": [] } ] } }')
            setTimeout(() => {
              this.webviewController.runJavaScript(
                'callArkTS()',
                (error, result) => {
                  if (error) {
                    console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    Utils.emitEvent(result, 10064)
                  }
                }
              )
            }, 300)
          })
          .key('testWebView_registerJavaScriptProxy_0019')

        Button('0020')
          .onClick((event: ClickEvent) => {
            this.InitJavaScriptProxyTest('{ "javascriptProxyPermission": { "urlPermissionList": [ { "scheme": "resource", "host": "rawfile", "port": "", "path": "X&X"} ], "methodList": [ { "methodName": "test", "urlPermissionList": [] } ] } }')
            setTimeout(() => {
              this.webviewController.runJavaScript(
                'callArkTS()',
                (error, result) => {
                  if (error) {
                    console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    Utils.emitEvent(result, 10065)
                  }
                }
              )
            }, 300)
          })
          .key('testWebView_registerJavaScriptProxy_0020')

        Button('0021')
          .onClick((event: ClickEvent) => {
            this.InitJavaScriptProxyTest('{ "javascriptProxyPermission": { "urlPermissionList": [ { "scheme": "resource", "host": "rawfile", "port": "", "path": ""} ], "methodList": [ { "methodName": "test", "urlPermissionList": [] } ] } }')
            setTimeout(() => {
              this.webviewController.runJavaScript(
                'callArkTS()',
                (error, result) => {
                  if (error) {
                    console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    Utils.emitEvent(result, 10066)
                  }
                }
              )
            }, 300)
          })
          .key('testWebView_registerJavaScriptProxy_0021')
      }

      Row() {
        Button('0022')
          .onClick((event: ClickEvent) => {
            this.InitJavaScriptProxyTest('{ "javascriptProxyPermission": { "urlPermissionList": [ { "scheme": "resource", "host": "rawfile", "port": "", "path": ""} ], "methodList": [ { "methodName": "test", "urlPermissionList": [{ "scheme": "X&X", "host": "X&X", "port": "X&X", "path": "X&X" }] } ] } }')
            setTimeout(() => {
              this.webviewController.runJavaScript(
                'callArkTS()',
                (error, result) => {
                  if (error) {
                    console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    Utils.emitEvent(result, 10067)
                  }
                }
              )
            }, 300)
          })
          .key('testWebView_registerJavaScriptProxy_0022')

        Button('0023')
          .onClick((event: ClickEvent) => {
            this.InitJavaScriptProxyTest('{ "javascriptProxyPermission": { "urlPermissionList": [{ "scheme": "X&X", "host": "X&X", "port": "", "path": "" }], "methodList": [{ "methodName": "test", "urlPermissionList": [{ "scheme": "resource", "host": "rawfile", "port": "", "path": "" }] }] } }')
            setTimeout(() => {
              this.webviewController.runJavaScript(
                'callArkTS()',
                (error, result) => {
                  if (error) {
                    console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    Utils.emitEvent(result, 10068)
                  }
                }
              )
            }, 300)
          })
          .key('testWebView_registerJavaScriptProxy_0023')
      }

      Row() {
        Button('0024')
          .onClick((event: ClickEvent) => {
            this.InitJavaScriptProxyTest('{ "javascriptProxyPermission": { "urlPermissionList": [{ "scheme": "resource", "host": "rawfile", "port": "", "path": "" }], "methodList": [{ "methodName": "test", "urlPermissionList": [{ "scheme": "resource", "host": "rawfile", "port": "", "path": "" }] }] } }')
            setTimeout(() => {
              this.webviewController.runJavaScript(
                'callArkTS()',
                (error, result) => {
                  if (error) {
                    console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    Utils.emitEvent(result, 10069)
                  }
                }
              )
            }, 300)
          })
          .key('testWebView_registerJavaScriptProxy_0024')

        Button('0025')
          .onClick((event: ClickEvent) => {
            this.InitJavaScriptProxyTest('{ "javascriptProxyPermission": { "urlPermissionList": [{ "scheme": "resource", "host": "rawfile", "port": "", "path": "" }], "methodList": [{ "methodName": "test", "urlPermissionList": [{ "scheme": "resource", "host": "rawfile", "port": "", "path": "" }, { "scheme": "X&X", "host": "X&X", "port": "", "path": "" }] }, { "methodName": "test2", "urlPermissionList": [{ "scheme": "resource", "host": "rawfile", "port": "", "path": "" }, { "scheme": "X&X", "host": "X&X", "port": "", "path": "" }] }] } }')
            setTimeout(() => {
              this.webviewController.runJavaScript(
                'callArkTS()',
                (error, result) => {
                  if (error) {
                    console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    Utils.emitEvent(result, 10070)
                  }
                }
              )
            }, 300)
          })
          .key('testWebView_registerJavaScriptProxy_0025')
      }

      Row() {
        Button('0026')
          .onClick((event: ClickEvent) => {
            this.InitJavaScriptProxyTest('{ "javascriptProxyPermission": { "urlPermissionList": [{ "scheme": "resource", "host": "rawfile", "port": "", "path": "" },{ "scheme": "resource", "host": "rawfile", "port": "", "path": "" }], "methodList": [{ "methodName": "test", "urlPermissionList": [] }] } }')
            setTimeout(() => {
              this.webviewController.runJavaScript(
                'callArkTS()',
                (error, result) => {
                  if (error) {
                    console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    Utils.emitEvent(result, 10071)
                  }
                }
              )
            }, 300)
          })
          .key('testWebView_registerJavaScriptProxy_0026')
      }

      Web({ src: $rawfile('index2.html'), controller: this.webviewController })
    }
  }
}

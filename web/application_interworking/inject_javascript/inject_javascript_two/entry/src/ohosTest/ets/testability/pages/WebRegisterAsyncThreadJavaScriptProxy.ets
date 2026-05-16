/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import testNapi from 'libentry.so'
import web_webview from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils';
import { waitForExist } from '../../test/WaitTest.test';
import { BusinessError } from '@kit.BasicServicesKit';
import { URL_EXAMPLE, URL_EXAMPLE_HTTP, URL_BAIDU} from '../../test/Config.test';

@Entry
@Component
struct WebRegisterAsyncThreadJavaScriptProxy {

  webTag: string = 'ArkWeb'
  @State emitKey: string = ''
  @State isReceive: number = 0
  @State isComplete: number = -1

  controller: web_webview.WebviewController = new web_webview.WebviewController(this.webTag);

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 172850,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(172850)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 1
      }
    }
  }

  aboutToAppear() {
    console.info('start run testcase!!!')
    web_webview.WebviewController.setWebDebuggingAccess(true);
    testNapi.nativeWebInitTwo(this.webTag);
  }


  build() {
    Column() {
      Row() {
        Column() {
          Button('RegisterAsyncThreadJavaScriptProxy Test').key('RegisterAsyncThreadJavaScriptProxy')
            .onClick(async () => {
              await waitForExist(()=>this.isReceive, 'RegisterAsyncThreadJavaScriptProxy', 1, 1000)
              console.info('key==>' + this.emitKey)
              this.isReceive = 0
              switch (this.emitKey) {
                case 'emitRegisterAsyncThreadJavaScriptProxy001': {
                  await waitForExist(()=>this.isComplete, 'emitRegisterAsyncThreadJavaScriptProxy001', 1, 1000)
                  this.isComplete = 0;
                  let getResult = testNapi.registerAsyncThreadJavaScriptProxy('null', 'null')
                  console.log('emitRegisterAsyncThreadJavaScriptProxy001 registerAsyncThreadJavaScriptProxy:' + getResult)
                  this.controller.refresh();
                  await waitForExist(()=>this.isComplete, 'emitRegisterAsyncThreadJavaScriptProxy001_loadUrl_refresh', 1, 1000)
                  try {
                    this.controller.runJavaScript('testNdkProxyObjMethod1()',(error, result) => {
                      if (error) {
                        console.log(`runJavaScript error:` + JSON.stringify(error))
                        Utils.emitEvent(false,172860)
                        return
                      }
                      if (result) {
                        console.log(`The  testNdkProxyObjMethod1() return value is: + ${result}`)
                        if (result === '"objName undefined"') {
                          Utils.emitEvent(true,172860)
                        } else {
                          Utils.emitEvent(false,172860)
                        }
                      }
                    })
                  } catch (error) {
                    console.error(`ErrorCode: ${error.code},  Message: ${(error as BusinessError).message}`);
                    Utils.emitEvent(false,172860)
                  }
                  break
                }

                case 'emitRegisterAsyncThreadJavaScriptProxy002': {
                  this.isComplete = 0;
                  this.controller.loadUrl($rawfile('runJSTest.html'))
                  await waitForExist(()=>this.isComplete, 'emitRegisterAsyncThreadJavaScriptProxy002', 1, 1000)
                  this.isComplete = 0;
                  let getResult2 = testNapi.registerAsyncThreadJavaScriptProxy('WebTagTest', 'null')
                  console.log('emitRegisterAsyncThreadJavaScriptProxy002 registerAsyncThreadJavaScriptProxy:' + getResult2)
                  this.controller.refresh();
                  await waitForExist(()=>this.isComplete, 'emitRegisterAsyncThreadJavaScriptProxy002_loadUrl_refresh', 1, 1000)
                  try {
                    this.controller.runJavaScript('testNdkProxyObjMethod1()',(error, result) => {
                      if (error) {
                        console.log(`runJavaScript error:` + JSON.stringify(error))
                        Utils.emitEvent(false,172870)
                        return
                      }
                      if (result) {
                        console.log(`The  testNdkProxyObjMethod1() return value is: + ${result}`)
                        if (result === '"objName undefined"') {
                          Utils.emitEvent(true,172870)
                        } else {
                          Utils.emitEvent(false,172870)
                        }
                      }
                    })
                  } catch (error) {
                    console.error(`ErrorCode: ${error.code},  Message: ${(error as BusinessError).message}`);
                    Utils.emitEvent(false,172870)
                  }
                  break
                }

                case 'emitRegisterAsyncThreadJavaScriptProxy003': {
                  this.isComplete = 0;
                  this.controller.loadUrl($rawfile('runJSTest.html'))
                  await waitForExist(()=>this.isComplete, 'emitRegisterAsyncThreadJavaScriptProxy003', 1, 1000)
                  this.isComplete = 0;
                  let getResult3 = testNapi.registerAsyncThreadJavaScriptProxy(this.webTag, 'null')
                  console.log('emitRegisterAsyncThreadJavaScriptProxy003 registerAsyncThreadJavaScriptProxy:' + getResult3)
                  this.controller.refresh();
                  await waitForExist(()=>this.isComplete, 'emitRegisterAsyncThreadJavaScriptProxy003_loadUrl_refresh', 1, 1000)
                  try {
                    this.controller.runJavaScript('testNdkProxyObjMethod1()',(error, result) => {
                      if (error) {
                        console.log(`runJavaScript error:` + JSON.stringify(error))
                        Utils.emitEvent(false,172880)
                        return
                      }
                      if (result) {
                        console.log(`The  testNdkProxyObjMethod1() return value is: + ${result}`)
                        if (result === '"method1"') {
                          Utils.emitEvent(true,172880)
                        } else {
                          Utils.emitEvent(false,172880)
                        }
                      }
                    })
                  } catch (error) {
                    console.error(`ErrorCode: ${error.code},  Message: ${(error as BusinessError).message}`);
                    Utils.emitEvent(false,172880)
                  }
                  break
                }
                case 'emitRegisterAsyncThreadJavaScriptProxy004': {
                  this.isComplete = 0;
                  this.controller.loadUrl($rawfile('runJSTest.html'))
                  await waitForExist(()=>this.isComplete, 'emitRegisterAsyncThreadJavaScriptProxy004', 1, 1000)
                  this.isComplete = 0;
                  let getResult4 = testNapi.registerAsyncThreadJavaScriptProxy(this.webTag, 'null')
                  console.log('emitRegisterAsyncThreadJavaScriptProxy004 registerAsyncThreadJavaScriptProxy:' + getResult4)
                  this.controller.refresh();
                  await waitForExist(()=>this.isComplete, 'emitRegisterAsyncThreadJavaScriptProxy004_loadUrl_refresh', 1, 1000)
                  try {
                    this.controller.runJavaScript('testNdkProxyObjMethod2()',(error, result) => {
                      if (error) {
                        console.log(`runJavaScript error:` + JSON.stringify(error))
                        Utils.emitEvent(false,172890)
                        return
                      }
                      if (result) {
                        console.log(`The  testNdkProxyObjMethod2() return value is: + ${result}`)
                        if (result === 'true') {
                          Utils.emitEvent(true,172890)
                        } else {
                          Utils.emitEvent(false,172890)
                        }
                      }
                    })
                  } catch (error) {
                    console.error(`ErrorCode: ${error.code},  Message: ${(error as BusinessError).message}`);
                    Utils.emitEvent(false,172890)
                  }
                  break
                }
                case 'emitRegisterAsyncThreadJavaScriptProxy005': {
                  this.isComplete = 0;
                  this.controller.loadUrl($rawfile('runJSTest.html'))
                  await waitForExist(()=>this.isComplete, 'emitRegisterAsyncThreadJavaScriptProxy005', 1, 1000)
                  this.isComplete = 0;
                  let getResult5 = testNapi.registerAsyncThreadJavaScriptProxy(this.webTag, 'null')
                  console.log('emitRegisterAsyncThreadJavaScriptProxy005 registerAsyncThreadJavaScriptProxy:' + getResult5)
                  this.controller.refresh();
                  await waitForExist(()=>this.isComplete, 'emitRegisterAsyncThreadJavaScriptProxy005_loadUrl_refresh', 1, 1000)
                  try {
                    this.controller.runJavaScript('window.ndkProxy.method3("hello", 1.23456, 123789, true, false, 0 , undefined )',(error, result) => {
                      if (error) {
                        console.log(`runJavaScript error:` + JSON.stringify(error))
                        Utils.emitEvent(false,172900)
                        return
                      }
                      if (result) {
                        console.log(`The  window.ndkProxy.method3() return value is: + ${result}`)
                        if (result === 'null') {
                          Utils.emitEvent(true,172900)
                        } else {
                          Utils.emitEvent(false,172900)
                        }
                      }
                    })
                  } catch (error) {
                    console.error(`ErrorCode: ${error.code},  Message: ${(error as BusinessError).message}`);
                    Utils.emitEvent(false,172900)
                  }
                  break
                }

                case 'emitRegisterAsyncThreadJavaScriptProxy006': {
                  this.isComplete = 0;
                  this.controller.loadUrl($rawfile('runJSTest.html'))
                  await waitForExist(()=>this.isComplete, 'emitRegisterAsyncThreadJavaScriptProxy006', 1, 1000)
                  this.isComplete = 0;
                  let getResult6 = testNapi.registerAsyncThreadJavaScriptProxy(this.webTag, 'null')
                  console.log('emitRegisterAsyncThreadJavaScriptProxy006 registerAsyncThreadJavaScriptProxy:' + getResult6)
                  this.controller.refresh();
                  await waitForExist(()=>this.isComplete, 'emitRegisterAsyncThreadJavaScriptProxy006_loadUrl_refresh', 1, 1000)
                  try {
                    let methodResult1 = ''
                    let methodResult2 = ''
                    this.controller.runJavaScript('testNdkProxyObjMethod1()',(error, result) => {
                      if (error) {
                        console.log(`runJavaScript error:` + JSON.stringify(error))
                        return
                      }
                      if (result) {
                        console.log(`The  testNdkProxyObjMethod1() return value is: + ${result}`)
                        methodResult1 = result
                      }
                    })
                    this.controller.runJavaScript('testNdkProxyObjMethod2()',(error, result) => {
                      if (error) {
                        console.log(`runJavaScript error:` + JSON.stringify(error))
                        return
                      }
                      if (result) {
                        console.log(`The  testNdkProxyObjMethod2() return value is: + ${result}`)
                        methodResult2 = result
                      }
                    })
                    await waitForExist(()=>methodResult2, 'testNdkProxyObjMethod2', 'true', 1000)
                    let pidResult = testNapi.getPidResult()
                    console.log('emitRegisterAsyncThreadJavaScriptProxy006 pidResult:' + pidResult)
                    if (pidResult === 1) {
                      Utils.emitEvent(true, 172910)
                    } else {
                      Utils.emitEvent(false, 172910)
                    }

                  } catch (error) {
                    console.error(`ErrorCode: ${error.code},  Message: ${(error as BusinessError).message}`);
                    Utils.emitEvent(false,172910)
                  }
                  break
                }
                case 'emitRegisterAsyncThreadJavaScriptProxy007': {
                  this.isComplete = 0;
                  this.controller.loadUrl(URL_EXAMPLE)
                  await waitForExist(()=>this.isComplete, 'emitRegisterAsyncThreadJavaScriptProxy007', 1, 1000)
                  this.isComplete = 0;
                  let permission: string = '{\"javascriptProxyPermission\":{\"urlPermissionList\":[{\"scheme\":\"https\",\"host\":\"www.example.com\",\"port\":\"\",\"path\":\"\"}]}}'
                  let getResult7 = testNapi.registerAsyncThreadJavaScriptProxy(this.webTag, permission)
                  console.log('emitRegisterAsyncThreadJavaScriptProxy007 registerAsyncThreadJavaScriptProxy:' + getResult7)
                  this.controller.refresh();
                  await waitForExist(()=>this.isComplete, 'emitRegisterAsyncThreadJavaScriptProxy007_loadUrl_refresh', 1, 1000)
                  try {
                    this.controller.runJavaScript('window.ndkProxy.method1("hello", 1.23456, 123789, true, false, 0 , undefined )',(error, result) => {
                      if (error) {
                        console.log(`runJavaScript error:` + JSON.stringify(error))
                        Utils.emitEvent(false,172920)
                        return
                      }
                      if (result) {
                        console.log(`The  window.ndkProxy.method1() return value is: + ${result}`)
                        if (result === '"method1"') {
                          Utils.emitEvent(true,172920)
                        } else {
                          Utils.emitEvent(false,172920)
                        }
                      }
                    })
                  } catch (error) {
                    console.error(`ErrorCode: ${error.code},  Message: ${(error as BusinessError).message}`);
                    Utils.emitEvent(false,172920)
                  }
                  break
                }
                case 'emitRegisterAsyncThreadJavaScriptProxy008': {
                  this.isComplete = 0;
                  this.controller.loadUrl(URL_EXAMPLE)
                  await waitForExist(()=>this.isComplete, 'emitRegisterAsyncThreadJavaScriptProxy008', 1, 1000)
                  this.isComplete = 0;
                  let permission2: string = '{\"javascriptProxyPermission\":{\"urlPermissionList\":[{\"scheme\":\"https\",\"host\":\"www.baidu.com\",\"port\":\"\",\"path\":\"\"}]}}'
                  let getResult8 = testNapi.registerAsyncThreadJavaScriptProxy(this.webTag, permission2)
                  console.log('emitRegisterAsyncThreadJavaScriptProxy008 registerAsyncThreadJavaScriptProxy:' + getResult8)
                  this.controller.refresh();
                  await waitForExist(()=>this.isComplete, 'emitRegisterAsyncThreadJavaScriptProxy008_loadUrl_refresh', 1, 1000)
                  try {
                    this.controller.runJavaScript('window.ndkProxy.method1("hello", 1.23456, 123789, true, false, 0 , undefined )',(error, result) => {
                      if (error) {
                        console.log(`runJavaScript error:` + JSON.stringify(error))
                        Utils.emitEvent(false,172930)
                        return
                      }
                      if (result) {
                        console.log(`The  window.ndkProxy.method1() return value is: + ${result}`)
                        if (result === 'null') {
                          Utils.emitEvent(true,172930)
                        } else {
                          Utils.emitEvent(false,172930)
                        }
                      }
                    })
                  } catch (error) {
                    console.error(`ErrorCode: ${error.code},  Message: ${(error as BusinessError).message}`);
                    Utils.emitEvent(false,172930)
                  }
                  break
                }
                case 'emitRegisterAsyncThreadJavaScriptProxy009': {
                  this.isComplete = 0;
                  this.controller.loadUrl(URL_EXAMPLE_HTTP)
                  await waitForExist(()=>this.isComplete, 'emitRegisterAsyncThreadJavaScriptProxy009', 1, 1000)
                  this.isComplete = 0;
                  let permission9: string = '{\"javascriptProxyPermission\":{\"urlPermissionList\":[{\"scheme\":\"https\",\"host\":\"www.example.com\",\"port\":\"\",\"path\":\"\"}]}}'
                  let getResult9 = testNapi.registerAsyncThreadJavaScriptProxy(this.webTag, permission9)
                  console.log('emitRegisterAsyncThreadJavaScriptProxy009 registerAsyncThreadJavaScriptProxy:' + getResult9)
                  this.controller.refresh();
                  await waitForExist(()=>this.isComplete, 'emitRegisterAsyncThreadJavaScriptProxy009_loadUrl_refresh', 1, 1000)
                  this.isComplete = 0;
                  let methodResultOne = '';
                  this.controller.runJavaScript('window.ndkProxy.method1("hello", 1.23456, 123789, true, false, 0 , undefined )',(error, result) => {
                      if (error) {
                          console.log(`runJavaScript error:` + JSON.stringify(error))
                          return
                      }
                      if (result) {
                          console.log(`The  window.ndkProxy.method1() return value is: + ${result}`)
                          methodResultOne = result;
                      }
                  })
                  this.controller.loadUrl(URL_EXAMPLE)
                  await waitForExist(()=>this.isComplete, 'emitRegisterAsyncThreadJavaScriptProxy009_loadUrl_refresh2', 1, 1000)
                  this.isComplete = 0;
                  try {
                    this.controller.runJavaScript('window.ndkProxy.method1("hello", 1.23456, 123789, true, false, 0 , undefined )',(error, result) => {
                      if (error) {
                        console.log(`runJavaScript error:` + JSON.stringify(error))
                        Utils.emitEvent(false,172940)
                        return
                      }
                      if (result) {
                        console.log(`The  window.ndkProxy.method1() return value is: + ${result}`)
                        if (result === '"method1"' && methodResultOne === 'null') {
                          Utils.emitEvent(true,172940)
                        } else {
                          Utils.emitEvent(false,172940)
                        }
                      }
                    })
                  } catch (error) {
                    console.error(`ErrorCode: ${error.code},  Message: ${(error as BusinessError).message}`);
                    Utils.emitEvent(false,172940)
                  }
                  break
                }

                default :
                  break
              }
            })
        }
      }
      Web({src: $rawfile('runJSTest.html'), controller: this.controller})
        .javaScriptAccess(true)
        .fileAccess(true)
        .domStorageAccess(true)
        .databaseAccess(true)
        .onControllerAttached(() => {
          console.log('onControllerAttached webId:' + this.controller.getWebId())
        })
        .onPageBegin((event) => {
          console.log('onPageBegin url:' + event.url)
        })
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url)
          this.isComplete = 1
        })
        .onSslErrorEvent((event: SslErrorEvent) => {
          if (event) {
            console.log('onSslErrorEvent url: ' + event.url);
            console.log('onSslErrorEvent error: ' + event.error);
            console.log('onSslErrorEvent originalUrl: ' + event.originalUrl);
            console.log('onSslErrorEvent referrer: ' + event.referrer);
            console.log('onSslErrorEvent isFatalError: ' + event.isFatalError);
            console.log('onSslErrorEvent isMainFrame: ' + event.isMainFrame);
            console.log('onSslErrorEvent handler: ' + event.handler);
            event.handler.handleConfirm();
          }
        })

    }
  }
}

/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@kit.BasicServicesKit';
import Utils from '../../test/Util';
import events_emitter from '@ohos.events.emitter';
import { JSON } from '@kit.ArkTS';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import testsuite from '../../test/List.test';
import { Hypium } from '@ohos/hypium';

class TestObj {
  constructor(){
  }

  test(testStr: string): string{
    console.log('Web Component str' + testStr);
    return testStr;
  }

  toString(): void{
    console.log('Web Component toString');
  }

  testNumber(testNum: number): number{
    console.log('Web Component number' + testNum);
    return testNum;
  }

  asyncTestBool(testBol: boolean): boolean{
    console.log('Web Component boolean' + testBol);
    return testBol
  }
}

class WebObj {
  constructor(){
  }

  webTest(): string{
    console.log('Web test');
    return 'Web test';
  }

  webString(): void{
    console.log('Web test toString');
  }
}

class AsyncObj {
  constructor(){
  }

  asyncTest(): void{
    console.log('Async test');
  }

  asyncString(testStr: string): void{
    console.log('Web async string' + testStr);
  }
}


@Entry
@Component
struct Index {
  controller: webview.WebviewController = new webview.WebviewController();
  controller1: webview.WebviewController = new webview.WebviewController();
  @State testObject: TestObj = new TestObj();
  @State webTestObj: WebObj = new WebObj();
  @State asyncTestObj: AsyncObj = new AsyncObj();
  @State webResult: string = '';
  @State name: string = ''
  @State str: string = ''
  @State emitKey: string = '';
  @State incognitoMode: boolean = true
  origin: string = 'file:///'
  @State src: string | Resource = $rawfile('index1.html')
  @State header: string = 'https'
  @State body: string = '://www.example.com'

  onPageShow(): void{
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  aboutToAppear(): void{
    let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
    abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    let abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs;
    abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData.data != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  build(){
    Column() {
      Row() {
        Button('Web')
          .key('001')
          .onClick((event: ClickEvent) => {
            try {
              this.controller1.registerJavaScriptProxy(this.testObject, 'objName', ['test', 'toString', 'testNumber'],
                ['asyncTestBool']);
              this.controller.refresh();
              this.controller.runJavaScript(
                'test()',
                (error, result) => {
                  if (error) {
                    console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    this.webResult = result;
                    console.info(`The test() return value is: ${result}`);
                  }
                });
            } catch (e) {
              Utils.emitEvent(e.code + e.massage, 1001)
              console.error('err.code' + e.code)
            }
          })

        Button('name null')
          .key('002')
          .onClick(async (event: ClickEvent) => {
            try {
              this.controller.registerJavaScriptProxy(this.testObject, null, ['test', 'toString', 'testNumber'],
                ['asyncTestBool']);
              this.controller.refresh();
              this.controller.runJavaScript(
                'test()',
                (error, result) => {
                  if (error) {
                    console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    this.webResult = result;
                    console.info(`The test() return value is: ${result}`);
                  }
                });
            } catch (e) {
              Utils.emitEvent(e.code + e.massage, 1002)
              console.error('err.code' + e.code)
            }
          })
      }

      Row() {
        Button('TestObj')
          .key('003')
          .onClick((event: ClickEvent) => {
            try {
              this.controller.registerJavaScriptProxy(this.testObject, 'TestObj', ['test', 'toString', 'testNumber'],
                ['asyncTestBool']);
              this.controller.refresh();
              setTimeout(() => {
                this.controller.runJavaScript(
                  'test()',
                  (error, result) => {
                    if (error) {
                      console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                      return;
                    }
                    if (result) {
                      Utils.emitEvent('true', 1003)
                      this.webResult = result;
                      console.info(`The test() return value is: ${result}`);
                    }
                  });
              }, 300)
            } catch (e) {
              Utils.emitEvent(e.code + e.massage, 1003)
              console.error('err.code' + e.code)
            }
          })

        Button('100')
          .key('004')
          .onClick((event: ClickEvent) => {
            try {
              this.controller.registerJavaScriptProxy(this.testObject,
                'qwasedrftgzcxvcbsdhsiueyhjjnmiokjnhgfrtyhujetrioknagbvcgrethjkiujnbhytgbfgyuhfbshtyueijhnbgtyujhgbnag',
                ['test', 'toString', 'testNumber'], ['asyncTestBool']);
              this.controller.refresh();
              setTimeout(() => {
                this.controller.runJavaScript(
                  'test()',
                  (error, result) => {
                    if (error) {
                      console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                      return;
                    }
                    if (result) {
                      Utils.emitEvent('true', 1004)
                      this.webResult = result;
                      console.info(`The test() return value is: ${result}`);
                    }
                  });
              }, 300)
            } catch (e) {
              Utils.emitEvent(e.code, 1004)
              console.error('err.code=' + e.code)
            }
          })
      }

      Row() {
        Button('method null')
          .key('005')
          .onClick((event: ClickEvent) => {
            try {
              this.controller.registerJavaScriptProxy(this.testObject, 'objName', null, ['asyncTestBool']);
              this.controller.refresh();
              setTimeout(() => {
                this.controller.runJavaScript(
                  'test()',
                  (error, result) => {
                    if (error) {
                      console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                      return;
                    }
                    if (result) {
                      this.webResult = result;
                      console.info(`The test() return value is: ${result}`);
                    }
                  });
              }, 300)
            } catch (e) {
              Utils.emitEvent(e.code + e.massage, 1005)
              console.error('err.code=' + e.code)
            }
          })

        Button('normal')
          .key('006')
          .onClick(async (event: ClickEvent) => {
            try {
              this.controller.registerJavaScriptProxy(this.testObject, 'objName', ['test'], ['asyncTestBool']);
              this.controller.refresh();
              setTimeout(() => {
                this.controller.runJavaScript(
                  'objTest()',
                  (error, result) => {
                    if (error) {
                      console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                      return;
                    }
                    if (result) {
                      Utils.emitEvent('true', 1006)
                      this.webResult = result;
                      console.info(`The test() return value is: ${result}`);
                    }
                  });
              }, 300)
            } catch (e) {
              console.error('err.code=' + e.code)
            }
          })
      }

      Row() {
        Button('lost')
          .key('007')
          .onClick(async (event: ClickEvent) => {
            try {
              this.controller.registerJavaScriptProxy(this.testObject, 'objName', ['fake'], ['asyncTestBool']);
              this.controller.refresh();
              setTimeout(() => {
                this.controller.runJavaScript(
                  'fakeTest()',
                  (error, result) => {
                    if (error) {
                      console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                      return;
                    }
                    if (result) {
                      this.webResult = result;
                      Utils.emitEvent('true', 1007)
                      console.info(`The method return value is: ${result}`);
                    }
                  });
              }, 300)
            } catch (e) {
              console.error('err.code=' + e.code)
            }
          })

        Button('methods')
          .key('008')
          .onClick(async (event: ClickEvent) => {
            try {
              this.controller.registerJavaScriptProxy(this.testObject, 'objName', ['test', 'toString', 'testNumber'],
                ['asyncTestBool']);
              this.controller.refresh();
              setTimeout(() => {
                this.controller.runJavaScript(
                  'objTest()',
                  (error, result) => {
                    if (error) {
                      console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                      return;
                    }
                    if (result) {
                      Utils.emitEvent('true', 1008)
                      this.webResult = result;
                      console.info(`The test() return value is: ${result}`);
                    }
                  });
              }, 300)
            } catch (e) {
              console.error('err.code=' + e.code)
            }
          })
      }

      Row() {
        Button('normal')
          .key('009')
          .onClick(async (event: ClickEvent) => {
            try {
              this.controller.registerJavaScriptProxy(this.testObject, 'objName', ['test', 'toString', 'testNumber'],
                ['asyncTestBool']);
              this.controller.refresh();
              setTimeout(() => {
                this.controller.runJavaScript(
                  'asyncTest()',
                  (error, result) => {
                    if (error) {
                      console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                      return;
                    }
                    if (result) {
                      Utils.emitEvent('true', 1009)
                      this.webResult = result;
                      console.info(`The test() return value is: ${result}`);
                    }
                  });
              }, 300)
            } catch (e) {
              console.error('err.code=' + e.code)
            }
          })

        Button('normal')
          .key('0010')
          .onClick(async (event: ClickEvent) => {
            try {
              this.controller.registerJavaScriptProxy(this.asyncTestObj, 'objAsyncName', [],
                ['asyncString', 'asyncTest']);
              this.controller.refresh();
              setTimeout(() => {
                this.controller.runJavaScript(
                  'asyncTest()',
                  (error, result) => {
                    if (error) {
                      console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                      return;
                    }
                    if (result) {
                      Utils.emitEvent('true', 1010)
                      this.webResult = result;
                      console.info(`The test() return value is: ${result}`);
                    }
                  });
              }, 300)
            } catch (e) {
              console.error('err.code=' + e.code)
            }
          })
      }

      Row() {
        Button('method')
          .key('0011')
          .onClick(async (event: ClickEvent) => {
            try {
              this.controller.registerJavaScriptProxy(this.testObject, 'objName', ['test', 'toString', 'testNumber'],
                ['asyncTestBool', 'test', 'toString']);
              this.controller.refresh();

              setTimeout(() => {
                this.controller.runJavaScript(
                  'objTest()',
                  (error, result) => {
                    if (error) {
                      console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                      return;
                    }
                    if (result) {
                      Utils.emitEvent('true', 1011)
                      this.webResult = result;
                      console.info(`The test() return value is: ${result}`);
                    }
                  });
              }, 300)
            } catch (e) {
              console.error('err.code=' + e.code)
            }
          })

        Button('Options')
          .key('setBackForwardCacheOptions')
          .onClick((event: ClickEvent) => {
            switch (this.str) {
              case 'SUB_ACE_WEB_BFCACHE_SDK_0005':
                try {
                  let options = new webview.BackForwardCacheOptions();
                  options.size = -1;
                  options.timeToLive = 10;
                  this.controller.setBackForwardCacheOptions(options)
                  Utils.emitEvent('true', 200)
                } catch (e) {
                  console.log('err:' + e.code + e.message)
                }
                break;
              case 'SUB_ACE_WEB_BFCACHE_SDK_0006':
                try {
                  let options = new webview.BackForwardCacheOptions();
                  options.size = 0;
                  options.timeToLive = 10;
                  this.controller.setBackForwardCacheOptions(options)
                  Utils.emitEvent('true', 201)
                } catch (e) {
                  console.log('err:' + e.code + e.message)
                }
                break;
              case 'SUB_ACE_WEB_BFCACHE_SDK_0007':
                try {
                  let options = new webview.BackForwardCacheOptions();
                  options.size = 1.6;
                  options.timeToLive = 10;
                  this.controller.setBackForwardCacheOptions(options)
                  Utils.emitEvent('true', 202)
                } catch (e) {
                  console.log('err:' + e.code + e.message)
                }
                break;
              case 'SUB_ACE_WEB_BFCACHE_SDK_0008':
                try {
                  let options = new webview.BackForwardCacheOptions();
                  options.size = 1;
                  options.timeToLive = 10;
                  this.controller.setBackForwardCacheOptions(options)
                  Utils.emitEvent('true', 203)
                } catch (e) {
                  console.log('err:' + e.code + e.message)
                }
                break;
              case 'SUB_ACE_WEB_BFCACHE_SDK_0009':
                try {
                  let options = new webview.BackForwardCacheOptions();
                  options.size = 50;
                  options.timeToLive = 10;
                  this.controller.setBackForwardCacheOptions(options)
                  Utils.emitEvent('true', 204)
                } catch (e) {
                  console.log('err:' + e.code + e.message)
                }
                break;
              case 'SUB_ACE_WEB_BFCACHE_SDK_00010':
                try {
                  let options = new webview.BackForwardCacheOptions();
                  options.size = 51;
                  options.timeToLive = 10;
                  this.controller.setBackForwardCacheOptions(options)
                  Utils.emitEvent('true', 205)
                } catch (e) {
                  console.log('err:' + e.code + e.message)
                }
                break;
              case 'SUB_ACE_WEB_BFCACHE_SDK_00011':
                try {
                  let options = new webview.BackForwardCacheOptions();
                  options.size = 1;
                  options.timeToLive = 0;
                  this.controller.setBackForwardCacheOptions(options)
                  Utils.emitEvent('true', 206)
                } catch (e) {
                  console.log('err:' + e.code + e.message)
                }
                break;
              case 'SUB_ACE_WEB_BFCACHE_SDK_00012':
                try {
                  let options = new webview.BackForwardCacheOptions();
                  options.size = 1;
                  options.timeToLive = 600;
                  this.controller.setBackForwardCacheOptions(options)
                  Utils.emitEvent('true', 207)
                } catch (e) {
                  console.log('err:' + e.code + e.message)
                }
                break;
              case 'SUB_ACE_WEB_BFCACHE_SDK_00013':
                try {
                  let options = new webview.BackForwardCacheOptions();
                  options.size = 1;
                  options.timeToLive = -20;
                  this.controller.setBackForwardCacheOptions(options)
                  Utils.emitEvent('true', 208)
                } catch (e) {
                  console.log('err:' + e.code + e.message)
                }
                break;
              case 'SUB_ACE_WEB_BFCACHE_SDK_00014':
                try {
                  let options = new webview.BackForwardCacheOptions();
                  options.size = 1;
                  options.timeToLive = 90.5;
                  this.controller.setBackForwardCacheOptions(options)
                  Utils.emitEvent('true', 209)
                } catch (e) {
                  console.log('err:' + e.code + e.message)
                }
                break;
              case 'SUB_ACE_WEB_BFCACHE_SDK_00015':
                try {
                  let options = new webview.BackForwardCacheOptions();
                  options.size = 1;
                  options.timeToLive = 30;
                  this.controller1.setBackForwardCacheOptions(options)
                } catch (e) {
                  console.log('err:' + e.code + e.message)
                  Utils.emitEvent(e.code + e.message, 210)
                }
                break;
            }
          })
      }

      Row() {
        Button('Mode')
          .key('setRenderProcessMode')
          .onClick(() => {
            switch (this.str) {
              case 'SUB_ACE_setRenderProcessMode_0002':
                let mode = webview.WebviewController.getRenderProcessMode();
                console.log('getRenderProcessMode:' + mode);
                let code: string = ''
                try {
                  webview.WebviewController.setRenderProcessMode(null);
                  let mode1 = webview.WebviewController.getRenderProcessMode();
                  console.log('getRenderProcessMode:' + mode1);
                } catch (e) {
                  console.log('err.code' + e.code)
                  code = e.code + e.message
                }
                let mode1 = webview.WebviewController.getRenderProcessMode();
                console.log('getRenderProcessMode:' + mode1);
                console.log('--->' + mode + code + mode1)
                Utils.emitEvent(mode + code + mode1, 211)
                break;
              case 'SUB_ACE_setRenderProcessMode_0003':
                let mode2 = webview.WebviewController.getRenderProcessMode();
                console.log('getRenderProcessMode:' + mode2);
                try {
                  webview.WebviewController.setRenderProcessMode(5);
                  let mode3 = webview.WebviewController.getRenderProcessMode();
                  console.log('getRenderProcessMode:' + mode3);
                  Utils.emitEvent(mode3, 212)
                } catch (e) {
                  console.log('err.code' + e.code)
                  Utils.emitEvent(e.code + e.message, 212)
                }
                let mode3 = webview.WebviewController.getRenderProcessMode();
                console.log('getRenderProcessMode:' + mode3);
                break;
            }
          })

        Button('INCOGNITO').key('INCOGNITO').onClick((event: ClickEvent) => {
          switch (this.str) {
            case 'SUB_ACE_WEB_INCOGNITO_API_0006':
              try {
                webview.GeolocationPermissions.deleteAllGeolocation();
                Utils.emitEvent('true', 213)
              } catch (error) {
                console.error(`ErrorCode: {(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_INCOGNITO_API_0007':
              try {
                webview.GeolocationPermissions.getAccessibleGeolocation(this.origin, (error, result) => {
                  if (error) {
                    console.error('getAccessibleGeolocationAsync  0007 error, ErrorCode: ' + error.code);
                    Utils.emitEvent(error.code + error.message, 214)
                    return;
                  }
                  console.log('getAccessibleGeolocation 0007  result ' + result)
                })
              } catch (e) {
                console.error('getAccessibleGeolocation 0007 ErrorCode: ' + e.code);
              }
              break;
            case 'SUB_ACE_WEB_INCOGNITO_API_0008':
              this.incognitoMode = false
              this.controller.refresh()
              try {
                setTimeout(() => {
                  webview.GeolocationPermissions.getAccessibleGeolocation(this.origin, (error, result) => {
                    if (error) {
                      console.error('getAccessibleGeolocationAsync 0008, ErrorCode: ' + error.code);
                      Utils.emitEvent(error.code + error.message, 215)
                      return;
                    }
                    console.log('getAccessibleGeolocation  0008 result ' + result)
                  })
                }, 500)
              } catch (e) {
                console.error('getAccessibleGeolocation 0008 ErrorCode: ' + e.code);
              }
              break;
            case 'SUB_ACE_WEB_INCOGNITO_API_0009':
              this.incognitoMode = true
              this.controller.refresh()
              try {
                setTimeout(() => {
                  webview.GeolocationPermissions.getStoredGeolocation((error, result) => {
                    if (error) {
                      console.error('getStoredGeolocation 0009, ErrorCode: ' + (error as BusinessError).message);
                      return;
                    }
                    console.log('getStoredGeolocation  0009 result ' + result)
                    Utils.emitEvent(JSON.stringify(result), 216)
                  })
                }, 500)
              } catch (e) {
                console.error('getStoredGeolocation 0009 ErrorCode: ' + e.code);
              }
              break;
            case 'SUB_ACE_WEB_INCOGNITO_API_00010':
              this.incognitoMode = false
              this.controller.refresh()
              try {
                setTimeout(() => {
                  webview.GeolocationPermissions.getStoredGeolocation((error, result) => {
                    if (error) {
                      console.error('getStoredGeolocation 00010, ErrorCode: ' + (error as BusinessError).message);
                      return;
                    }
                    console.log('getStoredGeolocation  00010 result ' + result)
                    Utils.emitEvent(JSON.stringify(result), 217)
                  })
                }, 500)
              } catch (e) {
                console.error('getStoredGeolocation 00010 ErrorCode: ' + e.code);
              }
              break;
            case 'SUB_ACE_WEB_INCOGNITO_API_00011':
              this.incognitoMode = true
              this.src = this.header + this.body
              this.controller.refresh()
              setTimeout(() => {
                try {
                  let value = webview.WebCookieManager.fetchCookieSync(this.header + this.body);
                  console.log('fetchCookieSync cookie = ' + value);
                  Utils.emitEvent(value, 218)
                } catch (error) {
                  console.error('fetchCookieSync  ErrorCode: ' + error.code);
                }
              }, 1000)
              break;
            case 'SUB_ACE_WEB_INCOGNITO_API_00012':
              this.incognitoMode = false
              this.src = this.header + this.body
              this.controller.refresh()
              setTimeout(() => {
                try {
                  let value = webview.WebCookieManager.fetchCookieSync(this.header + this.body);
                  console.log('fetchCookieSync cookie = ' + value);
                  Utils.emitEvent(value, 219)
                } catch (error) {
                  console.error('fetchCookieSync  ErrorCode: ' + error.code);
                }
              }, 500)
              break;
          }
        })
      }

      Web({ src: this.src, controller: this.controller, incognitoMode: this.incognitoMode })
        .javaScriptAccess(true)
    }
  }
}
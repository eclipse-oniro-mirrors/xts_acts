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
import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';
import { JSON } from '@kit.ArkTS';

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
      }

      Web({ src: this.src, controller: this.controller, incognitoMode: this.incognitoMode })
        .javaScriptAccess(true)
    }
  }
}

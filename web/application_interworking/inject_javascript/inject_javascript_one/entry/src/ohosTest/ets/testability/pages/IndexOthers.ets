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
import {waitForAssert, waitForExist} from '../../test/WaitTest.test';



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

  asyncTestBool(testBol: boolean): void{
    console.log('Web Component boolean' + testBol);
    Utils.emitEvent(testBol, 172130);
  }
}

class WebObj {
  constructor(){
  }

  webTest(): string{
    console.log('Web test');
    Utils.emitEvent(true, 172140);
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
    Utils.emitEvent(true, 172150);
  }

  asyncString(testStr: string): void{
    console.log('Web async string' + testStr);
  }
}

@Entry
@Component
struct Index {
  controller: webview.WebviewController = new webview.WebviewController();
  @State str: string = '';
  @State testObjTest: TestObj = new TestObj();
  @State webTestObj: WebObj = new WebObj();
  @State asyncTestObj: AsyncObj = new AsyncObj();
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 172120,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(172120)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build(){
    Column() {
      Row() {
        Button('web click').key('registerJavaScriptProxyAsyncMethodListButton').onClick(async () => {
          await waitForExist(()=>this.isReceive, this.str, 0);
          await waitForExist(()=>this.isPageEnd, this.str, 0);
          console.info('key==>' + this.str);
          this.isReceive = -1;
          this.isPageEnd = -1;
          switch (this.str) {
            case 'emitAsyncMethodList0100': {
              this.controller.registerJavaScriptProxy(this.testObjTest, 'objName', ['test', 'toString', 'testNumber'],
                ['asyncTestBool']);
              this.controller.refresh();
              await waitForExist(()=>this.isPageEnd, this.str, 0);
              this.controller.runJavaScript('htmlTestOne()')
                .then((result) => {
                  console.log(this.str + ' runJavaScript result: ' + result);
                })
                .catch((error: BusinessError) => {
                  console.error(this.str + ' runJavaScript error: ' + error);
                })
              break;
            }
            case 'emitAsyncMethodList0200': {
              this.controller.registerJavaScriptProxy(this.webTestObj, 'objTestName', ['webTest', 'webString']);
              this.controller.refresh();
              await waitForExist(()=>this.isPageEnd, this.str, 0);
              this.controller.runJavaScript('htmlTestTwo()')
                .then((result) => {
                  console.log(this.str + ' runJavaScript result: ' + result);
                })
                .catch((error: BusinessError) => {
                  console.error(this.str + ' runJavaScript error: ' + error);
                })
              break;
            }
            case 'emitRegisterJavaScriptProxyAsyncMethodList0100': {
              this.controller.registerJavaScriptProxy(this.asyncTestObj, 'objAsyncName', [],
                ['asyncTest', 'asyncString']);
              this.controller.refresh();
              await waitForExist(()=>this.isPageEnd, this.str, 0);
              this.controller.runJavaScript('htmlTestThree()')
                .then((result) => {
                  console.log(this.str + ' runJavaScript result: ' + result);
                })
                .catch((error: BusinessError) => {
                  console.error(this.str + ' runJavaScript error: ' + error);
                })
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('indexDemo.html'), controller: this.controller })
        .javaScriptAccess(true)
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isPageEnd = 0;
        })
    }
  }
}


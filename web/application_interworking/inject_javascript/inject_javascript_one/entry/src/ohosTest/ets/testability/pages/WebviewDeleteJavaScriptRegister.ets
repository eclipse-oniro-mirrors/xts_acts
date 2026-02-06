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

class TestObj {
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
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  @State testObj: TestObj = new TestObj();
  @State str: string = ''
  @State name: string = 'testObjName';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State isNewButtonEnd: number = -1;

  onPageShow(): void{
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 172410,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  onPageHide() {
    events_emitter.off(172410)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData.data != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  InitJavaScriptProxyTest(){
    try {
      this.controller.registerJavaScriptProxy(this.testObj, this.name, ['test', 'toString']);
      this.controller.refresh();
      console.log('InitJavaScriptProxyTest success');
    } catch (error) {
      console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
    }
  }

  build(){
    Column() {
      Button('deleteJavaScriptRegister_withRefresh')
        .onClick(async () => {
          await waitForExist(() => this.isPageEnd, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          console.info('key==>' + this.str)
          this.isPageEnd = -1;
          this.InitJavaScriptProxyTest()
          await waitForExist(() => this.isPageEnd, this.str, 0);
            try {
              this.isNewButtonEnd = -1;
              this.controller.deleteJavaScriptRegister(this.name);
              this.controller.refresh()
              console.log('deleteJavaScriptRegister_withRefresh success')
              this.isNewButtonEnd = 0;
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
          await waitForExist(() => this.isNewButtonEnd, this.str, 0);
    
          try {
            this.controller.runJavaScript(
              'callArkTS()',
              (error, result) => {
                if (error) {
                  console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                  return;
                }
                if (result) {
                  Utils.emitEvent(result, 10073)
                  console.log('result is' + result);
                }
              });
            console.log('runJavaScript SUCCESS')
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }

        })
        .key('deleteJavaScriptRegister_withRefresh')
        .margin({ top: 30 })

      Button('deleteJavaScriptRegister_withOutRefresh')
        .onClick(async () => {
          await waitForExist(() => this.isPageEnd, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          console.info('key==>'+ this.str)
          this.isPageEnd = -1;
          this.InitJavaScriptProxyTest()
          await waitForExist(() => this.isPageEnd, this.str, 0);
            try {
              this.isNewButtonEnd = -1;
              this.controller.deleteJavaScriptRegister(this.name);
              console.log('deleteJavaScriptRegister_withOutRefresh success')
              this.isNewButtonEnd = 0;
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
          await waitForExist(() => this.isNewButtonEnd, this.str, 0);

            try {
              this.controller.runJavaScript(
                'callArkTS()',
                (error, result) => {
                  if (error) {
                    console.error(`run JavaScript error, ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    Utils.emitEvent(result, 10072)
                    console.log('result is' + result);
                  }
                });
              console.log('runJavaScript SUCCESS')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
        })
        .key('deleteJavaScriptRegister_withOutRefresh')
        .margin({ top: 30 })

      Button('deleteJavaScriptRegister_name_err')
        .onClick(() => {
          this.InitJavaScriptProxyTest()
          try {
            this.controller.deleteJavaScriptRegister('X&X');
            console.log('deleteJavaScriptRegister success')
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            Utils.emitEvent((error as BusinessError).code + (error as BusinessError).message, 10074)
          }
        })
        .key('deleteJavaScriptRegister_name_err')
        .margin({ top: 30 })

      Button('deleteJavaScriptRegister_name_null')
        .onClick(() => {
          this.InitJavaScriptProxyTest()
          try {
            this.controller.deleteJavaScriptRegister(null);
            console.log('deleteJavaScriptRegister success')
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            Utils.emitEvent((error as BusinessError).code + (error as BusinessError).message, 10075)
          }
        })
        .key('deleteJavaScriptRegister_name_null')
        .margin({ top: 30 })

      Web({ src: $rawfile('index2.html'), controller: this.controller })
        .javaScriptAccess(true)
        .onPageEnd((event) => {
          if (event) {
            this.isPageEnd = 0;
            console.log(' WebViewController onPageEnd url:' + event.url);
          }
        })
    }
  }
}
/**
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
import { BusinessError } from '@ohos.base';
import events_emitter from '@ohos.events.emitter';
import webview from '@ohos.web.webview';
import Utils from '../../test/Utils';
import JSON from '@ohos.util.json';
import {waitForAssert, waitForExist} from '../../test/WaitTest.test';

class TestClass {
  constructor(){
  }

  test(): string{
    return 'ArkTS Hello World!';
  }
}

@Entry
@Component
struct WebComponent {
  webviewController: webview.WebviewController = new webview.WebviewController();
  // 声明需要注册的对象
  @State testObj: TestClass = new TestClass();
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State isRunJSEnd: number = -1;

  onPageShow(){
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 172350,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }
  onPageHide() {
    events_emitter.off(172350)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build(){
    Column() {
      Row() {
        Button('web click').key('webviewJavaScriptPermissionButton').onClick(async () => {
          await waitForExist(() => this.isPageEnd, this.emitKey, 0);
          await waitForExist(() => this.isReceive, this.emitKey, 0);
          this.isReceive = -1;
          console.info('key==>' + this.emitKey)
          switch (this.emitKey) {
            case 'emitWebViewJavaScriptPermission': {
              this.isRunJSEnd = -1;
              this.webviewController.runJavaScript('callArkTS()', (error, result) => {
                console.log(`The callArkTS() return value is: ${result}`);
                this.isRunJSEnd = 0;
              })
              await waitForExist(() =>  this.isRunJSEnd, this.emitKey, 0);
              Utils.emitEvent('success', 172360)
            }
          }
        })
      }
      Web({ src: $rawfile('index.html'), controller: this.webviewController})
        // 将对象注入到web端
        .javaScriptProxy({
          object: this.testObj,
          name: 'testObjName',
          methodList: ['test'],
          controller: this.webviewController,
          // 可选参数
          asyncMethodList: [],
          permission: '{"javascriptProxyPermission":{"urlPermissionList":[{"scheme":"resource","host":"rawfile","port":"","path":""},' +
            '{"scheme":"e","host":"f","port":"g","path":"h"}],"methodList":[{"methodName":"test","urlPermissionList":' +
            '[{"scheme":"https","host":"xxx.com","port":"","path":""},{"scheme":"resource","host":"rawfile","port":"","path":""}]},' +
            '{"methodName":"test11","urlPermissionList":[{"scheme":"q","host":"r","port":"","path":"t"},' +
            '{"scheme":"u","host":"v","port":"","path":""}]}]}}'
        })
        .onPageEnd((event) => {
          if (event) {
            this.isPageEnd = 0;
            console.log('WebViewController onPageEnd url:' + event.url);
          }
        })
    }
  }
}
/**
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter';
import webview from '@ohos.web.webview';
import Utils from '../../test/Utils';
import business_error from '@ohos.base';
import { waitForExist } from '../../test/WaitTest.test';

class TestClass {
  constructor() {
  }

  test(): string {
    return 'ArkUI Web Component';
  }

  toString(): void {
    console.log('Web Component toString');
  }
}

interface MyWebOptions {
  src: ResourceStr;
  controller: WebviewController | WebController;
  renderMode?: RenderMode;
  incognitoMode?: boolean;
  sharedRenderProcessToken?: string;
}

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  @State emitKey: string = '';
  webOptions: MyWebOptions = { src: 'www.example.com', controller: this.controller, sharedRenderProcessToken: '111' }
  webOptions2: MyWebOptions = { src: 'www.gitee.com', controller: this.controller, sharedRenderProcessToken: '111' }
  @State testObj: TestClass = new TestClass();
  @State isPageEnd1: number = -1;
  @State isPageEnd2: number = -1;
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 138350,
      priority: events_emitter.EventPriority.LOW,
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(138350)
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

  build() {
    Column() {
      Row() {
        Button('web click')
          .key('webViewSharedRenderProcessToken')
          .onClick(async () => {
            await waitForExist(() => (this.isPageEnd1 || this.isPageEnd2) ? -1 : 0, this.emitKey, 0);
            await waitForExist(() => this.isReceive, this.emitKey, 0);
            this.isReceive = -1;
            console.info('key==>' + this.emitKey)

            switch (this.emitKey) {
              case 'emitWebViewSharedRenderProcessToken': {
                try {
                  console.log(this.webOptions.sharedRenderProcessToken)
                  Utils.emitEvent(true, 138360)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }

              case 'emitWebViewWebViewJsBridge': {
                try {
                  this.controller.registerJavaScriptProxy(this.testObj, 'testObjName', ['test', 'toString'],
                    // 可选参数, asyncMethodList
                    [],
                  );
                  Utils.emitEvent(true, 138370)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, 138370)
                }
                break;
              }
            }
          })
      }

      Web(this.webOptions)
        .javaScriptProxy({
          object: this.testObj,
          name: 'testObjName',
          methodList: ['test'],
          controller: this.controller,
          // 可选参数
          asyncMethodList: [],
        })
        .onPageEnd((event) => {
          console.log('web pageEnd1==>' + event.url);
          this.isPageEnd1 = 0;
        })
      Web(this.webOptions2)
        .onPageEnd((event) => {
          console.log('web pageEnd2==>' + event.url);
          this.isPageEnd2 = 0;
        })
    }
  }
}

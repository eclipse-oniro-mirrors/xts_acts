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
import events_emitter from '@ohos.events.emitter';
import webview from '@ohos.web.webview';
import Utils from '../../test/Utils';
import business_error from '@ohos.base';

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

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  @State emitKey: string = '';
  webOptions: WebOptions = { src: 'www.example.com', controller: this.controller, sharedRenderProcessToken: '111' }
  webOptions2: WebOptions = { src: 'www.w3.org', controller: this.controller, sharedRenderProcessToken: '111' }
  webOptions3: WebOptions = { src: 'www.baidu.com', controller: this.controller, sharedRenderProcessToken: '111' }
  @State testObj: TestClass = new TestClass();


  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
      }
    }
  }

  build() {

    Column() {
      Row() {
        Button('web click')
          .key('webViewSharedRenderProcessToken')
          .onClick(async () => {
            await Utils.sleep(1000);
            console.info('key==>' + this.emitKey)

            switch (this.emitKey) {
              case 'emitWebViewSharedRenderProcessToken': {
                try {
                  console.log(this.webOptions.sharedRenderProcessToken)
                  Utils.emitEvent(true,1600)
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }

              case 'emitWebViewWebViewJsBridge': {
                try {
                  this.controller.registerJavaScriptProxy(this.testObj, 'testObjName', ['test', 'toString'],
                    // 可选参数, asyncMethodList
                    [],
                    // 可选参数, permission
                    '{"javascriptProxyPermission":{"urlPermissionList":[{"scheme":"resource","host":"rawfile",' +
                      '"port":"","path":""},{"scheme":"e","host":"f","port":"g","path":"h"}],' +
                      '"methodList":[{"methodName":"test","urlPermissionList":' +
                      '[{"scheme":"https","host":"xxx.com","port":"","path":""},' +
                      '{"scheme":"resource","host":"rawfile","port":"","path":""}]},' +
                      '{"methodName":"test11","urlPermissionList":[{"scheme":"q","host":"r","port":"","path":"t"},' +
                      '{"scheme":"u","host":"v","port":"","path":""}]}]}}'
                  );
                  Utils.emitEvent(true,1601)
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false,1601)

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
        permission: '{"javascriptProxyPermission":{"urlPermissionList":[{"scheme":"resource",' +
          '"host":"rawfile","port":"","path":""},' +
          '{"scheme":"e","host":"f","port":"g","path":"h"}],"methodList":[{"methodName":"test","urlPermissionList":' +
          '[{"scheme":"https","host":"xxx.com","port":"","path":""},{"scheme":"resource","host":"rawfile","port":""' +
          ',"path":""}]},{"methodName":"test11","urlPermissionList":[{"scheme":"q","host":"r","port":"","path":"t"},' +
          '{"scheme":"u","host":"v","port":"","path":""}]}]}}'
      })
      Web(this.webOptions2)
      Web(this.webOptions3)
    }
  }
}
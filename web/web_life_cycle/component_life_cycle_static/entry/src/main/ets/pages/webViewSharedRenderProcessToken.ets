/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { RenderMode, WebOptions, Entry, Component, Column, Row, Button, ClickEvent, Web } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import webview from '@ohos.web.webview'
import { BusinessError, RecordData } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'
import { UIContext, Router } from '@ohos.arkui.UIContext'

class TestClass {
  constructor() {
  }

  test(): string {
    return 'ArkUI Web Component';
  }

  showString(): void {
    console.log('Web Component toString');
  }
}

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  @State emitKey: string = '';
  webOptions: WebOptions = {
    src: 'www.example.com',
    controller: this.controller,
    renderMode: RenderMode.SYNC_RENDER,
    incognitoMode: false,
    sharedRenderProcessToken: '111'
  } as WebOptions
  webOptions2: WebOptions = {
    src: 'www.w3.org',
    controller: this.controller,
    renderMode: RenderMode.ASYNC_RENDER,
    incognitoMode: true,
    sharedRenderProcessToken: '111'
  } as WebOptions
  webOptions3: WebOptions = {
    src: 'www.baidu.com',
    controller: this.controller,
    renderMode: RenderMode.SYNC_RENDER,
    incognitoMode: false,
    sharedRenderProcessToken: '111'
  } as WebOptions
  @State testObj: TestClass = new TestClass();

  aboutToAppear() {
    webview.WebviewController.initializeWebEngine();
    console.log('Finish initializeWebEnginer')
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.emitKey = strValue;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('web click')
          .key('webViewSharedRenderProcessToken')
          .onClick((e: ClickEvent) => {
            console.info('key==>' + this.emitKey)

            switch (this.emitKey) {
              case 'emitWebViewSharedRenderProcessToken': {
                try {
                  console.log(this.webOptions.sharedRenderProcessToken)
                  Utils.emitEvent(true,1600)
                } catch (error: BusinessError) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'emitWebViewWebViewJsBridge': {
                try {
                  this.controller.registerJavaScriptProxy(this.testObj, 'testObjName', ['test', 'showString'],
                    // 可选参数, asyncMethodList
                    []
                  );
                  Utils.emitEvent(true,1601)
                } catch (error: BusinessError) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false,1601)
                }
                break;
              }


            }
          })
      }
      Web(this.webOptions)
      Web(this.webOptions2)
      Web(this.webOptions3)
    }
  }
}
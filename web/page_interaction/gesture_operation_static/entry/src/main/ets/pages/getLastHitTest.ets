/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  Button,
  ClickEvent,
  Column,
  Component,
  Entry,
  OnLoadInterceptEvent,
  Row,
  Text,
  Web,
  WebKeyboardCallbackInfo,
  WebKeyboardOptions,
  WebKeyboardAvoidMode
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import web_webview from '@ohos.web.webview';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import emitter from '@ohos.events.emitter';
import Utils from '../../src/test/Util.test';
import { Driver, ON } from '@ohos.UiTest';
import { FontWeight } from 'arkui.component.enums';
import { AppStorage } from 'arkui.stateManagement.storage.appStorage'
import common from '@ohos.app.ability.common';
import window from '@ohos.window';
import { JsProxyObject } from '../../src/test/Interfaces';

@Entry
@Component
struct getLastHitTest {
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State url: string = ''
  @State sm: number = 0
  @State sm2: string = '黑盒'
  @State shouldShowVirtualKeyboard: boolean = false;
  @State str: string = "getLastHitTest001";
  @State avoidMode: WebKeyboardAvoidMode = WebKeyboardAvoidMode.RESIZE_CONTENT;

  aboutToAppear() {
    console.info('Entry aboutToAppear');
    let valueChangeEvent: emitter.InnerEvent = {
      eventId: 10,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info('Finish aboutToAppear ' + this.valueChangeCallBack);
  }

  onPageHide() {
    emitter.off(10)
  }

  private valueChangeCallBack: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data && data['ACTION'] != null) {
        console.info('Received ACTION value: ' + data['ACTION']);
        let strValue: string = String(data['ACTION']);
        console.info('strValue has been updated to: ' + strValue);
        this.str = strValue;
        console.info('this.str has been updated to: ' + this.str);
      }
    }
  }
  private jsObj: JsProxyObject = {
    test: (res: object) => {
      Utils.emitEvent(String(res), 102);
    },
    showString: (str: string) => {
      console.info("ets toString:" + String(str));
    },
    register: (res: object) => {
      Utils.emitEvent(String(res), 86);
      return "web222"
    }
  } as JsProxyObject

  build() {
    Column() {
      Row() {
        Button("web click").key('webGetLastHitTest').onClick((e: ClickEvent) => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "getLastHitTest001": {
              try {
                setTimeout(() => {
                  console.log(`this.sm = ${this.sm}, this.sm2 = ${this.sm2}`);
                  Utils.emitEvent(this.sm == 2 && this.sm2 == 'https://www.example.com/', 20250313)
                }, 1000)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Row() {
        Text('' + this.sm).fontWeight(FontWeight.Bold)
      }

      Row() {
        Text('' + this.sm2).fontWeight(FontWeight.Bold)
      }

      Web({ src: 'resource://rawfile/getLastHitTest.html', controller: this.controller })
        .height("75%")
        .domStorageAccess(true)
        .keyboardAvoidMode(this.avoidMode)
        .onInterceptKeyboardAttach((event: WebKeyboardCallbackInfo): WebKeyboardOptions => {
          return {
            useSystemKeyboard: this.shouldShowVirtualKeyboard,
          }
        })
        .onLoadIntercept((event: OnLoadInterceptEvent): boolean => {
          try {
            let tmp = this.controller.getLastHitTest()
            this.sm = tmp.type;
            this.sm2 = tmp.extra;
            console.log('888888type' + this.sm2)
            AppStorage.get<common.UIAbilityContext>("UIAbilityContext")?.windowStage.getMainWindow()
              .then((result: window.Window) => {
                result.getUIContext().getPromptAction().showToast({
                  message: "hitTestType: " + tmp.type + "\nextra: " + tmp.extra
                })
              })
              .catch((error: Error): void => {
                console.error(0x0000, 'testTag', `getMainWindow error: ${JSON.stringify(error)}`);
              });
          } catch (e) {
            console.log(e.toString())
          }
          if (event.data.getRequestUrl().match("resource")) {
            return false
          } else {
            return true;
          }
        })
    }.width('100%').height('100%')
  }
}

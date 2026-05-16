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
  OnFaviconReceivedEvent,
  OnTouchIconUrlReceivedEvent,
  OnScaleChangeEvent,
  FileSelectorParam,
  OnShowFileSelectorEvent,
  Image,
  Row,
  Text,
  Web,
  WebKeyboardCallbackInfo,
  WebKeyboardOptions,
  CacheMode,
  WebKeyboardAvoidMode
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import image from '@ohos.multimedia.image';
import web_webview from '@ohos.web.webview';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import emitter from '@ohos.events.emitter';
import Utils from '../../src/test/Util.test';
import { Driver, ON } from '@ohos.UiTest';
import { FontWeight } from 'arkui.component.enums';
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { AppStorage } from 'arkui.stateManagement.storage.appStorage'
import common from '@ohos.app.ability.common';
import window from '@ohos.window';
import { JsProxyObject } from '../../src/test/Interfaces';
import image from '@ohos.multimedia.image';

@Entry
@Component
struct getLastHitTest {
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State url: string = ''
  @State sm: number = 0
  @State sm2: string = '黑盒'
  @State shouldShowVirtualKeyboard: boolean = false;
  @State onFaviconReceivedTag: boolean = false;
  @State onTouchIconUrlReceivedEventTag: boolean = false;
  @State onTouchIconUrlReceivedPrecomposed: boolean = false;
  @State Mode: CacheMode = CacheMode.NONE
  @State FileSelectorMode: Number = 0
  @State onTouchIconUrlReceivedUrl: string = "";
  @State str: string = "getLastHitTest001";
  @State dataUrl: string = "";
  @State avoidMode: WebKeyboardAvoidMode | undefined = WebKeyboardAvoidMode.RESIZE_CONTENT;
  @State icon: image.PixelMap | undefined = undefined;
  aboutToAppear() {
    console.info('Entry aboutToAppear');
    let valueChangeEvent: emitter.InnerEvent = {
      eventId: 10,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info('Finish aboutToAppear ' + this.valueChangeCallBack);
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

  build() {
    Column() {
      Row() {
        Button("web click").key('webGetLastHitTest').onClick((e: ClickEvent) => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "getLastHitTest001": {
              try {
			    this.avoidMode = WebKeyboardAvoidMode.RESIZE_CONTENT;
                setTimeout(() => {
                  console.log(`this.sm = ${this.sm}, this.sm2 = ${this.sm2}`);
                  Utils.emitEvent(this.sm == 2 && this.sm2 == 'https://www.example.com/', 20250313)
                }, 1000)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "onLoadInterceptEventDataTest001": {
              try {
			    this.avoidMode = WebKeyboardAvoidMode.RESIZE_CONTENT;
                this.controller.refresh()
                setTimeout(() => {
                  Utils.emitEvent(this.dataUrl, 202503131)
                }, 2000)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
			
			case "getLastHitTest002": {
              try {
                this.avoidMode = undefined;
                setTimeout(() => {
                  console.log(`this.sm = ${this.sm}, this.sm2 = ${this.sm2}`);
                  Utils.emitEvent(this.sm == 2 && this.sm2 == 'https://www.example.com/', 20250314)
                }, 1000)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitonSwitchNextPage': {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/OnTouchIconUrlReceivedTest' })
              console.log('push URL success')
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
        .zoomAccess(true)
        .keyboardAvoidMode(this.avoidMode)
        .onInterceptKeyboardAttach((event: WebKeyboardCallbackInfo): WebKeyboardOptions => {
          return {
            useSystemKeyboard: this.shouldShowVirtualKeyboard,
          }
        })
        .onLoadIntercept((event: OnLoadInterceptEvent): boolean => {
          try {
            this.dataUrl = event.data.getRequestUrl();
            console.log('url:' + event.data.getRequestUrl());
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

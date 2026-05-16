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
import { AppStorage } from 'arkui.stateManagement.storage.appStorage'
import common from '@ohos.app.ability.common';
import window from '@ohos.window';
import { JsProxyObject } from '../../src/test/Interfaces';
import image from '@ohos.multimedia.image';
import { UIContext, Router } from '@ohos.arkui.UIContext'


export class StringFields {
  public str: string = '';
}
@Entry
@Component
struct getLastHitTest {
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State url: string = ''
  @State sm: number = 0
  stringObj: StringFields  = new StringFields ();
  @State sm2: string = '黑盒'
  @State shouldShowVirtualKeyboard: boolean = false;
  @State onFaviconReceivedTag: boolean = false;
  @State onTouchIconUrlReceivedEventTag: boolean = false;
  @State onTouchIconUrlReceivedPrecomposed: boolean = false;
  @State Mode: CacheMode = CacheMode.NONE
  @State FileSelectorMode: Number = 0
  @State onTouchIconUrlReceivedUrl: string = "";
  @State str: string = "onFaviconReceivedEventFaviconTest001";
  @State dataUrl: string = "";
  @State avoidMode: WebKeyboardAvoidMode = WebKeyboardAvoidMode.RESIZE_CONTENT;
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
        Button("web click").key('onTouch').onClick((e: ClickEvent) => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "onFaviconReceivedEventFaviconTest001": {
              try {
                this.controller.loadUrl("resource://rawfile/indexFour.html")
                setTimeout(() => {
                  if(this.onFaviconReceivedTag == true){
                    Utils.emitEvent(true, 202503132)
                  }
                  else{
                    Utils.emitEvent(false, 202503132)
                  }
                }, 5000)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "onTouchIconUrlReceivedEventPrecomposedTest001": {
              try {
                this.controller.loadUrl("resource://rawfile/indexFour.html")
                setTimeout(() => {
                  if(this.onTouchIconUrlReceivedEventTag == true){
                    Utils.emitEvent(true, 202503133)
                  }
                  else{
                    Utils.emitEvent(false, 202503133)
                  }
                }, 5000)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "onTouchIconUrlReceivedEventUrlTest001": {
              try {
                this.controller.loadUrl("resource://rawfile/indexFour.html")
                setTimeout(() => {
                  Utils.emitEvent(this.onTouchIconUrlReceivedUrl, 202503134)
                }, 3000)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

          }
        })
      }

      Row() {
        Image("resource://rawfile/icon.png")
          .width(110)
          .height(110)
          .border({ width: 1 })
          .key("images")
      }

      Web({ src: 'resource://rawfile/fullScreenEnter.html', controller: this.controller })
        .key("WebViewEnumAndSetWebControllerWebView")
        .blockNetwork(false)
        .cacheMode(this.Mode)
        .onShowFileSelector((event:OnShowFileSelectorEvent): boolean => {
          if (event) {
            console.log('OnShowFileSelectorEvent event success');
            let fileSelectorObj: FileSelectorParam = event.fileSelector
            this.FileSelectorMode = fileSelectorObj.getMode()
          }
          return true
        })
        .onFaviconReceived((event: OnFaviconReceivedEvent): void => {
          console.log('OnFaviconReceivedEvent event success');
          this.icon = event.favicon;
          this.onFaviconReceivedTag = true;
        })
        .onTouchIconUrlReceived((event: OnTouchIconUrlReceivedEvent): void => {
          this.onTouchIconUrlReceivedPrecomposed = event.precomposed
          console.log('onTouchIconUrlReceivedPrecomposed:' + this.onTouchIconUrlReceivedPrecomposed);
          this.onTouchIconUrlReceivedUrl = event.url
          console.log('onTouchIconUrlReceivedUrl:' + this.onTouchIconUrlReceivedUrl);
          this.onTouchIconUrlReceivedEventTag = true;
        })
    }.width('100%').height('100%')
  }
}

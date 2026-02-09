/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import {Entry, Component, Column, Row, Button, ClickEvent, Web,OnErrorReceiveEvent } from "@ohos.arkui.component"
import { State } from "@ohos.arkui.stateManagement"
import { Callback } from '@ohos.base'
import Utils from '../../src/test/Util.test';
import webView from '@ohos.web.webview';
import { BusinessError, RecordData } from '@ohos.base';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from "../../../hypium/index";
import { UIContext, Router } from '@ohos.arkui.UIContext'

@Entry
@Component
struct Index {
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  controllerNull: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = ""
  @State javaScriptAccess: boolean = true;
  @State databaseAccess: boolean = true
  @State level: number = 100;
  @State lineNumber: number = 100;
  @State sourceID: string = "test";
  @State message: string = "123";
  @State errorCode: string = '0';
  no_error: string = "no error happened"

  aboutToAppear() {
    console.info('Entry aboutToAppear');
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info('Finish aboutToAppear');
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.str = strValue;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebViewControllerErrorCode click").key('WebViewControllerErrorCodeButton').onClick((e: ClickEvent) => {
          console.info("key==>" + this.str)
          switch (this.str) {

            case "testPageUpError001": {
              try {
                this.controllerNull.pageUp(true);
                Utils.emitEvent(true, 20265)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 20265)
              }
              break;
            }

            case "testPageUpError002": {
              try {
                this.controllerNull.pageUp(false);
                Utils.emitEvent(true, 20266)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 20266)
              }
              break;
            }

            case "testPageDownError001": {
              try {
                this.controllerNull.pageDown(true);
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 20270)
              }
              break;
            }

            case "testPageDownError002": {
              try {
                this.controllerNull.pageDown(false);
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 20271)
              }
              break;
            }

            case 'SwitchNextPageStatic' : {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/webViewControllerErrorCodeSecond' })
              console.log('push URL success')
            }
          }
        })
      }

      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)

        .onErrorReceive((event:OnErrorReceiveEvent):void => {
          if (event) {
            console.log('getErrorInfo:' + event.error.getErrorInfo())
            console.log('getErrorCode:' + event.error.getErrorCode())
            console.log('url:' + event.request.getRequestUrl())
            console.log('isMainFrame:' + event.request.isMainFrame())
            console.log('isRedirect:' + event.request.isRedirect())
            console.log('isRequestGesture:' + event.request.isRequestGesture())
            console.log('getRequestHeader_headerKey:' + event.request.getRequestHeader().toString())
            let result = event.request.getRequestHeader()
            console.log('The request header result size is ' + result.length)
            for (let i of result) {
              console.log('The request header key is : ' + i.headerKey + ', value is : ' + i.headerValue)
            }
          }
        })
        .zoomAccess(false)
        .databaseAccess(this.databaseAccess)
    }
  }
}

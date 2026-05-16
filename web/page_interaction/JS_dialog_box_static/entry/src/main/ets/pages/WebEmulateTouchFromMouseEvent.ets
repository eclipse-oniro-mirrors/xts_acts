/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import Utils from '../../src/test/Util.test';
import webView from '@ohos.web.webview';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON } from '@ohos.UiTest';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import {
  OnRenderExitedEvent,
  OnPageBeginEvent,
  RenderProcessNotRespondingReason,
  RenderProcessNotRespondingData,
  Entry,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  Web,
  LargestContentfulPaint,
  WebKeyboardAvoidMode,
  Flex,
  Image,
  Builder,
  Text,
  FlexDirection,
  FlexAlign,
  ItemAlign,
  ForEach,
  ConsoleMessageSource,
  Alignment,
  Divider,
  $r,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { Callback } from '@ohos.base'
import { UIContext, Router } from '@ohos.arkui.UIContext'


export class StringFields {
  str: string = '';
}



@Entry
@Component
struct WebViewEnumAndFontLibrary {
  stringObj: StringFields  = new StringFields ();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = "";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State zoomAccess: boolean = false;
  @State newScale: number = 0
  @State oldScale: number = 0
  @State userAgentPC:string = "";
  @State flag: boolean = false;
  @State compareScale: number = 0
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  @State isPointerEnd: number = -1;
  @State webMode: WebKeyboardAvoidMode = WebKeyboardAvoidMode.OVERLAYS_CONTENT;


  aboutToAppear() {
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
        this.stringObj.str = strValue;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('web click')
          .key('emulateTouchFromMouseEvent')
          .onClick((e: ClickEvent) => {
            console.info("key==>" +this.stringObj.str)
            switch (this.stringObj.str) {

              case "emitWebEmulateTouchFromMouseEvent001": {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/autofill.html")
                  Utils.emitEvent('emulateTouchFromMouseEvent', 2026323105)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "emitWebKeyboardAvoidMode001": {
                try {
                  this.isPageEnd = -1;
                  this.webMode = WebKeyboardAvoidMode.RESIZE_VISUAL
                  this.controller.loadUrl("resource://rawfile/autofill.html")
                  Utils.emitEvent(WebKeyboardAvoidMode.RESIZE_VISUAL, 2026323101)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "emitWebKeyboardAvoidMode002": {
                try {
                  this.isPageEnd = -1;
                  this.webMode = WebKeyboardAvoidMode.RESIZE_CONTENT
                  this.controller.loadUrl("resource://rawfile/autofill.html")
                  Utils.emitEvent(WebKeyboardAvoidMode.RESIZE_CONTENT, 2026323102)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "emitWebKeyboardAvoidMode003": {
                try {
                  this.isPageEnd = -1;
                  this.webMode = WebKeyboardAvoidMode.OVERLAYS_CONTENT
                  this.controller.loadUrl("resource://rawfile/autofill.html")
                  Utils.emitEvent(WebKeyboardAvoidMode.OVERLAYS_CONTENT, 2026323103)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "emitWebKeyboardAvoidMode004": {
                try {
                  this.isPageEnd = -1;
                  this.webMode = WebKeyboardAvoidMode.RETURN_TO_UICONTEXT
                  this.controller.loadUrl("resource://rawfile/autofill.html")
                  Utils.emitEvent(WebKeyboardAvoidMode.RETURN_TO_UICONTEXT, 2026323104)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
			  
			  case 'SwitchNextPageSaveImageStatic' : {
                let uiContext: UIContext = this.getUIContext();
                let router: Router = uiContext.getRouter();
                router.pushUrl({ url: 'pages/SaveImageMenu' })
                console.log('push URL success')
              }

          }
        })
      }

      Web({ src: 'resource://rawfile/autofill.html', controller: this.controller, emulateTouchFromMouseEvent:true })
        .imageAccess(true)
        .domStorageAccess(true)
        .onlineImageAccess(true)
        .zoomAccess(true)
        .javaScriptAccess(true)
        .overviewModeAccess(true)
        .pinchSmooth(true)
        .fileAccess(true)
        .keyboardAvoidMode(this.webMode)
    }
  }
}
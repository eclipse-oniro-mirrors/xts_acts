/*
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


import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { Driver, MouseButton } from '@ohos.UiTest';
import inputMethodEngine from '@ohos.inputMethodEngine'



@Entry
@Component
struct WebViewMenuInputFieldType {
  @State str: string = ""
  @State ResultKey: number = 1;
  @State inputValue: string = ""
  @State userAgentPC: string = "";
  @State i: number = 0;
  webKeyboardController: WebKeyboardController = new WebKeyboardController()
  inputAttributeMap: Map<string, number> = new Map([
      ['UNSPECIFIED', inputMethodEngine.ENTER_KEY_TYPE_UNSPECIFIED],
      ['GO', inputMethodEngine.ENTER_KEY_TYPE_GO],
      ['SEARCH', inputMethodEngine.ENTER_KEY_TYPE_SEARCH],
      ['SEND', inputMethodEngine.ENTER_KEY_TYPE_SEND],
      ['NEXT', inputMethodEngine.ENTER_KEY_TYPE_NEXT],
      ['DONE', inputMethodEngine.ENTER_KEY_TYPE_DONE],
      ['PREVIOUS', inputMethodEngine.ENTER_KEY_TYPE_PREVIOUS]
    ])
  @State FieldTypeArr:ContextMenuInputFieldType[] = [ContextMenuInputFieldType.None,ContextMenuInputFieldType.PlainText,ContextMenuInputFieldType.Password,ContextMenuInputFieldType.Number,ContextMenuInputFieldType.Telephone,ContextMenuInputFieldType.Other]

  controller: webView.WebviewController = new webView.WebviewController();

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('WebViewMenuInputFieldTypeTestButton').key('WebViewMenuInputFieldTypeTestButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitInputFieldTypeNumber001": {
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes("PC")) {
                this.controller.loadUrl("resource://rawfile/InputFieldTypeTestNumberPC.html")
              } else {
                this.controller.loadUrl("resource://rawfile/InputFieldTypeTestNumber.html")
              }
              await Utils.sleep(2000);
              let webRect = Utils.getComponentRect('WebViewMenuInputFieldTypeTestWebView');
              let driver = Driver.create();
              let X = Utils.getRectHorizontalCenterX(webRect)
              let Y = Utils.getRectVerticalCenterY(webRect)
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_RIGHT);
              break;
            }
            case "emitInputFieldTypeText001": {
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes("PC")) {
                this.controller.loadUrl("resource://rawfile/InputFieldTypeTestTextPC.html")
              } else {
                this.controller.loadUrl("resource://rawfile/InputFieldTypeTestText.html")
              }
              await Utils.sleep(2000);
              let webRect = Utils.getComponentRect('WebViewMenuInputFieldTypeTestWebView');
              let driver = Driver.create();
              let X = Utils.getRectHorizontalCenterX(webRect)
              let Y = Utils.getRectVerticalCenterY(webRect)
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_RIGHT);
              break;
            }
            case "emitInputFieldTypePassWord001": {
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes("PC")) {
                this.controller.loadUrl("resource://rawfile/InputFieldTypeTestPassWordPC.html")
              } else {
                this.controller.loadUrl("resource://rawfile/InputFieldTypeTestPassWord.html")
              }
              await Utils.sleep(2000);
              let webRect = Utils.getComponentRect('WebViewMenuInputFieldTypeTestWebView');
              let driver = Driver.create();
              let X = Utils.getRectHorizontalCenterX(webRect)
              let Y = Utils.getRectVerticalCenterY(webRect)
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_RIGHT);
              break;
            }
            case "emitInputFieldTypeTelephone001": {
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes("PC")) {
                this.controller.loadUrl("resource://rawfile/InputFieldTypeTestTelPC.html")
              } else {
                this.controller.loadUrl("resource://rawfile/InputFieldTypeTestTel.html")
              }
              await Utils.sleep(2000);
              let webRect = Utils.getComponentRect('WebViewMenuInputFieldTypeTestWebView');
              let driver = Driver.create();
              let X = Utils.getRectHorizontalCenterX(webRect)
              let Y = Utils.getRectVerticalCenterY(webRect)
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_RIGHT);
              break;
            }
            case "emitInputFieldTypeOther001": {
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes("PC")) {
                this.controller.loadUrl("resource://rawfile/InputFieldTypeTestOtherPC.html")
              } else {
                this.controller.loadUrl("resource://rawfile/InputFieldTypeTestOther.html")
              }
              await Utils.sleep(2000);
              let webRect = Utils.getComponentRect('WebViewMenuInputFieldTypeTestWebView');
              let driver = Driver.create();
              let X = Utils.getRectHorizontalCenterX(webRect)
              let Y = Utils.getRectVerticalCenterY(webRect)
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_RIGHT);
              break;
            }
          }
        })
      }

      Web({ src: $rawfile("second.html"), controller: this.controller })
        .key("WebViewMenuInputFieldTypeTestWebView")
        .onContextMenuShow((event) => {
          if (event) {
            if (event.param.getInputFieldType() == ContextMenuInputFieldType.Number) {
              Utils.emitEvent(true, 2901)
            }
            if (event.param.getInputFieldType() == ContextMenuInputFieldType.PlainText) {
              Utils.emitEvent(true, 2902)
            }
            if (event.param.getInputFieldType() == ContextMenuInputFieldType.Password) {
              Utils.emitEvent(true, 2903)
            }
            if (event.param.getInputFieldType() == ContextMenuInputFieldType.Telephone) {
              Utils.emitEvent(true, 2904)
            }
            if (event.param.getInputFieldType() == ContextMenuInputFieldType.Other) {
              Utils.emitEvent(true, 2905)
            }
            event.result.closeContextMenu()
          }
          return true
        })
    }
  }
}

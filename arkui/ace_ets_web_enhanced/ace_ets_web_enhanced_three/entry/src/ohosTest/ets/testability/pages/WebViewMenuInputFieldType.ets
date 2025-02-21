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
import { CustomKeyboard } from '../../test/CustomKeyboard';

import {
  EKeyType,
  EKeyboardType,
  IKeyAttribute,
  lowerCaseKeyData,
  numericKeyData,
  specialKeyData,
  upperCaseKeyData
} from '../../test/Constants';


@Entry
@Component
struct WebViewMenuInputFieldType {
  @State str: string = ""
  @State items: IKeyAttribute[] = numericKeyData;
  @State ResultKey: number = 1;
  @State inputValue: string = ""
  @State curKeyboardType: EKeyboardType = EKeyboardType.NUMERIC;
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

    onKeyboardEvent(item: IKeyAttribute) {
    switch (item.type) {
    // 输入类型，更新输入内容
      case EKeyType.INPUT:
        console.log("WebCustomKeyboard text input : " + item.value);
        this.webKeyboardController.insertText(item.value);
        break;
    // 删除一个已输入的末尾字符
      case EKeyType.DELETE:
        this.webKeyboardController.deleteForward(1);
        break;
      case EKeyType.DELETEBACKWARD:
        this.webKeyboardController.deleteBackward(1);
        break;
      case EKeyType.SENDENTER:
        this.webKeyboardController.sendFunctionKey(1);
        break;
      default:
    // logger.info('Sorry, we are out of input type.')
    }
  }

    /**
     * 自定义键盘组件Builder
     */
    @Builder
    customKeyboardBuilder() {
    CustomKeyboard({
      items: this.items,
      curKeyboardType: this.curKeyboardType,
      onKeyboardEvent: this.onKeyboardEvent,
      webKeyboardController: this.webKeyboardController,
    })
      .onAppear(()=> {
        console.log('WebCustomKeyboard custom keyboard appear');
      })
      .onDisAppear(() => {
        console.log('WebCustomKeyboard custom keyboard disappear');
      })

  }
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
            case "onInterceptKeyboardAttach0100": {
              this.ResultKey = 1
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes("PC")) {
                Utils.emitEvent(true, 2893)
                break;
              } else {
                this.controller.loadUrl("resource://rawfile/onInterceptKeyboardAttach.html")
              }
              await Utils.sleep(2000);
              let webRect = Utils.getComponentRect('WebViewMenuInputFieldTypeTestWebView');
              let driver = Driver.create();
              let X = Utils.getRectHorizontalCenterX(webRect)
              let Y = Utils.getRectVerticalCenterY(webRect)
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_LEFT);
              await Utils.sleep(2000);
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_LEFT);
              await Utils.sleep(2000);
              
              break;
            }
            case "onInterceptKeyboardAttach0200": {
              this.ResultKey = 2
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes("PC")) {
                Utils.emitEvent(true, 2894)
                break;
              } else {
                this.controller.loadUrl("resource://rawfile/onInterceptKeyboardAttachDefault.html")
              }
              await Utils.sleep(2000);
              let webRect = Utils.getComponentRect('WebViewMenuInputFieldTypeTestWebView');
              let driver = Driver.create();
              let X = Utils.getRectHorizontalCenterX(webRect)
              let Y = Utils.getRectVerticalCenterY(webRect)
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_LEFT);
              await Utils.sleep(2000);
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_LEFT);
              await Utils.sleep(2000);
              break;
            }
            case "onInterceptKeyboardAttach0300": {
              this.ResultKey = 3
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes("PC")) {
                Utils.emitEvent('6', 2895)
                break;
              } else {
                this.controller.loadUrl("resource://rawfile/onInterceptKeyboardAttach_DONE.html")
              }
              await Utils.sleep(2000);
              let webRect = Utils.getComponentRect('WebViewMenuInputFieldTypeTestWebView');
              let driver = Driver.create();
              let X = Utils.getRectHorizontalCenterX(webRect)
              let Y = Utils.getRectVerticalCenterY(webRect)
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_LEFT);
              await Utils.sleep(2000);
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_LEFT);
              await Utils.sleep(2000);
              break;
            }
            case "onInterceptKeyboardAttach0400": {
              this.ResultKey = 4
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes("PC")) {
                Utils.emitEvent('2', 2896)
                break;
              } else {
                this.controller.loadUrl("resource://rawfile/onInterceptKeyboardAttach_GO.html")
              }
              await Utils.sleep(2000);
              let webRect = Utils.getComponentRect('WebViewMenuInputFieldTypeTestWebView');
              let driver = Driver.create();
              let X = Utils.getRectHorizontalCenterX(webRect)
              let Y = Utils.getRectVerticalCenterY(webRect)
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_LEFT);
              await Utils.sleep(2000);
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_LEFT);
              await Utils.sleep(2000);
              break;
            }
            case "onInterceptKeyboardAttach0500": {
              this.ResultKey = 5
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes("PC")) {
                Utils.emitEvent('5', 2897)
                break;
              } else {
                this.controller.loadUrl("resource://rawfile/onInterceptKeyboardAttach_NEXT.html")
              }
              await Utils.sleep(2000);
              let webRect = Utils.getComponentRect('WebViewMenuInputFieldTypeTestWebView');
              let driver = Driver.create();
              let X = Utils.getRectHorizontalCenterX(webRect)
              let Y = Utils.getRectVerticalCenterY(webRect)
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_LEFT);
              await Utils.sleep(2000);
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_LEFT);
              await Utils.sleep(2000);
              
              break;
            }
            case "onInterceptKeyboardAttach0600": {
              this.ResultKey = 6
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes("PC")) {
                Utils.emitEvent('7', 2898)
                break;
              } else {
                this.controller.loadUrl("resource://rawfile/onInterceptKeyboardAttach_PREVIOUS.html")
              }
              await Utils.sleep(2000);
              let webRect = Utils.getComponentRect('WebViewMenuInputFieldTypeTestWebView');
              let driver = Driver.create();
              let X = Utils.getRectHorizontalCenterX(webRect)
              let Y = Utils.getRectVerticalCenterY(webRect)
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_LEFT);
              await Utils.sleep(2000);
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_LEFT);
              await Utils.sleep(2000);
              break;
            }
            case "onInterceptKeyboardAttach0700": {
              this.ResultKey = 7
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes("PC")) {
                Utils.emitEvent('3', 2899)
                break;
              } else {
                this.controller.loadUrl("resource://rawfile/onInterceptKeyboardAttach_SEARCH.html")
              }
              await Utils.sleep(2000);
              let webRect = Utils.getComponentRect('WebViewMenuInputFieldTypeTestWebView');
              let driver = Driver.create();
              let X = Utils.getRectHorizontalCenterX(webRect)
              let Y = Utils.getRectVerticalCenterY(webRect)
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_LEFT);
              await Utils.sleep(2000);
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_LEFT);
              await Utils.sleep(2000);
              break;
            }
            case "onInterceptKeyboardAttach0800": {
              this.ResultKey = 8
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes("PC")) {
                Utils.emitEvent('4', 2880)
                break;
              } else {
                this.controller.loadUrl("resource://rawfile/onInterceptKeyboardAttach_SEND.html")
              }
              await Utils.sleep(2000);
              let webRect = Utils.getComponentRect('WebViewMenuInputFieldTypeTestWebView');
              let driver = Driver.create();
              let X = Utils.getRectHorizontalCenterX(webRect)
              let Y = Utils.getRectVerticalCenterY(webRect)
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_LEFT);
              await Utils.sleep(2000);
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_LEFT);
              await Utils.sleep(2000);
              break;
            }
            case "onInterceptKeyboardAttach0900": {
              this.ResultKey = 9
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes("PC")) {
                Utils.emitEvent('0', 2881)
                break;
              } else {
                this.controller.loadUrl("resource://rawfile/onInterceptKeyboardAttach_UNSPECIFIED.html")
              }
              await Utils.sleep(2000);
              let webRect = Utils.getComponentRect('WebViewMenuInputFieldTypeTestWebView');
              let driver = Driver.create();
              let X = Utils.getRectHorizontalCenterX(webRect)
              let Y = Utils.getRectVerticalCenterY(webRect)
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_LEFT);
              await Utils.sleep(2000);
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_LEFT);
              await Utils.sleep(2000);
              break;
            }
            case "onInterceptKeyboardAttach1000": {
              this.ResultKey = 10
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes("PC")) {
                Utils.emitEvent(1, 2882)
                break;
              } else {
                this.controller.loadUrl("resource://rawfile/onInterceptKeyboardAttach.html")
              }
              await Utils.sleep(2000);
              let webRect = Utils.getComponentRect('WebViewMenuInputFieldTypeTestWebView');
              let driver = Driver.create();
              let X = Utils.getRectHorizontalCenterX(webRect)
              let Y = Utils.getRectVerticalCenterY(webRect)
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_LEFT);
              await Utils.sleep(2000);
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_LEFT);
              await Utils.sleep(10000);
              Utils.emitEvent(this.i, 2882)
              break;
            }
          }
        })
      }

      Web({ src: $rawfile("second.html"), controller: this.controller })
        .key("WebViewMenuInputFieldTypeTestWebView")
        .onContextMenuShow((event) => {
          if (event) {
            if (event.param.getInputFieldType() == 3) {
              Utils.emitEvent(true, 2901)
            }
            if (event.param.getInputFieldType() == 1) {
              Utils.emitEvent(true, 2902)
            }
            if (event.param.getInputFieldType() == 2) {
              Utils.emitEvent(true, 2903)
            }
            if (event.param.getInputFieldType() == 4) {
              Utils.emitEvent(true, 2904)
            }
            if (event.param.getInputFieldType() == 5) {
              Utils.emitEvent(true, 2905)
            }
            event.result.closeContextMenu()
          }
          return true
        })
        .onInterceptKeyboardAttach((KeyboardCallbackInfo) => {
        if(this.ResultKey == 10){
          this.i=this.i + 1;
          console.log('count'+this.i)
        }
        let option: WebKeyboardOptions = {
          useSystemKeyboard: true,
        };
        if (!KeyboardCallbackInfo) {
          return option;
        }

        this.webKeyboardController = KeyboardCallbackInfo.controller
        let attributes: Record<string, string> = KeyboardCallbackInfo.attributes
        // 遍历attributes
        let attributeKeys = Object.keys(attributes)
        for (let i = 0; i < attributeKeys.length; i++) {
          console.log('WebCustomKeyboard key = ' + attributeKeys[i] + ', value = ' + attributes[attributeKeys[i]])
        }

        if (attributes) {
          if (attributes['data-keyboard'] == 'customKeyboard') {
            console.log('WebCustomKeyboard use custom keyboard')
            option.useSystemKeyboard = false;
            option.customKeyboard = () => {
              this.customKeyboardBuilder()
            }
            if(this.ResultKey == 1){
              Utils.emitEvent(true, 2893)
            }
            return option;
          }

          if (attributes['keyboard-return'] != undefined) {
            option.useSystemKeyboard = true;
            let enterKeyType: number | undefined = this.inputAttributeMap.get(attributes['keyboard-return'])
            console.log('keyboard-return'+enterKeyType)
            if (enterKeyType != undefined) {
              option.enterKeyType = enterKeyType
            }
            if(this.ResultKey == 3){
              Utils.emitEvent(enterKeyType+"", 2895)
            }
            if(this.ResultKey == 4){
              Utils.emitEvent(enterKeyType+"", 2896)
            }
            if(this.ResultKey == 5){
              Utils.emitEvent(enterKeyType+"", 2897)
            }
            if(this.ResultKey == 6){
              Utils.emitEvent(enterKeyType+"", 2898)
            }
            if(this.ResultKey == 7){
              Utils.emitEvent(enterKeyType+"", 2899)
            }
            if(this.ResultKey == 8){
              Utils.emitEvent(enterKeyType+"", 2880)
            }
            if(this.ResultKey == 9){
              Utils.emitEvent(enterKeyType+"", 2881)
            }
            return option;
          }
        }
        if(this.ResultKey == 2){
          Utils.emitEvent(true, 2894)
        }
        return option;
      })
    }
  }
}

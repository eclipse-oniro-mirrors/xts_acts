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
import { Driver, MouseButton } from '@kit.TestKit';

const EVENT_ID_SET_SUITE_KEY = 180501;
let driver = Driver.create();

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
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State isOnInterceptKeyboardAttachEnd: number = -1;
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
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('WebViewMenuInputFieldTypeTestButton').key('WebViewMenuInputFieldTypeTestButton').onClick(async () => {
          console.info("key==>" + this.str)
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
          switch (this.str) {
            case "onInterceptKeyboardAttach0100": {
              this.ResultKey = 1
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                Utils.emitEvent(true, 180510)
                break;
              } else {
                this.isPageEnd = -1
                this.controller.loadUrl("resource://rawfile/onInterceptKeyboardAttach.html")
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              }
              let webRect = Utils.getComponentRect('WebViewMenuInputFieldTypeTestWebView');
              let X = Utils.getRectHorizontalCenterX(webRect)
              let Y = Utils.getRectVerticalCenterY(webRect)
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_LEFT);
              break;
            }
            case "onInterceptKeyboardAttach0200": {
              this.ResultKey = 2
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                Utils.emitEvent(true, 180520)
                break;
              } else {
                this.isPageEnd = -1
                this.controller.loadUrl("resource://rawfile/onInterceptKeyboardAttachDefault.html")
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              }
              let webRect = Utils.getComponentRect('WebViewMenuInputFieldTypeTestWebView');
              let X = Utils.getRectHorizontalCenterX(webRect)
              let Y = Utils.getRectVerticalCenterY(webRect)
              this.isOnInterceptKeyboardAttachEnd = -1;
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_LEFT);
              break;
            }
            case "onInterceptKeyboardAttach0300": {
              this.ResultKey = 3
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                Utils.emitEvent('6', 180530)
                break;
              } else {
                this.isPageEnd = -1
                this.controller.loadUrl("resource://rawfile/onInterceptKeyboardAttach_DONE.html")
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              }
              let webRect = Utils.getComponentRect('WebViewMenuInputFieldTypeTestWebView');
              let X = Utils.getRectHorizontalCenterX(webRect)
              let Y = Utils.getRectVerticalCenterY(webRect)
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_LEFT);
              break;
            }
            case "onInterceptKeyboardAttach0400": {
              this.ResultKey = 4
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                Utils.emitEvent('2', 180540)
                break;
              } else {
                this.isPageEnd = -1
                this.controller.loadUrl("resource://rawfile/onInterceptKeyboardAttach_GO.html")
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              }
              let webRect = Utils.getComponentRect('WebViewMenuInputFieldTypeTestWebView');
              let X = Utils.getRectHorizontalCenterX(webRect)
              let Y = Utils.getRectVerticalCenterY(webRect)
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_LEFT);
              break;
            }
            case "onInterceptKeyboardAttach0500": {
              this.ResultKey = 5
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                Utils.emitEvent('5', 180550)
                break;
              } else {
                this.isPageEnd = -1
                this.controller.loadUrl("resource://rawfile/onInterceptKeyboardAttach_NEXT.html")
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              }
              let webRect = Utils.getComponentRect('WebViewMenuInputFieldTypeTestWebView');
              let X = Utils.getRectHorizontalCenterX(webRect)
              let Y = Utils.getRectVerticalCenterY(webRect)
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_LEFT);
              break;
            }
            case "onInterceptKeyboardAttach0600": {
              this.ResultKey = 6
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                Utils.emitEvent('7', 180560)
                break;
              } else {
                this.isPageEnd = -1
                this.controller.loadUrl("resource://rawfile/onInterceptKeyboardAttach_PREVIOUS.html")
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              }
              let webRect = Utils.getComponentRect('WebViewMenuInputFieldTypeTestWebView');
              let X = Utils.getRectHorizontalCenterX(webRect)
              let Y = Utils.getRectVerticalCenterY(webRect)
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_LEFT);
              break;
            }
            case "onInterceptKeyboardAttach0700": {
              this.ResultKey = 7
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                Utils.emitEvent('3', 180570)
                break;
              } else {
                this.isPageEnd = -1
                this.controller.loadUrl("resource://rawfile/onInterceptKeyboardAttach_SEARCH.html")
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              }
              let webRect = Utils.getComponentRect('WebViewMenuInputFieldTypeTestWebView');
              let X = Utils.getRectHorizontalCenterX(webRect)
              let Y = Utils.getRectVerticalCenterY(webRect)
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_LEFT);
              break;
            }
            case "onInterceptKeyboardAttach0800": {
              this.ResultKey = 8
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                Utils.emitEvent('4', 180580)
                break;
              } else {
                this.isPageEnd = -1
                this.controller.loadUrl("resource://rawfile/onInterceptKeyboardAttach_SEND.html")
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              }
              let webRect = Utils.getComponentRect('WebViewMenuInputFieldTypeTestWebView');
              let X = Utils.getRectHorizontalCenterX(webRect)
              let Y = Utils.getRectVerticalCenterY(webRect)
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_LEFT);
              break;
            }
            case "onInterceptKeyboardAttach0900": {
              this.ResultKey = 9
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                Utils.emitEvent('0', 180590)
                break;
              } else {
                this.isPageEnd = -1
                this.controller.loadUrl("resource://rawfile/onInterceptKeyboardAttach_UNSPECIFIED.html")
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              }
              let webRect = Utils.getComponentRect('WebViewMenuInputFieldTypeTestWebView');
              let X = Utils.getRectHorizontalCenterX(webRect)
              let Y = Utils.getRectVerticalCenterY(webRect)
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_LEFT);
              break;
            }
            case "onInterceptKeyboardAttach1000": {
              this.ResultKey = 10
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                Utils.emitEvent(1, 180600)
                break;
              } else {
                this.isPageEnd = -1
                this.controller.loadUrl("resource://rawfile/onInterceptKeyboardAttach.html")
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000)
              }
              let webRect = Utils.getComponentRect('WebViewMenuInputFieldTypeTestWebView');
              let X = Utils.getRectHorizontalCenterX(webRect)
              let Y = Utils.getRectVerticalCenterY(webRect)
              this.isOnInterceptKeyboardAttachEnd = -1
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_LEFT);
              console.log("==>after first click")
              await Utils.waitForExist(()=>this.isOnInterceptKeyboardAttachEnd, this.str+' isOnInterceptKeyboardAttachEnd', 1, 1000);
              Utils.emitEvent(this.i, 180600)
              break;
            }
          }
        })
      }

      Web({ src: $rawfile("second.html"), controller: this.controller })
        .key("WebViewMenuInputFieldTypeTestWebView")
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
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
          this.isOnInterceptKeyboardAttachEnd = 1
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
              Utils.emitEvent(true, 180510)
            }
            this.isOnInterceptKeyboardAttachEnd = 1
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
              Utils.emitEvent(enterKeyType+"", 180530)
            }
            if(this.ResultKey == 4){
              Utils.emitEvent(enterKeyType+"", 180540)
            }
            if(this.ResultKey == 5){
              Utils.emitEvent(enterKeyType+"", 180550)
            }
            if(this.ResultKey == 6){
              Utils.emitEvent(enterKeyType+"", 180560)
            }
            if(this.ResultKey == 7){
              Utils.emitEvent(enterKeyType+"", 180570)
            }
            if(this.ResultKey == 8){
              Utils.emitEvent(enterKeyType+"", 180580)
            }
            if(this.ResultKey == 9){
              Utils.emitEvent(enterKeyType+"", 180590)
            }
            this.isOnInterceptKeyboardAttachEnd = 1
            return option;
          }
        }
        if(this.ResultKey == 2){
          Utils.emitEvent(true, 180520)
        }
        this.isOnInterceptKeyboardAttachEnd = 1
        return option;
      })
    }
  }
}

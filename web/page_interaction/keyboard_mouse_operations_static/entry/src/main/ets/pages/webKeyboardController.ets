/*
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

import { Text, Builder, WebKeyboardController, WebKeyboardOptions, WebKeyboardCallbackInfo, WebLayoutMode, Entry, Component, Column, Row, Button, ClickEvent, Web } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import webView from '@ohos.web.webview'
import { BusinessError, RecordData } from '@ohos.base';
import { Utils } from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'
import { UIContext, Router } from '@ohos.arkui.UIContext'

@Entry
@Component
struct WebHitTestTypeEnumTest {
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = ''
  @State rst: string = 'Xts test result';
  webKeyboardController: WebKeyboardController = new WebKeyboardController()

  /**
   * 自定义键盘组件Builder
   */
  @Builder
  customKeyboardBuilder() {
    // 这里实现自定义键盘组件，对接WebKeyboardController实现输入、删除、关闭等操作。
    Column() {
      Button("完成")
        .fontSize(20)
        .onClick((): void => {
          this.webKeyboardController.close();
          this.rst = 'close succeed';
        })
      // 插入字符。
      Button("insertText").onClick((): void => {
        this.webKeyboardController.insertText('InsertText');
        this.rst = 'insertText succeed';
      })
      // 从后往前删除length参数指定长度的字符。
      Button("deleteForward").onClick((): void => {
        this.webKeyboardController.deleteForward(1);
        this.rst = 'deleteForward succeed';
      })
      // 从前往后删除length参数指定长度的字符。
      Button("deleteBackward").onClick((): void => {
        this.webKeyboardController.deleteBackward(1);
        this.rst = 'deleteBackward succeed';
      })
      // 插入功能按键。
      Button("sendFunctionKey").onClick((): void => {
        this.webKeyboardController.sendFunctionKey(6);
        this.rst = 'sendFunctionKey succeed';
      })

      Button("blankA").onClick((): void => {
        console.info('Click blankA')
      })
        Button("blankB").onClick((): void => {
        console.info('Click blankB')
      })
    }
  }


  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }



  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
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
        Text(this.rst)
          .key('ResultShow')
          .fontSize(20)
        Button('WebwebKeyboardControllerButton').key('WebwebKeyboardControllerButton')
          .onClick((e: ClickEvent) => {
            console.info('key==>' + this.str)
            switch (this.str) {
              case 'testwebKeyboardController001': {
                try {
                  Utils.emitEvent(WebLayoutMode.NONE, 20250321)
                } catch (error: BusinessError) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'emitonSwitchNextPage': {
                let uiContext: UIContext = this.getUIContext();
                let router: Router = uiContext.getRouter();
                router.pushUrl({ url: 'pages/webHitTestTypeEnumTest' })
                console.log('push URL success')
              }

            }
          })

        Web({ src: 'resource://rawfile/keyboard.html', controller: this.controller })
          .onInterceptKeyboardAttach((KeyboardCallbackInfo: WebKeyboardCallbackInfo): WebKeyboardOptions => {
            // option初始化，默认使用系统默认键盘
            let option: WebKeyboardOptions = {
              useSystemKeyboard: true,
            };
            if (!KeyboardCallbackInfo) {
              return option;
            }

            // 保存WebKeyboardController，使用自定义键盘时候，需要使用该handler控制输入、删除、软键盘关闭等行为
            this.webKeyboardController = KeyboardCallbackInfo.controller

            // 根据html可编辑元素的属性，判断使用不同的软键盘，例如这里如果属性包含有data-keyboard，且值为customKeyboard，则使用自定义键盘
            console.log('WebCustomKeyboard use custom keyboard')
            option.useSystemKeyboard = false;
            // 设置自定义键盘builder
            option.customKeyboard = () => {
              this.customKeyboardBuilder()
            }

            return option;
          })
      }
      .width('100%')
  }
}
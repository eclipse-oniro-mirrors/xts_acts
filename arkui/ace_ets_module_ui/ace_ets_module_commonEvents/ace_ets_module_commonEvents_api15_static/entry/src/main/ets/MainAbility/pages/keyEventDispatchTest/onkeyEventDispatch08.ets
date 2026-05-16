'use static';
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
import { FrameNode, NodeController, typeNode } from '@ohos.arkui.node';
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import { Button, ClickEvent, Column, Component, Entry, KeyEvent, KeyType, Row, Text } from '@ohos.arkui.component'

@Entry
@Component
struct onKeyEventExample8 {
  @State disPatchText1: string = "";
  @State keyText1: string = "";

  build() {
    Column() {
      Row() {
        Text(this.disPatchText1).key("disPatchKeyx")
        Text(this.keyText1).key("kkeyx")
      }

      Button('分发事件').margin(5)
      Button('分发事件1').margin(5)
      Button('分发事件2').margin(5)

      Button('响应排派发的事件')
        .onKeyEvent(((data: KeyEvent): boolean => {
          this.keyText1 = "keyTrigger"
          return true as boolean
        }) as ((data: KeyEvent) => Boolean)).key('keyResponsex')


    }
    .height('100%')
    .width('100%')
    .padding(35)

    .onKeyEventDispatch((event: KeyEvent): boolean => {
      console.info("the disPatchHandler is " + JSON.stringify(event))
      this.getUIContext().getFocusController().requestFocus("keyResponsex");
      let isConsumed = this.getUIContext().dispatchKeyEvent("xxx", event);
      this.disPatchText1 = "dis" + !!isConsumed;
      return true;
    })
    .key('keyDispatchx')
  }
}
'use static';
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
import { KeyCode } from '@ohos.multimodalInput.keyCode';
import { Entry, Component, Column, Row, Text, ColumnOptions, TouchType, CustomBuilder, DragItemInfo, Color, Button, TouchEvent, Margin, Search, KeyEvent} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct PreImeEventExample1 {
  @State buttonText: string = 'start';
  @State buttonState: boolean = true;


  build() {
    Column() {
      Button(this.buttonText).id("onKeyPreIme_button")
      Button("" + this.buttonState).id("state_button")
      Search({
        placeholder: "Search..."
      }).id("onKeyPreIme_id")
        .width("80%")
        .height("40vp")
        .border({ radius:"20vp" })
        .onKeyPreIme((event:KeyEvent):boolean => {
          this.buttonState = event.getModifierKeyState?.(["onKeyPreIme_id"])! || false
          if (event.keyCode == KeyCode.KEYCODE_DPAD_LEFT) {       
            this.buttonText = 'onKeyPreIme succ';     
            return true;
          }
          return false;
        })
    }
  }
}
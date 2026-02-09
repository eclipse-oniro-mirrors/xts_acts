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
import {
  Entry, Component, Column, Text,  ClickEvent, CaretOffset, Color,
  Button, TextInput , TextInputController, UnderlineColor
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
@Entry
@Component
struct APIUnderlineColor {
  @State text: string = ''
  @State positionInfo: CaretOffset = { index: 0, x: 0, y: 0 } as CaretOffset
  @State passwordState: boolean = false
  controller: TextInputController = new TextInputController()

  build() {
    Column() {
      TextInput({placeholder:'提示文本内容'}).key('APIUnderlineColorTextInput')
        .showUnderline(true)
        .underlineColor({normal:Color.Orange,typing:'#FF66DD00',error:Color.Red,disable:Color.Gray} as UnderlineColor);


      Text(this.text).key('APIUnderlineColorText')
      Button('get').key('APIUnderlineColorButton')
        .onClick((e:ClickEvent) => {
          let strJson = inspector.getInspectorByKey('APIUnderlineColorTextInput');
          if(JSON.parseJsonElement(strJson).getElement('$attrs').getString('underlineColor')) {
            let obj = JSON.parseJsonElement(strJson)
            let underlineColor = JSON.parseJsonElement(obj.getElement('$attrs').getString('underlineColor'))
            this.text = underlineColor.getString('typing') + ''
          } else {
            this.text = 'unknow'
          }
        })
    }.width('100%')
  }
}
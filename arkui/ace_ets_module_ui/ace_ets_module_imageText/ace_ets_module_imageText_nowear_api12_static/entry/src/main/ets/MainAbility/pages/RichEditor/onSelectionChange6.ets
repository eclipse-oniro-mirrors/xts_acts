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
import { Entry, Column, Component,RichEditorController ,Column,RichEditorOptions,RichEditorRange,
  Flex,TextRange,RichEditor,RichEditorTextSpanOptions,Text,Button,Color

} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { ClickEvent } from '@ohos.arkui.component';
@Entry
@Component
struct onSelectionChange6 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller } as RichEditorOptions;
  @State text1: number = 0
  @State text2: string = ''
  @State text3: string = ''

  build() {
    Column() {
      RichEditor(this.options)
        .onReady(():void => {
          this.controller.addTextSpan("0123456789",
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 30
              }
            } as RichEditorTextSpanOptions)
        })
        .onSelectionChange((event:RichEditorRange):void => {
          this.text1 += 1
          this.text2 = '' +  event?.start
          this.text3 = '' +  event?.end
        })
        .id('onSelectionChange6_RichEditor')
        .width('100%')
        .height('20%')
      Text('' + this.text1).key("onSelectionChange6_text1")

      Button('setCaretOffset:-1').onClick((e:ClickEvent) => {
        this.controller.setCaretOffset(-1)
      }).id('onSelectionChange6_btn1')
      Button('setCaretOffset:0').onClick((e:ClickEvent) => {
        this.controller.setCaretOffset(0)
      }).id('onSelectionChange6_btn2')
      Button('setCaretOffset:1').onClick((e:ClickEvent) => {
        this.controller.setCaretOffset(1)
      }).id('onSelectionChange6_btn3')
      Button('setCaretOffset:5').onClick((e:ClickEvent) => {
        this.controller.setCaretOffset(5)
      }).id('onSelectionChange6_btn4')
      Button('setCaretOffset:10000').onClick((e:ClickEvent) => {
        this.controller.setCaretOffset(10000)
      }).id('onSelectionChange6_btn5')
    }
    .borderWidth(1)
    .borderColor(Color.Red)
    .width("100%")
    .height("100%")

  }
}
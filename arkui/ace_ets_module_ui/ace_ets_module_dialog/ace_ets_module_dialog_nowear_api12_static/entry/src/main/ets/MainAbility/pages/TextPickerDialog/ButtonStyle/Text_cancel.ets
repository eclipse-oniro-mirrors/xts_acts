'use static';
/**
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
import { Entry, Column, Component, Flex, FlexDirection, ItemAlign, FlexAlign, Text, Button, FontWeight,
  Row, ClickEvent, Margin, ButtonType, ShadowStyle,  TimePickerDialogOptions,Color,
  ButtonStyleMode, ButtonRole, FontStyle, TextPickerDialogOptions} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct Text_cancel {
  uiContext: UIContext = this.getUIContext()
  private select: int = 0
  private fruits: Array<string> = new Array<string>('apple1', 'orange2', 'peach3', 'grape4', 'banana5')
  @State v:string = '';
  @State cancelButtonStyle_Text: string = '';
  @State Text_Options: TextPickerDialogOptions = {
    range: this.fruits,
    selected: this.select,
    disappearTextStyle: {color: Color.Red, font: {size: 15, weight: FontWeight.Lighter}},
    textStyle: {color: Color.Black, font: {size: 20, weight: FontWeight.Normal}},
    selectedTextStyle: {color: Color.Blue, font: {size: 30, weight: FontWeight.Bolder}},
    acceptButtonStyle: { type: ButtonType.Circle, style: ButtonStyleMode.NORMAL, role: ButtonRole.NORMAL, fontColor: Color.Red,
      fontSize: '26fp', fontWeight: FontWeight.Bolder, fontStyle: FontStyle.Normal, fontFamily: 'sans-serif', backgroundColor:'#80834511',
      borderRadius: 20 },
    cancelButtonStyle: { type: ButtonType.Capsule, style: ButtonStyleMode.NORMAL, role: ButtonRole.NORMAL, fontColor: Color.Blue,
      fontSize: '16fp', fontWeight: FontWeight.Normal, fontStyle: FontStyle.Italic, fontFamily: 'sans-serif', backgroundColor:'#50182431',
      borderRadius: 10 },
  } as TextPickerDialogOptions;

  build() {
    Row() {
      Column() {
        Text(this.cancelButtonStyle_Text)
          .id('cancelButtonStyle_Text')
          .margin(20)
        Button("TextPickerDialog:" + this.v)
          .margin(20)
          .onClick((e:ClickEvent) => {
            this.uiContext.showTextPickerDialog(this.Text_Options)
            if (this.Text_Options.cancelButtonStyle!.type == ButtonType.Capsule) {
                this.cancelButtonStyle_Text = 'cancelButtonStyle_Text'
            }
          })
          .id('btn')
      }.width('100%')
    }.width('100%').height('100%').id('row')
  }
}
'use static';
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
import { Entry, Column, Component, Flex, FlexDirection, ItemAlign, FlexAlign, Text, Button, FontWeight,
  Row, ClickEvent, Margin, ButtonType, ColumnOptions,TextPicker, $r, TextPickerResult, Divider, Color,TextPickerDialogOptions} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct onScrollStopTest {
  private fruits: string[] = ['apple1', 'apple2', 'apple3', 'apple4']
  private select: undefined|Double|Array<Double>|int = 0 as int
  @State v: string = ''
  @State canLoop: boolean = true
  @State message: string = ''
  @State message1: string = ''

  build() {
    Column({ space: 20 }  as ColumnOptions) {
      Text(this.message).id('text')
      TextPicker({ range: this.fruits })
        .id('myTextPicker')
        .canLoop(this.canLoop)
        .onScrollStop((value: string | string[], index: int | int[]):void => {
          this.message = 'stop' //没触发
          console.log('111111111111111111')
        })
        .onChange((value: string | string[], index: int | int[]) => {
          console.log('index：'+index)
        })
        .height('50%')
      Divider()
      Text(this.message1).id('text1')
      Button('TextPickerDialog:' + this.v)
        .id('myTextPicker1')
        .margin(20)
        .onClick((e:ClickEvent)=>{
          console.log('++++++++++++++++++++++1.1')
          let uiContext: UIContext = this.getUIContext();
          console.log('++++++++++++++++++++++1.2')
          uiContext.showTextPickerDialog({
            range: this.fruits,
            selected: this.select as int,
            disappearTextStyle: { color: Color.Red, font: { size: 15, weight: FontWeight.Lighter } },
            textStyle: { color: Color.Black, font: { size: 20, weight: FontWeight.Normal } },
            selectedTextStyle: { color: Color.Blue, font: { size: 30, weight: FontWeight.Bolder } },
            onAccept: (value: TextPickerResult) => {
              this.select = value.index as int
              console.log(this.select + '')
              this.v = value.value as string
              console.info('TextPickerDialog:onAccept()' + JSON.stringify(value))
            },
            onScrollStop: () => {
              this.message1 = 'stop'
              console.log('111111111111111111onScrollStop')
            },
            onDidAppear: () => {
             this.message1 = 'stop'
              console.log('111111111111111111onDidAppear')
            },
            onDidDisappear: () => {
              console.info('DatePickerDialog:onDidDisappear()')
            },
          } as TextPickerDialogOptions)
          console.log('++++++++++++++++++++++1.3')
        })
    }
    .height('100%')
    .width('100%')
  }
}
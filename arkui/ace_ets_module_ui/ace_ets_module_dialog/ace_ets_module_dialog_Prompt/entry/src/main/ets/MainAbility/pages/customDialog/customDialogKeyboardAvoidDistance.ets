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
import { LengthMetrics } from '@kit.ArkUI';

@CustomDialog
struct testExampleTwo {
  controllerTwo?: CustomDialogController

  build() {
    Column() {
      Text('我是第二个弹窗')
        .fontSize(30)
        .height(100)
      Button('点我关闭第二个弹窗')
        .onClick(() => {
          if (this.controllerTwo != undefined) {
            this.controllerTwo.close()
          }
        })
    }
  }
}

@CustomDialog
struct testExample {
  @Link textValue: string
  @Link inputValue: string
  dialogControllerTwo: CustomDialogController | null = new CustomDialogController({
    builder: testExampleTwo(),
    alignment: DialogAlignment.Bottom,
    offset: { dx: 0, dy: -25 }
  })
  controller?: CustomDialogController
  cancel: () => void = () => {
  }
  confirm: () => void = () => {
  }
  controller1: TextInputController = new TextInputController()

  @Builder
  CustomKeyboardBuilder() {
    Column() {
      Button('x').onClick(() => {
        this.controller1.stopEditing()
      })
      Grid() {
        ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9, '*', 0, '#'], (item: number | string) => {
          GridItem() {
            Button(item + '')
              .width('30%').onClick(() => {
              this.textValue += item
            })
          }
        })
      }
      .maxCount(3).columnsGap(10).rowsGap(10)
      .padding(5)
      .height('50%')
    }.backgroundColor(Color.Gray).id('keyboard')
  }

  build() {
    Column() {
      Row({ space: 20 }) {
        Button('确认')  .onClick(() => {
          if (this.controller != undefined) {
            this.inputValue = this.textValue
            this.controller.close()
            this.confirm()
          }
        }).backgroundColor(0xffffff).fontColor(Color.Red)
        Button('取消').onClick(() => {
          if (this.controller != undefined) {
            this.controller.close()
            this.cancel()
          }
        }).backgroundColor(0xffffff).fontColor(Color.Black)
      }.margin({top:0})
      TextInput({ placeholder: '', text: this.textValue, controller: this.controller1 })
        .id('input1')
        .width('90%')
        .customKeyboard(this.CustomKeyboardBuilder(), { supportAvoidance:true })
        .border({ width: 1 })
        .onChange((value: string) => {
          this.textValue = value
        })
      Text('弹窗').fontSize(30)
    }.justifyContent(FlexAlign.SpaceBetween)
  }
}

@Entry
@Component
struct CustomDialogUser23 {
  @State textValue: string = '11'
  @State inputValue: string = 'click me'
  @State alignsIndex: number = 0;
  @State heights: Length = 300;
  @State distanceId: number = 0
  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: testExample({
      cancel: () => {
        this.onCancel()
      },
      confirm: () => {
        this.onAccept()
      },
      textValue: $textValue,
      inputValue: $inputValue,
    }),
    cancel: this.exitApp,
    autoCancel: true,
    keyboardAvoidDistance: LengthMetrics.vp(20),
    offset: { dx: 0, dy: -20 },
    gridCount: 4,
    customStyle: false,
    cornerRadius: 10,
  })
  dialogController1: CustomDialogController | null = new CustomDialogController({
    builder: testExample({
      cancel: () => {
        this.onCancel()
      },
      confirm: () => {
        this.onAccept()
      },
      textValue: $textValue,
      inputValue: $inputValue,
    }),
    cancel: this.exitApp,
    autoCancel: true,
    keyboardAvoidDistance: undefined,
    offset: { dx: 0, dy: -20 },
    gridCount: 4,
    customStyle: false,
    cornerRadius: 10,
  })

  aboutToDisappear() {
    this.dialogController = null
  }

  onCancel() {
    console.info('Callback when the first button is clicked')
  }

  onAccept() {
    console.info('Callback when the second button is clicked')
  }

  exitApp() {
    console.info('Click the callback in the blank area')
  }

  build() {
    Column({ space: 2 }) {
      Text('custom')
      Button('20vp')
        .id('btn1')
        .onClick(() => {
          if (this.dialogController != null) {
            this.dialogController.open()
          }
        }).backgroundColor(0x317aff)

      Button('undefined')
        .id('btn2')
        .margin({ top: 10 })
        .onClick(() => {
          if (this.dialogController1 != null) {
            this.dialogController1.open()
          }
        }).backgroundColor(0x317aff)
    }.width('100%').margin({ top: 5 })
  }
}

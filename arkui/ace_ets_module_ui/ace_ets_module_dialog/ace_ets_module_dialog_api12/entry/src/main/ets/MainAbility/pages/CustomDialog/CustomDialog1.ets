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
@CustomDialog
struct CustomDialogExample1 {
  @Link textValue: string
  @Link inputValue: string

  controller?: CustomDialogController

  cancel: () => void = () => {
  }
  confirm: () => void = () => {
  }

  build() {
    Column() {
      Text('Change text').fontSize(20).margin({ top: 10, bottom: 10 })
      TextInput({ placeholder: '', text: this.textValue }).height(60).width('90%')
        .onChange((value: string) => {
          this.textValue = value
        })
      Text('Whether to change a text?').fontSize(16).margin({ bottom: 10 })
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('cancel')
          .onClick(() => {
            if (this.controller != undefined) {
              this.controller.close()
              this.cancel()
            }
          }).backgroundColor(0xffffff).fontColor(Color.Black)
        Button('confirm')
          .onClick(() => {
            if (this.controller != undefined) {
              this.inputValue = this.textValue
              this.controller.close()
              this.confirm()
            }
          }).backgroundColor(0xffffff).fontColor(Color.Red)
      }.margin({ bottom: 10 })

    }.borderRadius(10)
  }
}
@Entry
@Component
struct CustomDialogUser1 {
  @State textValue: string = ''
  @State inputValue: string = 'click me'
  @State text: string = 'CustomDialog1';
  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogExample1({
      cancel: ()=> { this.onCancel() },
      confirm: ()=> { this.onAccept() },
      textValue: $textValue,
      inputValue: $inputValue
    }),
    cancel: this.exitApp,
    showInSubWindow: true,
    autoCancel: true,
    onWillDismiss:(dismissDialog: DismissDialogAction)=> {
      console.info("reason=" + JSON.stringify(dismissDialog.reason))
      this.text = "reason=" + JSON.stringify(dismissDialog.reason)
      console.log("dialog onWillDismiss")
      if (dismissDialog.reason == DismissReason.PRESS_BACK) {

      }
      if (dismissDialog.reason == DismissReason.TOUCH_OUTSIDE) {

      }
    },
    alignment: DialogAlignment.Center,
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
    Column() {
      Text(this.text).fontSize(30).margin(30).id("CustomDialog1Text")
      Button("Reset")
        .id("CustomDialog1Reset")
        .backgroundColor("#ff0000")
        .margin(30)
        .onClick(() => {
          this.text = "CustomDialog1"
        })
      Button(this.inputValue)
        .id("CustomDialog1")
        .onClick(() => {
          if (this.dialogController != null) {
            this.dialogController.open()
          }
        }).backgroundColor(0x317aff)
    }.width('100%').margin({ top: 5 })
  }
}
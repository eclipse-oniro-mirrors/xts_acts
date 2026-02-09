/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
struct CustomDialogExampleA1 {
  @Link inputValue: string
  controller?: CustomDialogController
  cancel: () => void = () => {}
  confirm: () => void = () => {}

  build() {
    Column() {
      Text('Change text').fontSize(20).margin({ top: 10, bottom: 10 })
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('confirm').key('Custom_Dialog_A')
          .onClick(() => {
            if (this.controller != undefined) {
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
struct CustomDialogUserA3 {
  @State inputValue: string = 'CustomDialog按esc弹窗逐层退出'
  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogExampleA1({
      inputValue: $inputValue
    }),
    autoCancel: true,
    alignment: DialogAlignment.Bottom,
  })
  build() {
    Column() {
      Button(this.inputValue).key('Custom_Dialog_B')
        .onClick(() => {
          this.dialogController?.open()
          this.dialogController?.open()
          this.dialogController?.open()
        }).backgroundColor(0x317aff)
    }.width('100%').margin({ top: 200 })
  }
}
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

@CustomDialog
struct CustomDialogExampleA3 {
  @Link inputValue: string
  controller?: CustomDialogController
  cancel: () => void = () => {}
  confirm: () => void = () => {}

  build() {
    Column() {
      Text('Change text').fontSize(20).margin({ top: 10, bottom: 10 })
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('button').key('CustomDialog')
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
struct CustomDialogUserA1 {
  @State customDialogFlag1: string = 'false';
  @State customDialogFlag2: string = 'false';
  @State customDialogFlag3: string = 'false';
  @State customDialogFlag4: string = 'false';
  @State inputValue: string = 'CustomDialog生命周期'
  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogExampleA3({
      inputValue: $inputValue
    }),
    autoCancel: true,
    alignment: DialogAlignment.Center,
    onDidAppear: () => {
      this.customDialogFlag2 = 'true';
      console.info('CustomDialog,is onDidAppear!')
    },
    onDidDisappear: () => {
      this.customDialogFlag4 = 'true';
      console.info('CustomDialog,is onDidDisappear!')
    },
    onWillAppear: () => {
      this.customDialogFlag1 = 'true';
      console.info('CustomDialog,is onWillAppear!')
    },
    onWillDisappear: () => {
      this.customDialogFlag3 = 'true';
      console.info('CustomDialog,is onWillDisappear!')
    }

  })
  build() {
    Column() {
      Button(this.inputValue).key('CustomDialog')
        .onClick(() => {
          this.dialogController?.open()
        }).backgroundColor(0x317aff)
      Text(this.customDialogFlag1).id('customDialogFlag1')
      Text(this.customDialogFlag2).id('customDialogFlag2')
      Text(this.customDialogFlag3).id('customDialogFlag3')
      Text(this.customDialogFlag4).id('customDialogFlag4')
    }.width('100%').margin({ top: 200 })
  }
}
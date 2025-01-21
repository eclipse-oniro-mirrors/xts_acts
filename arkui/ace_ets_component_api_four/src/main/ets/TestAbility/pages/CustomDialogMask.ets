/*
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
struct UserDialog0100 {
  controller: CustomDialogController
  action: () => void

  build() {
    Row() {
      Button('Close CustomDialog')
        .onClick(() => {
          this.controller.close()
          this.action()
        })
        .key('CustomDialogMask_Button_Close_1')
    }.padding(20)
  }
}

@Entry
@Component
struct CustomDialogMask {
  dialogController: CustomDialogController = new CustomDialogController({
    builder: UserDialog0100({ action: this.afterClose }),
    cancel: this.onCancel
  });
  dialogController2: CustomDialogController = new CustomDialogController({
    builder: UserDialog0100({ action: this.afterClose }),
    cancel: this.onCancel,
    maskColor: Color.Blue
  });
  dialogController3: CustomDialogController = new CustomDialogController({
    builder: UserDialog0100({ action: this.afterClose }),
    cancel: this.onCancel,
    maskColor: '#00ff0000'
      });
  dialogController4: CustomDialogController = new CustomDialogController({
    builder: UserDialog0100({ action: this.afterClose }),
    cancel: this.onCancel,
    maskColor: $r('app.color.color_red')
  });
  dialogController5: CustomDialogController = new CustomDialogController({
    builder: UserDialog0100({ action: this.afterClose }),
    cancel: this.onCancel,
    maskColor: 255
  });

  afterClose() {}

  onCancel() {}

  build() {
    Column() {
      Button('maskColor not set')
        .margin(10)
        .width('90%')
        .height(45)
        .fontSize(15)
        .fontColor(Color.White)
        .type(ButtonType.Capsule)
        .stateEffect(true)
        .onClick(() => {
          this.dialogController.open()
        })
        .key('CustomDialogMask_Button_Open_1')
      Button('maskColor set by Color')
        .margin(10)
        .width('90%')
        .height(45)
        .fontSize(15)
        .fontColor(Color.White)
        .type(ButtonType.Capsule)
        .stateEffect(true)
        .onClick(() => {
          this.dialogController2.open()
        })
        .key('CustomDialogMask_Button_Open_2')
      Button('maskColor set by string')
        .margin(10)
        .width('90%')
        .height(45)
        .fontSize(15)
        .fontColor(Color.White)
        .type(ButtonType.Capsule)
        .stateEffect(true)
        .onClick(() => {
          this.dialogController3.open()
        })
        .key('CustomDialogMask_Button_Open_3')
      Button('maskColor set by Resource')
        .margin(10)
        .width('90%')
        .height(45)
        .fontSize(15)
        .fontColor(Color.White)
        .type(ButtonType.Capsule)
        .stateEffect(true)
        .onClick(() => {
          this.dialogController4.open()
        })
        .key('CustomDialogMask_Button_Open_4')
      Button('maskColor set by number')
        .margin(10)
        .width('90%')
        .height(45)
        .fontSize(15)
        .fontColor(Color.White)
        .type(ButtonType.Capsule)
        .stateEffect(true)
        .onClick(() => {
          this.dialogController5.open()
        })
        .key('CustomDialogMask_Button_Open_5')
    }
  }
}
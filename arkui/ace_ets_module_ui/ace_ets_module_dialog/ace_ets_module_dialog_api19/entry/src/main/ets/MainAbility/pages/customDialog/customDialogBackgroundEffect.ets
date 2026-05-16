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
struct CustomDialogExampleTwo2 {
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
        .margin(20)
    }
  }
}
@CustomDialog
@Component
struct CustomDialogExample2 {
  @Link textValue1: string
  @Link inputValue1: string
  dialogControllerTwo1: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogExampleTwo2(),
    alignment: DialogAlignment.Bottom,
    backgroundEffect: {
      radius: 40,
      saturation: 25,
      brightness: 2,
      color: Color.Orange,
      adaptiveColor: AdaptiveColor.DEFAULT,
      policy:BlurStyleActivePolicy.ALWAYS_ACTIVE,
      inactiveColor:Color.Blue,
      blurOptions: {
        grayscale: [20,20]
      }},
    backgroundBlurStyleOptions: {
      policy:BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE,
      adaptiveColor:AdaptiveColor.AVERAGE,
      scale:0,
      colorMode:ThemeColorMode.LIGHT,
      inactiveColor:Color.Pink,
      blurOptions:{
        grayscale:[20,100]
      }},
    offset: { dx: 0, dy: -25 } })
  controller?: CustomDialogController
  // 若尝试在CustomDialog中传入多个其他的Controller，以实现在CustomDialog中打开另一个或另一些CustomDialog，那么此处需要将指向自己的controller放在所有controller的后面
  cancel: () => void = () => {
  }
  confirm: () => void = () => {
  }
  build() {
    Column() {
      Text('Change text').fontSize(20).margin({ top: 10, bottom: 10 })
      TextInput({ placeholder: '', text: this.textValue1 }).height(60).width('90%')
        .onChange((value: string) => {
          this.textValue1 = value
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
              this.inputValue1 = this.textValue1
              this.controller.close()
              this.confirm()
            }
          }).backgroundColor(0xffffff).fontColor(Color.Red)
      }.margin({ bottom: 10 })

      Button('点我打开第二个弹窗')
        .onClick(() => {
          if (this.dialogControllerTwo1 != null) {
            this.dialogControllerTwo1.open()
          }
        })
        .margin(20)
    }.borderRadius(10)
    // 如果需要使用border属性或cornerRadius属性，请和borderRadius属性一起使用。
  }
}
@Entry
@Component
struct CustomDialogUser2 {
  @State textValue1: string = ''
  @State inputValue1: string = 'click me'
  dialogController1: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogExample2({
      cancel: ()=> { this.onCancel() },
      confirm: ()=> { this.onAccept() },
      textValue1: $textValue1,
      inputValue1: $inputValue1
    }),
    cancel: this.exitApp,
    autoCancel: true,
    alignment: DialogAlignment.Bottom,
    offset: { dx: 0, dy: -20 },
    gridCount: 4,
    customStyle: false,
    cornerRadius: 10,
    backgroundEffect: {
      radius: 40,
      saturation: 25,
      brightness: 2,
      color: Color.Pink,
      adaptiveColor: AdaptiveColor.DEFAULT,
      policy:BlurStyleActivePolicy.ALWAYS_ACTIVE,
      inactiveColor:Color.Blue,
      blurOptions: {
        grayscale: [20,20]
      }},
  })

  @State textValue2: string = ''
  @State inputValue2: string = 'click me'
  dialogController2: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogExample2({
      cancel: ()=> { this.onCancel() },
      confirm: ()=> { this.onAccept() },
      textValue1: $textValue2,
      inputValue1: $inputValue2
    }),
    cancel: this.exitApp,
    autoCancel: true,
    alignment: DialogAlignment.Bottom,
    offset: { dx: 0, dy: -20 },
    gridCount: 4,
    customStyle: false,
    cornerRadius: 10,
    backgroundEffect: {
      radius: 0,
      saturation: undefined,
      brightness: undefined,
      color: undefined,
      adaptiveColor: undefined,
      policy:undefined,
      inactiveColor:undefined,
      blurOptions: undefined,
    },
  })

  // 在自定义组件即将析构销毁时将dialogController置空
  aboutToDisappear() {
    this.dialogController1 = null // 将dialogController置空
    this.dialogController2 = null
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
      Button(this.inputValue1)
        .id('CustomDialog_Effect001')
        .onClick(() => {
          if (this.dialogController1 != null) {
            this.dialogController1.open()
          }
        }).backgroundColor(0x317aff)

      Button(this.inputValue2)
        .id('CustomDialog_Effect002')
        .onClick(() => {
          if (this.dialogController2 != null) {
            this.dialogController2.open()
          }
        }).backgroundColor(0x317aff)
    }
    .height('100%')
    .width('100%')
    .backgroundImage($r('app.media.icon'))
    .backgroundImageSize({ width: '100%', height: '100%' })
  }
}
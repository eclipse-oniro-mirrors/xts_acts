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
import {  PromptAction } from '@ohos.arkui.UIContext'
import {
  Entry,
  Component,
  $r,
  Column,
  ColumnOptions,
  Text,
  Color,
  Flex,
  FlexDirection,
  ItemAlign,
  Row,
  Button,
  ClickEvent,
  Week,
  FontWeight,
  Axis, CustomDialog, DialogAlignment,
  Margin,TextInput,KeyboardAvoidMode,CustomDialogControllerOptions, CustomDialogController,
  PickerTextStyle, CalendarAlign, CalendarPicker,Builder,TextOverflow, TextHeightAdaptivePolicy,
  ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,ComponentContent,DismissDialogAction,DismissReason
} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';

@CustomDialog
struct CustomDialogExample {
  controller?: CustomDialogController
  cancel: () => void = () => {
  }
  confirm: () => void = () => {
  }
  build() {
    Column() {
      Text('可展示在主窗口外的弹窗')
        .fontSize(30)
        .height(100)
      TextInput()
        .id('TextInput')
      Button('点我关闭弹窗')
        .onClick((e:ClickEvent):void => {
          if (this.controller != undefined) {
            this.controller!.close()
          }
        })
        .id('close')
        .backgroundColor(Color.Red)
        .margin(20)
      TextInput()
      TextInput()
      Text('可展示在主窗口外的弹窗')
        .fontSize(30)
        .height(100)
      TextInput()

      Button('点我关闭弹窗')
        .onClick((e:ClickEvent):void => {
          if (this.controller != undefined) {
            this.controller!.close()
          }
        })
        .margin(20)
      TextInput()
      Text('可展示在主窗口外的弹窗')
        .fontSize(30)
        .height(100)
      TextInput()
      Button('点我关闭弹窗')
        .onClick((e:ClickEvent):void => {
          if (this.controller != undefined) {
            this.controller!.close()
          }
        })
        .margin(20)
      TextInput()
      Text('可展示在主窗口外的弹窗')
        .fontSize(30)
        .height(100)
      TextInput()
      Button('点我关闭弹窗')
        .onClick((e:ClickEvent):void => {
          if (this.controller != undefined) {
            this.controller!.close()
          }
        })
        .margin(20)
      TextInput()
    }
  }
}
@Entry
@Component
struct CustomDialogUser {
  @State mText1: string = ''
  @State mText2: string = ''
  @State keyboardAvoidMode1: number | undefined = 0
  @State keyboardAvoidMode2: number | undefined = 1
  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogExample({
      cancel: ()=> { this.onCancel() },
      confirm: ()=> { this.onAccept() }
    }),
    cancel: this.existApp,
    autoCancel: true,
    onWillDismiss:(dismissDialogAction: DismissDialogAction)=> {
      console.info("reason=" + JSON.stringify(dismissDialogAction.reason))
      console.log("dialog onWillDismiss")
      if (dismissDialogAction.reason == DismissReason.PRESS_BACK) {
        dismissDialogAction.dismiss()
      }
      if (dismissDialogAction.reason == DismissReason.TOUCH_OUTSIDE) {
        dismissDialogAction.dismiss()
      }
    },
    alignment: DialogAlignment.Center,
    offset: { dx: 0, dy: -20 },
    gridCount: 4,
    showInSubWindow: true,
    isModal: true,
    customStyle: false,
    cornerRadius: 10,
  } as CustomDialogControllerOptions)

  aboutToDisappear() {
    this.dialogController = null
  }

  onCancel() {
    console.info('Callback when the first button is clicked')
  }

  onAccept() {
    console.info('Callback when the second button is clicked')
  }

  existApp() {
    console.info('Click the callback in the blank area')
  }

  build() {
    Column() {
      Text(this.mText1)
        .id('text1')
      Button('DEFAULT')
        .id('btn1')
        .onClick((e:ClickEvent):void => {
          this.dialogController = new CustomDialogController({
            builder: CustomDialogExample({
              cancel: () => { this.onCancel() },
              confirm: () => { this.onAccept() },
            }),
            width: 350,
            height: 600,
            keyboardAvoidMode: KeyboardAvoidMode.DEFAULT,
          })
          if (this.dialogController != null) {
            this.dialogController!.open()
            this.mText1 = this.keyboardAvoidMode1 + ''
          }
          setTimeout(() => {
            this.dialogController?.close()
          }, 1500)
        }).backgroundColor(0x317aff)

      Text(this.mText2)
        .id('text2')
      Button('NONE')
        .id('btn2')
        .onClick((e:ClickEvent):void => {
          this.dialogController = new CustomDialogController({
            builder: CustomDialogExample({
              cancel: () => { this.onCancel() },
              confirm: () => { this.onAccept() },
            }),
            width: 350,
            height: 600,
            keyboardAvoidMode: KeyboardAvoidMode.NONE,
          })
          if (this.dialogController != null) {
            this.dialogController!.open()
            this.mText2 = this.keyboardAvoidMode2 + ''
          }
          setTimeout(() => {
            this.dialogController?.close()
          }, 1500)
        }).backgroundColor(0x317aff)
    }.width('100%').margin({ top: 100 } as Margin)
  }
}
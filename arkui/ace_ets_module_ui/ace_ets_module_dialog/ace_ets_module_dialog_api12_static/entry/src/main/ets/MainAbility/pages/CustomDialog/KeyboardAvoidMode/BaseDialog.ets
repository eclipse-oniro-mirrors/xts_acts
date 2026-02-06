'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 **     http://www.apache.org/licenses/LICENSE-2.0
 **
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {  UIContext } from '@ohos.arkui.UIContext'
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
  Axis,
  Margin,TextInput,KeyboardAvoidMode,wrapBuilder, Builder, CustomBuilderT,
  PickerTextStyle, CalendarAlign, CalendarPicker,Builder,TextOverflow, TextHeightAdaptivePolicy,
  ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,ComponentContent,
} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
let customDialogId: int = 0
class Params {
  text: string = ""

  constructor(text: string) {
    this.text = text
  }
}

@Entry
@Component
struct BaseDialog_CustomDialogUser {
  @State message: string = 'hello'
  @State mText1: string = ''
  @State mText2: string = ''
  @State keyboardAvoidMode1: number | undefined = 0
  @State keyboardAvoidMode2: number | undefined = 1

  @Builder
  BaseDialog_CustomDialogExample() {
  Column() {
    Text('可展示在主窗口外的弹窗')
      .fontSize(30)
      .height(100)
    TextInput()
      .id('TextInput')
    Button('点我关闭弹窗')
      .onClick((e:ClickEvent):void => {
        this.getUIContext().getPromptAction().closeCustomDialog(customDialogId)
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
        this.getUIContext().getPromptAction().closeCustomDialog(customDialogId)
      })
      .margin(20)
    TextInput()
    Text('可展示在主窗口外的弹窗')
      .fontSize(30)
      .height(100)
    TextInput()
    Button('点我关闭弹窗')
      .onClick((e:ClickEvent):void => {
        this.getUIContext().getPromptAction().closeCustomDialog(customDialogId)
      })
      .margin(20)
    TextInput()
    Text('可展示在主窗口外的弹窗')
      .fontSize(30)
      .height(100)
    TextInput()
  }.size({ width: 350, height: 600 }).backgroundColor(Color.Gray)
}

  build() {
    Row() {
      Column() {
        Text(this.mText1)
          .id('text1')
        Button('DEFAULT')
          .id('btn1')
          .onClick((e:ClickEvent):void => {
            let uiContext = this.getUIContext();
            console.log('------------DEFAULT--------xxx')
            let contentNode = new ComponentContent<Params>(uiContext, wrapBuilder<CustomBuilderT<Params>>(this.BaseDialog_CustomDialogExample), new Params(this.message));
            console.log('------------DEFAULT--------')
            this.getUIContext().getPromptAction().openCustomDialog(contentNode, {
              keyboardAvoidMode: KeyboardAvoidMode.DEFAULT,
            })

            this.mText1 = this.keyboardAvoidMode1 + ''
            setTimeout(():void => {
              this.getUIContext().getPromptAction().closeCustomDialog(contentNode)
            }, 1000)
          }).backgroundColor(0x317aff)

        Text(this.mText2)
          .id('text2')
        Button('NONE')
          .id('btn2')
          .onClick((e:ClickEvent):void => {
            let uiContext = this.getUIContext();
            let contentNode = new ComponentContent<Params>(uiContext, wrapBuilder<CustomBuilderT<Params>>(this.BaseDialog_CustomDialogExample), new Params(this.message));
            this.getUIContext().getPromptAction().openCustomDialog(contentNode, {
              keyboardAvoidMode: KeyboardAvoidMode.NONE,
            })
            this.mText2 = this.keyboardAvoidMode2 + ''
            setTimeout(():void => {
              this.getUIContext().getPromptAction().closeCustomDialog(contentNode)
            }, 1000)
          }).backgroundColor(0x317aff)
      }.width('100%')
    }.height('100%')
  }
}
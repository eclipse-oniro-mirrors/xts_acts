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
import router from '@ohos.router';
import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,CustomDialog,
  Text,FlexDirection,ItemAlign,Divider,$r,$$,MenuItem,BlurStyleActivePolicy,AdaptiveColor,ThemeColorMode,MenuElement,
  Row,AlertDialogParamWithButtons,FlexOptions,ColumnOptions,RowOptions,Flex,Builder,MenuItemOptions,ResourceStr,Menu,BackgroundBlurStyleOptions,BlurStyle,
  Scroll,FontWeight,TextAlign,ForEach,ListItem,LocalizedBorderRadiuses,$$,SheetOptions,FlexAlign,CustomDialogController,TextInput,CustomDialogControllerOptions,
  ButtonType,Scroller,Color,Rectangle,ActionSheetOptions,ControlSize,DialogAlignment,TextInputController,Margin,BorderRadiuses
} from '@ohos.arkui.component'
import {
  State,
  Link,
  PropRef,
  Observed,
  ObjectLink,
} from '@ohos.arkui.stateManagement'
import { UIContext, Router,KeyboardAvoidMode,PromptAction } from '@ohos.arkui.UIContext';
import { AppStorage,Link } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import { BuilderNode,FrameNode } from '@ohos.arkui.node';
import { ImmersiveMode } from '@ohos.promptAction';
import { LengthMetrics,ComponentContent } from '@ohos.arkui.node';
import { Callback,BusinessError } from '@ohos.base';
import { Router } from '@ohos.arkui.UIContext';
import promptAction from '@ohos.promptAction';
let router1 =new Router()
let promptAction = new PromptAction()

@CustomDialog
struct CustomDialogExampleA {
  @Link inputValue: string=''
  controller?: CustomDialogController
  cancel: () => void = () => {}
  confirm: () => void = () => {}

  build() {
    Column() {
      Text('Change text').fontSize(20).margin({ top: 10, bottom: 10 } as Margin)
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('button').key('CustomDialog')
          .onClick(():void => {
            if (this.controller != undefined) {
              this.controller!.close()
              this.confirm()
            }
          }).backgroundColor(0xffffff).fontColor(Color.Red)
      }.margin({ bottom: 10 } as Margin)
    }.borderRadius(10)
  }
  }

@Entry
@Component
struct CustomDialogUserA {
  @State customDialogFlag1: string = 'false';
  @State customDialogFlag2: string = 'false';
  @State customDialogFlag3: string = 'false';
  @State customDialogFlag4: string = 'false';
  @State inputValue: string = 'CustomDialog生命周期'
  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogExampleA({
      inputValue: this.inputValue
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
        .onClick(():void => {
          this.dialogController?.open()
        }).backgroundColor(0x317aff)
      Text(this.customDialogFlag1).id('customDialogFlag1')
      Text(this.customDialogFlag2).id('customDialogFlag2')
      Text(this.customDialogFlag3).id('customDialogFlag3')
      Text(this.customDialogFlag4).id('customDialogFlag4')
    }.width('100%').margin({ top: 200 } as Margin)
  }
}
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
  ClickEvent,
  Text,Builder,Grid,GridItem,
  Row,AlertDialogParamWithButtons,FlexOptions,ColumnOptions,RowOptions,Flex,KeyboardAvoidMode,Dimension,DismissDialogAction,DismissReason,
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
import { UIContext, Router,PromptAction } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import { BuilderNode,FrameNode } from '@ohos.arkui.node';
import { ImmersiveMode } from '@ohos.promptAction';
import { LengthMetrics } from '@ohos.arkui.node';
import { Callback } from '@ohos.base';
import promptAction from '@ohos.promptAction';
@Entry
@Component
struct promptKeyboard {
  private customDialogComponentId: int = 0
  @State textValue: string = 'click me'
  @State modal: boolean = true
  @State mode: KeyboardAvoidMode = KeyboardAvoidMode.DEFAULT
  @State keyboardAvoidDistance :LengthMetrics = LengthMetrics.vp(20)
  @State showInSub: boolean = false
  @State heigh: Int = 200
  controller1: TextInputController = new TextInputController()
  promptAction: PromptAction = this.getUIContext().getPromptAction();

  @Builder CustomKeyboardBuilder(): void {
    Column() {
      Button('x').onClick((event: ClickEvent) => {
        this.controller1.stopEditing()
      })
      Grid() {
        ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9, '*', 0, '#'], (item:Int|string):void => {
          GridItem() {
            Button(item + '')
              .width('30%').onClick((event: ClickEvent) => {
              this.textValue += item
            })
          }
        })
      }.maxCount(3).columnsGap(10).rowsGap(10)
      .padding(5)
      .height('50%')
    }.backgroundColor(Color.Gray).id('keyboard')
  }
  @Builder customDialogComponent(): void {
    Column() {
      Row({ space: 20 } as RowOptions) {
        Button('确认').onClick((event: ClickEvent) => {
          this.promptAction.closeCustomDialog(this.customDialogComponentId)
        })
        Button('取消').onClick((event: ClickEvent) => {
          this.promptAction.closeCustomDialog(this.customDialogComponentId)
        })
      }.margin({top:0} as Margin)
      TextInput({ placeholder: '', text: this.textValue, controller: this.controller1 })
        .id('input1')
        .width('90%')
        .customKeyboard(this.CustomKeyboardBuilder,{supportAvoidance:true})
        .border({ width: 1 })
        .onChange((value: string):void => {
          this.textValue = value
        })
      Text('弹窗').fontSize(30)
    }.justifyContent(FlexAlign.SpaceBetween)
  }
  build() {
    Row() {
      Column({ space: 20 } as ColumnOptions) {
        Button('20')
          .margin({top:10} as Margin)
          .id('btn1')
          .fontSize(30)
          .onClick((event: ClickEvent) => {
            this.promptAction.openCustomDialog({
              builder: () => {
                this.customDialogComponent()
              },
              showInSubWindow: this.showInSub,
              isModal:this.modal,
              keyboardAvoidMode: this.mode,
              keyboardAvoidDistance: this.keyboardAvoidDistance,
              height: this.heigh,
              maskRect: { x: 0, y: 0, width: '100%', height: '100%' },
              maskColor: Color.Pink,
                onWillDismiss: (dismissDialogAction: DismissDialogAction):void => {
                console.info('reason' + JSON.stringify(dismissDialogAction.reason))
                console.log('dialog onWillDismiss')
                if (dismissDialogAction.reason == DismissReason.PRESS_BACK) {
                  dismissDialogAction.dismiss()
                }
                if (dismissDialogAction.reason == DismissReason.TOUCH_OUTSIDE) {
                  dismissDialogAction.dismiss()
                }
              }
            } as promptAction.CustomDialogOptions).then((dialogId: int) => {
              this.customDialogComponentId = dialogId
            })
          })
        Button('undefined')
          .margin({top:10} as Margin)
          .id('btn2')
          .fontSize(30)
          .onClick((event: ClickEvent) => {
            this.promptAction.openCustomDialog({
              builder: () => {
                this.customDialogComponent()
              },
              showInSubWindow: this.showInSub,
              isModal:this.modal,
              keyboardAvoidMode: this.mode as KeyboardAvoidMode,
              keyboardAvoidDistance: undefined,
              height: this.heigh,
              maskRect: { x: 0, y: 0, width: '100%', height: '100%' },
              maskColor: Color.Pink,
                onWillDismiss: (dismissDialogAction: DismissDialogAction):void => {
                console.info('reason' + JSON.stringify(dismissDialogAction.reason))
                console.log('dialog onWillDismiss')
                if (dismissDialogAction.reason == DismissReason.PRESS_BACK) {
                  dismissDialogAction.dismiss()
                }
                if (dismissDialogAction.reason == DismissReason.TOUCH_OUTSIDE) {
                  dismissDialogAction.dismiss()
                }
              }
            } as promptAction.CustomDialogOptions).then((dialogId: int) => {
              this.customDialogComponentId = dialogId
            })
          })
        Button('null')
          .margin({top:10} as Margin)
          .id('btn3')
          .fontSize(30)
          .onClick((event: ClickEvent) => {
            this.promptAction.openCustomDialog({
              builder: () => {
                this.customDialogComponent()
              },
              showInSubWindow: this.showInSub,
              isModal:this.modal,
              keyboardAvoidMode: this.mode as KeyboardAvoidMode,
              keyboardAvoidDistance: undefined,
              height: this.heigh,
              maskRect: { x: 0, y: 0, width: '100%', height: '100%' },
              maskColor: Color.Pink,
              onWillDismiss: (dismissDialogAction: DismissDialogAction):void => {
                console.info('reason' + JSON.stringify(dismissDialogAction.reason))
                console.log('dialog onWillDismiss')
                if (dismissDialogAction.reason == DismissReason.PRESS_BACK) {
                  dismissDialogAction.dismiss()
                }
                if (dismissDialogAction.reason == DismissReason.TOUCH_OUTSIDE) {
                  dismissDialogAction.dismiss()
                }
              }
            } as promptAction.CustomDialogOptions).then((dialogId: int) => {
              this.customDialogComponentId = dialogId
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
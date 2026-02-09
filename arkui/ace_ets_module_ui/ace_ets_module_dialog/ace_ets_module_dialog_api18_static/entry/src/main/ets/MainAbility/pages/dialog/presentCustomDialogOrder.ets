'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { LevelOrder } from '@ohos.promptAction'
import { BusinessError } from '@ohos.base'
import { UIContext } from '@ohos.arkui.UIContext'
import {  PromptAction } from '@ohos.arkui.UIContext'
import   promptAction  from '@ohos.promptAction'
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
  Week,ComponentV2,BorderStyle,ShadowStyle,
  FontWeight,RowOptions,DismissDialogAction,DismissReason,ShadowType,
  Axis,AlertDialogParamWithButtons,$r,DialogAlignment,DialogButtonStyle,DialogAlignment,
  Margin,TransitionEffect,FlexAlign,TransitionEdge,AlertDialogParamWithConfirm,
  PickerTextStyle, CalendarAlign, CalendarPicker,Builder,TextOverflow, TextHeightAdaptivePolicy,
  ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,
} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,AppStorage,Local
} from '@ohos.arkui.stateManagement';
let promptAction = new PromptAction()
@Entry
@ComponentV2
struct presentCustomDialogOrder {
  @Local message: string = 'hello'
  private ctx: UIContext = this.getUIContext()
  private promptAction: PromptAction = this.ctx.getPromptAction()
  private dialogController: promptAction.DialogController = new promptAction.DialogController()
  private customDialogComponentId: int = 0

  @Builder
  customDialogComponent() {
    Column() {
      Text(this.message)
      Button('close')
        .id('close')
        .onClick((e: ClickEvent) => {
          this.promptAction.closeCustomDialog(this.customDialogComponentId)
        })
    }
    .backgroundColor('#6582f8')
    .width('100%')
    .borderRadius(10)
    .padding(5)
    .justifyContent(FlexAlign.SpaceBetween)
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Row() {
        Button('100')
          .id('100')
          .height('8%')
          .onClick((e: ClickEvent) => {
            this.promptAction.presentCustomDialog(() => {
              this.customDialogComponent()
            }, this.dialogController, {
              levelOrder: LevelOrder.clamp(100),
              isModal: false,
              alignment: DialogAlignment.Bottom
            })
              .then((dialogId: int) => {
                this.customDialogComponentId = dialogId
              })
              .catch((err: Error): void => {
                console.error('presentCustomDialog error: ' + err.code + '' + err.message)
              })
          })

        Button('100001')
          .id('100001')
          .height('8%')
          .onClick((e: ClickEvent) => {
            this.promptAction.presentCustomDialog(() => {
              this.customDialogComponent()
            }, this.dialogController, {
              levelOrder: LevelOrder.clamp(100001),
              isModal: false,
              alignment: DialogAlignment.Bottom
            })
              .then((dialogId: int) => {
                this.customDialogComponentId = dialogId
              })
              .catch((err: Error): void => {
                console.error('presentCustomDialog error: ' + err.code + '' + err.message)
              })
          })
      }

      Row() {
        Button('-100001')
          .id('-100001')
          .height('8%')
          .onClick((e: ClickEvent) => {
            this.promptAction.presentCustomDialog(() => {
              this.customDialogComponent()
            }, this.dialogController, {
              levelOrder: LevelOrder.clamp(-100001),
              isModal: false,
              alignment: DialogAlignment.Bottom
            })
              .then((dialogId: int) => {
                this.customDialogComponentId = dialogId
              })
              .catch((err: Error): void => {
                console.error('presentCustomDialog error: ' + err.code + '' + err.message)
              })
          })

        Button('undefined')
          .id('undefined')
          .height('8%')
          .onClick((e: ClickEvent) => {
            this.promptAction.presentCustomDialog(() => {
              this.customDialogComponent()
            }, this.dialogController, {
              // levelOrder: LevelOrder.clamp(undefined),
              isModal: false,
              alignment: DialogAlignment.Bottom
            })
              .then((dialogId: int) => {
                this.customDialogComponentId = dialogId
              })
              .catch((err: Error): void => {
                console.error('presentCustomDialog error: ' + err.code + '' + err.message)
              })
          })
      }

      Button('set levelOrder')
        .id('myOrder')
        .onClick((e: ClickEvent) => {
          let presentCustomDialogOrder = this.getUIContext().getPromptAction().getTopOrder()
          if (presentCustomDialogOrder !== undefined) {
            AppStorage.setOrCreate('presentCustomDialogOrder', presentCustomDialogOrder.getOrder())
            console.error('topOrder: ' + presentCustomDialogOrder.getOrder());
          }
        })
    }
    .width('100%')
    .height('100%')
  }
}
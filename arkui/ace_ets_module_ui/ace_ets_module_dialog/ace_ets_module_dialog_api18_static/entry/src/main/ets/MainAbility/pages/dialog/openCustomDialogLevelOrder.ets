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
  Column,wrapBuilder,
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
@Entry
@Component
struct openCustomDialogLevelOrder {
  private customDialogComponentId: int = 0

  @Builder
  customDialogComponent() {
    Column() {
      Button('确认')
        .height('8%')
        .id('close')
        .onClick((e: ClickEvent) => {
          try {
            this.getUIContext().getPromptAction().closeCustomDialog(this.customDialogComponentId)
          } catch (error) {
            let message = (error as BusinessError).message;
            let code = (error as BusinessError).code;
            console.error(`closeCustomDialog error code is ${code}, message is ${message}`);
          }
        })
      Button('myOrder')
        .id('myOrder')
        .height('8%')
        .onClick((e: ClickEvent) => {
          let openCustomLevel = this.getUIContext().getPromptAction().getTopOrder()
          if (openCustomLevel !== undefined) {
            AppStorage.setOrCreate<number>('openCustomLevel', openCustomLevel.getOrder())
          }
        })
    }.padding(5).justifyContent(FlexAlign.SpaceBetween)
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Row() {
        Button('100')
          .id('100')
          .height('8%')
          .onClick((e: ClickEvent) => {
            this.getUIContext().getPromptAction().openCustomDialog({
              builder: () => {
                this.customDialogComponent()
              },
              levelOrder: LevelOrder.clamp(100),
              alignment: DialogAlignment.Bottom,
              onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
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
              .catch((err: Error): void => {
                console.error(`openCustomDialog error code is ${err.code}, message is ${err.message}`)
              })
          })

        Button('100001')
          .id('100001')
          .height('8%')
          .onClick((e: ClickEvent) => {
            this.getUIContext().getPromptAction().openCustomDialog({
              builder: () => {
                this.customDialogComponent()
              },
              levelOrder: LevelOrder.clamp(100001),
              alignment: DialogAlignment.Bottom,
              onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
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
              .catch((err: Error): void => {
                console.error(`openCustomDialog error code is ${err.code}, message is ${err.message}`)
              })
          })
      }

      Row() {
        Button('-100001')
          .id('-100001')
          .height('8%')
          .onClick((e: ClickEvent) => {
            this.getUIContext().getPromptAction().openCustomDialog({
              builder: () => {
                this.customDialogComponent()
              },
              levelOrder: LevelOrder.clamp(-100001),
              alignment: DialogAlignment.Bottom,
              onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
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
              .catch((err: Error): void => {
                console.error(`openCustomDialog error code is ${err.code}, message is ${err.message}`)
              })
          })
        Button('undefined')
          .id('undefined')
          .height('8%')
          .onClick((e: ClickEvent) => {
            this.getUIContext().getPromptAction().openCustomDialog({
              builder: () => {
                this.customDialogComponent()
              },
              // levelOrder: LevelOrder.clamp(undefined),
              alignment: DialogAlignment.Bottom,
              onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
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
              .catch((err: Error): void => {
                console.error(`openCustomDialog error code is ${err.code}, message is ${err.message}`)
              })
          })
      }
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}
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
// import { LevelOrder } from '@kit.ArkUI'
import { LevelOrder } from '@ohos.promptAction'
import { UIContext } from '@ohos.arkui.UIContext'
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
  Week,CustomDialogControllerOptions,
  FontWeight,RowOptions,CustomDialog,CustomDialogController,
  Axis,AlertDialogParamWithButtons,DialogAlignment,DialogButtonStyle,DialogAlignment,
  Margin,TransitionEffect,FlexAlign,TransitionEdge,AlertDialogParamWithConfirm,
  PickerTextStyle, CalendarAlign, CalendarPicker,Builder,TextOverflow, TextHeightAdaptivePolicy,
  ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,
} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,AppStorage
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
      Button('set levelOrder')
        .id('myOrder')
        .onClick(() : void => {
          let customOrder = this.getUIContext().getPromptAction().getTopOrder()
          if (customOrder !== undefined) {
            AppStorage.setOrCreate<number>('customLevel', customOrder.getOrder())
            console.error('topOrder: ' + customOrder.getOrder());
          }
        })
      Button('close')
        .id('close')
        .onClick(() : void => {
          this.controller?.close()
        })
    }
  }
}

@Entry
@Component
struct customDialogLevelOrder {
  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogExample({
      cancel: ()=> {},
      confirm: ()=> {}
    }),
    levelOrder: LevelOrder.clamp(100)
  } as CustomDialogControllerOptions)


  build() {
    Column({ space: 5 } as ColumnOptions) {
      Button('100')
        .id('100')
        .height('10%')
        .onClick(() : void => {
          this.dialogController = new CustomDialogController({
            builder: CustomDialogExample(),
            levelOrder: LevelOrder.clamp(100),
            alignment: DialogAlignment.Bottom,
          }as CustomDialogControllerOptions)
          if (this.dialogController != null) {
            this.dialogController!.open()
          }
        })
      Button('100001')
        .id('100001')
        .height('10%')
        .onClick(() : void => {
          this.dialogController = new CustomDialogController({
            builder: CustomDialogExample(),
            levelOrder: LevelOrder.clamp(100001),
            alignment: DialogAlignment.Bottom
          } as CustomDialogControllerOptions)
          if ( this.dialogController != null) {
            this.dialogController!.open()
          }
        })
      Button('-100001')
        .id('-100001')
        .height('10%')
        .onClick(() : void => {
          this.dialogController = new CustomDialogController({
            builder: CustomDialogExample(),
            levelOrder: LevelOrder.clamp(-100001),
            alignment: DialogAlignment.Bottom
          } as CustomDialogControllerOptions)
          if ( this.dialogController != null) {
            this.dialogController!.open()
          }
        })
      Button('undefined')
        .id('undefined')
        .height('10%')
        .onClick(() : void => {
          this.dialogController= new CustomDialogController({
            builder: CustomDialogExample(),
            levelOrder: LevelOrder.clamp(0),
            alignment: DialogAlignment.Bottom
          } as CustomDialogControllerOptions)
          if ( this.dialogController != null) {
            this.dialogController!.open()
          }
        })
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}
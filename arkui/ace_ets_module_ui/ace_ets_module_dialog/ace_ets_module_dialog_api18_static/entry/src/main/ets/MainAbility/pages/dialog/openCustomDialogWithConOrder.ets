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
  Flex,CustomBuilderT,
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
  ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController
} from '@ohos.arkui.component';
import { ComponentContent } from '@ohos.arkui.node'
import {
  State,
  Link,
  PropRef,AppStorage,Local
} from '@ohos.arkui.stateManagement';
class Params {
  public text: string = '';
  public dialogController: promptAction.DialogController = {};
  constructor(text: string, dialogController: promptAction.DialogController) {
    this.text = text;
    this.dialogController = dialogController;
  }
}

@Builder
function buildText(params: Params) {
  Column({ space: 10 } as ColumnOptions) {
    Text(params.text)
    Button('close')
      .id('close')
      .onClick((e: ClickEvent) => {
        if (params.dialogController != undefined) {
          params.dialogController.close()
        }
      })
  }
  .width('100%')
  .borderRadius(10)
  .margin({ bottom: 20 } as Margin)
  .backgroundColor('#6582f8')
}

@Entry
@ComponentV2
struct openCustomDialogWithConOrder {
  @Local message: string = 'hello'
  uiContext: UIContext = this.getUIContext();
  // promptAction: promptAction = this.uiContext.getPromptAction();
  public dialogController: promptAction.DialogController = new promptAction.DialogController()

  build() {
    Column() {
      Row() {
        Button('100')
          .id('100')
          .height('8%')
          .onClick((e: ClickEvent) => {
            let contentNode = new ComponentContent<Params>(this.uiContext, wrapBuilder(buildText), new Params(this.message, this.dialogController));
            this.uiContext.getPromptAction().openCustomDialogWithController(contentNode, this.dialogController, {
              levelOrder: LevelOrder.clamp(100),
              alignment: DialogAlignment.Bottom,
              isModal: false
            } as promptAction.BaseDialogOptions)
              .then(() => {
                console.info('succeeded')
              })
              .catch((err: Error): void => {
                console.error(`OpenCustomDialogWithController args error code is ${err.code}, message is ${err.message}`);
              })
          })
        Button('100001')
          .id('100001')
          .height('8%')
          .onClick((e: ClickEvent) => {
            let contentNode = new ComponentContent<Params>(this.uiContext, wrapBuilder<CustomBuilderT<Params>>(buildText),
              new Params(this.message, this.dialogController));
            this.uiContext.getPromptAction().openCustomDialogWithController<Params>(contentNode, this.dialogController, {
              levelOrder: LevelOrder.clamp(100001),
              alignment: DialogAlignment.Bottom,
              isModal: false
            } as promptAction.BaseDialogOptions)
              .then(() => {
                console.info('succeeded')
              })
              .catch((err: Error): void => {
                console.error(`OpenCustomDialogWithController args error code is ${err.code}, message is ${err.message}`);
              })
          })
      }

      Row() {
        Button('-100001')
          .id('-100001')
          .height('8%')
          .onClick((e: ClickEvent) => {
            let contentNode = new ComponentContent<Params>(this.uiContext, wrapBuilder<CustomBuilderT<Params>>(buildText),
              new Params(this.message, this.dialogController));
            this.uiContext.getPromptAction().openCustomDialogWithController<Params>(contentNode, this.dialogController, {
              levelOrder: LevelOrder.clamp(-100001),
              alignment: DialogAlignment.Bottom,
              isModal: false
            } as promptAction.BaseDialogOptions)
              .then(() => {
                console.info('succeeded')
              })
              .catch((error: Error): void => {
                console.error(`OpenCustomDialogWithController args error code is ${error.code}, message is ${error.message}`);
              })
          })
        Button('undefined')
          .id('undefined')
          .height('8%')
          .onClick((e: ClickEvent) => {
            let contentNode = new ComponentContent<Params>(this.uiContext, wrapBuilder<CustomBuilderT<Params>>(buildText),
              new Params(this.message, this.dialogController));
            this.uiContext.getPromptAction().openCustomDialogWithController<Params>(contentNode, this.dialogController, {
              // levelOrder: LevelOrder.clamp(undefined),
              alignment: DialogAlignment.Bottom,
              isModal: false
            } as promptAction.BaseDialogOptions)
              .then(() => {
                console.info('succeeded')
              })
              .catch((error: Error): void => {
                console.error(`OpenCustomDialogWithController args error code is ${error.code}, message is ${error.message}`);
              })
          })
      }

      Button('set levelOrder')
        .height('8%')
        .id('myOrder')
        .onClick((e: ClickEvent) => {
          let openCustomDialogWithConOrder = this.getUIContext().getPromptAction().getTopOrder()
          if (openCustomDialogWithConOrder !== undefined) {
            AppStorage.setOrCreate<number>('openCustomDialogWithConOrder', openCustomDialogWithConOrder.getOrder())
            console.error('topOrder: ' + openCustomDialogWithConOrder.getOrder());
          }
        })
    }
    .width('100%')
    .height('100%')
  }
}
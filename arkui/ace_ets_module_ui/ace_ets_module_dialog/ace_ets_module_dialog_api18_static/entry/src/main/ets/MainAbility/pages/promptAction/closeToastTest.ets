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
  PropRef,AppStorage
} from '@ohos.arkui.stateManagement';
@Entry
@Component
struct closeToastTest {
  @State toastId: int = 0;

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Button('Open Toast')
        .id('open')
        .onClick((e: ClickEvent) => {
          this.getUIContext().getPromptAction().openToast({
            message: 'Toast Massage',
            duration: 10000,
          }).then((toastId: int) => {
            this.toastId = toastId;
          })
            .catch((error: Error): void => {
              console.error(`openToast error code is ${error.code}, message is ${error.message}`)
            })
          setTimeout(() => {
            try {
              this.getUIContext().getPromptAction().closeToast(0);
            } catch (error) {
              let message = (error as BusinessError).message;
              let code = (error as BusinessError).code;
              console.error(`CloseToast error code is ${code}, message is ${message}`);
            }
          }, 1500)
          setTimeout(() => {
            try {
              // this.getUIContext().getPromptAction().closeToast(undefined);
            } catch (error) {
              let message = (error as BusinessError).message;
              let code = (error as BusinessError).code;
              console.error(`CloseToast error code is ${code}, message is ${message}`);
            }
          }, 3000)
          setTimeout(() => {
            try {
              // this.getUIContext().getPromptAction().closeToast(null);
            } catch (error) {
              let message = (error as BusinessError).message;
              let code = (error as BusinessError).code;
              console.error(`CloseToast error code is ${code}, message is ${message}`);
            }
          }, 4500)
        })
    }.height('100%').width('100%').justifyContent(FlexAlign.Center)
  }
}
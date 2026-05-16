'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the ‘License‘);
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an ‘AS IS‘ BASIS,
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
  ClickEvent,ShadowType,
  Text,FlexDirection,ItemAlign,Divider,$r,$$,MenuItem,BlurStyleActivePolicy,AdaptiveColor,ThemeColorMode,MenuElement,
  Row,AlertDialogParamWithButtons,FlexOptions,ColumnOptions,RowOptions,Flex,Builder,MenuItemOptions,ResourceStr,Menu,BackgroundBlurStyleOptions,BlurStyle,ShadowStyle,
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
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import { BuilderNode,FrameNode } from '@ohos.arkui.node';
import { ImmersiveMode } from '@ohos.promptAction';
import { LengthMetrics,ComponentContent } from '@ohos.arkui.node';
import { Callback,BusinessError } from '@ohos.base';
import { Router } from '@ohos.arkui.UIContext';
import promptAction from '@ohos.promptAction';
let router1 =new Router()

@Entry
@Component
struct showToastOptions {
  @State toastId: int = 0;

  build() {
    Column() {
      Row() {
        Button('Open')
          .height('8%')
          .id('md')
          .type(ButtonType.Capsule)
          .onClick(():void => {
            this.getUIContext().getPromptAction().openToast({
              message: 'Toast Massage',
              duration: 4000,
              backgroundColor: Color.Green,
              textColor: Color.White,
              backgroundBlurStyle: BlurStyle.Thick,
              shadow: ShadowStyle.OUTER_DEFAULT_MD,
            }).then((toastId: int) => {
              this.toastId = toastId;
            })
              .catch((error: Error) => {
                console.error(`openToast error code is ${error.code}, message is ${error.message}`)
              })
          })
        Button('Close')
          .height('8%')
          .type(ButtonType.Capsule)
          .onClick(():void => {
            try {
              this.getUIContext().getPromptAction().closeToast(this.toastId);
            } catch (error) {
              let message = (error as BusinessError).message;
              let code = (error as BusinessError).code;
              console.error(`CloseToast error code is ${code}, message is ${message}`);
            }
          })
      }

      Row() {
        Button('show2')
          .height('8%')
          .id('shadowOption')
          .onClick((event: ClickEvent) => {
          let promptAction: PromptAction = this.getUIContext().getPromptAction();
          try {
            promptAction.showToast({
              message: 'Message Info',
              duration: 4000,
              backgroundColor: Color.Green,
              textColor: Color.White,
              backgroundBlurStyle: BlurStyle.Thick,
              shadow: {
                radius: 10,
                type: ShadowType.BLUR,
                color: '#FF94A0F0',
                offsetX: 2,
                offsetY: 3,
                fill: true
              },
            });
          } catch (error) {
            let message = (error as BusinessError).message;
            let code = (error as BusinessError).code;
            console.error(`showToast args error code is ${code}, message is ${message}`);
          }
        })

        Button('show3')
          .height('8%')
          .id('xs')
          .onClick((event: ClickEvent) => {
          let promptAction: PromptAction = this.getUIContext().getPromptAction();
          try {
            promptAction.showToast({
              message: 'Message Info',
              duration: 4000,
              backgroundColor: Color.Green,
              textColor: Color.White,
              backgroundBlurStyle: BlurStyle.Thick,
              shadow: ShadowStyle.OUTER_DEFAULT_XS,
            });
          } catch (error) {
            let message = (error as BusinessError).message;
            let code = (error as BusinessError).code;
            console.error(`showToast args error code is ${code}, message is ${message}`);
          }
        })
        Button('show4')
          .height('8%')
          .id('sm')
          .onClick((event: ClickEvent) => {
          let promptAction: PromptAction = this.getUIContext().getPromptAction();
          try {
            promptAction.showToast({
              message: 'Message Info',
              duration: 4000,
              backgroundColor: Color.Green,
              textColor: Color.White,
              backgroundBlurStyle: BlurStyle.Thick,
              shadow: ShadowStyle.OUTER_DEFAULT_SM,
            });
          } catch (error) {
            let message = (error as BusinessError).message;
            let code = (error as BusinessError).code;
            console.error(`showToast args error code is ${code}, message is ${message}`);
          }
        })
      }

      Row() {
        Button('show5')
          .height('8%')
          .id('lg')
          .onClick((event: ClickEvent) => {
          let promptAction: PromptAction = this.getUIContext().getPromptAction();
          try {
            promptAction.showToast({
              message: 'Message Info',
              duration: 4000,
              backgroundColor: Color.Green,
              textColor: Color.White,
              backgroundBlurStyle: BlurStyle.Thick,
              shadow: ShadowStyle.OUTER_DEFAULT_LG,
            });
          } catch (error) {
            let message = (error as BusinessError).message;
            let code = (error as BusinessError).code;
            console.error(`showToast args error code is ${code}, message is ${message}`);
          }
        })

        Button('show6')
          .height('8%')
          .id('fsm')
          .onClick((event: ClickEvent) => {
          let promptAction: PromptAction = this.getUIContext().getPromptAction();
          try {
            promptAction.showToast({
              message: 'Message Info',
              duration: 4000,
              backgroundColor: Color.Green,
              textColor: Color.White,
              backgroundBlurStyle: BlurStyle.Thick,
              shadow: ShadowStyle.OUTER_FLOATING_SM,
            });
          } catch (error) {
            let message = (error as BusinessError).message;
            let code = (error as BusinessError).code;
            console.error(`showToast args error code is ${code}, message is ${message}`);
          }
        })
        Button('show7')
          .height('8%')
          .id('fmd')
          .onClick((event: ClickEvent) => {
          let promptAction: PromptAction = this.getUIContext().getPromptAction();
          try {
            promptAction.showToast({
              message: 'Message Info',
              duration: 4000,
              backgroundColor: Color.Green,
              textColor: Color.White,
              backgroundBlurStyle: BlurStyle.Thick,
              shadow: ShadowStyle.OUTER_FLOATING_MD,
            });
          } catch (error) {
            let message = (error as BusinessError).message;
            let code = (error as BusinessError).code;
            console.error(`showToast args error code is ${code}, message is ${message}`);
          }
        })
      }

      Row() {
        Button('show8')
          .height('8%')
          .id('nul')
          .onClick((event: ClickEvent) => {
          let promptAction: PromptAction = this.getUIContext().getPromptAction();
          try {
            promptAction.showToast({
              message: 'Message Info',
              duration: 4000,
              backgroundColor: Color.Green,
              textColor: Color.White,
              backgroundBlurStyle: BlurStyle.Thick,
              // shadow: null,
            });
          } catch (error) {
            let message = (error as BusinessError).message;
            let code = (error as BusinessError).code;
            console.error(`showToast args error code is ${code}, message is ${message}`);
          }
        })

        Button('show9')
          .height('8%')
          .id('unf')
          .onClick((event: ClickEvent) => {
          let promptAction: PromptAction = this.getUIContext().getPromptAction();
          try {
            promptAction.showToast({
              message: 'Message Info',
              duration: 4000,
              backgroundColor: Color.Green,
              textColor: Color.White,
              backgroundBlurStyle: BlurStyle.Thick,
              shadow: undefined,
            });
          } catch (error) {
            let message = (error as BusinessError).message;
            let code = (error as BusinessError).code;
            console.error(`showToast args error code is ${code}, message is ${message}`);
          }
        })
      }
    }.height('100%').width('100%').justifyContent(FlexAlign.Center)
  }
}

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
import router from '@ohos.router';
import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  ShadowStyle,
  SheetKeyboardAvoidMode,
  Text,
  FlexDirection,
  ItemAlign,
  Divider,
  $r,
  $$,
  MenuItem,
  BlurStyleActivePolicy,
  AdaptiveColor,
  ThemeColorMode,
  MenuElement,
  SheetMode,
  SheetSize,
  Placement,
  Row,
  AlertDialogParamWithButtons,
  FlexOptions,
  ColumnOptions,
  RowOptions,
  Flex,
  Builder,
  MenuItemOptions,
  ResourceStr,
  Menu,
  BackgroundBlurStyleOptions,
  BlurStyle,
  SheetType,
  Scroll,
  FontWeight,
  Resource,
  TextAlign,
  ForEach,
  ListItem,
  LocalizedBorderRadiuses,
  $$,
  SheetOptions,
  FlexAlign,
  CustomDialogController,
  TextInput,
  CustomDialogControllerOptions,
  ButtonType,
  Scroller,
  Color,
  Rectangle,
  ActionSheetOptions,
  ControlSize,
  DialogAlignment,
  TextInputController,
  Margin,
  BorderRadiuses
} from '@ohos.arkui.component'
import { State, Link, PropRef, Observed, ObjectLink, } from '@ohos.arkui.stateManagement'
import { UIContext, Router, KeyboardAvoidMode, PromptAction } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import { BuilderNode, FrameNode } from '@ohos.arkui.node';
import { ImmersiveMode } from '@ohos.promptAction';
import { LengthMetrics, ComponentContent } from '@ohos.arkui.node';
import { Callback, BusinessError } from '@ohos.base';
import { Router } from '@ohos.arkui.UIContext';
import promptAction from '@ohos.promptAction';

let router1 = new Router()
let promptAction = new PromptAction()

@Entry
@Component
struct showInSubWindowBindSheet {
  @State mPreferType: SheetType | undefined = SheetType.CENTER
  @State showInSub: boolean | undefined = false
  @State avoidMode: SheetKeyboardAvoidMode = SheetKeyboardAvoidMode.TRANSLATE_AND_SCROLL
  @State isShow: boolean = false

  @Builder
  myBuilder() {
    Column() {
      Button('close bindSheet')
        .id('closeSheet')
        .onClick((): void => {
          this.isShow = false
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Button('Open BindSheet')
        .id('openSheet')
        .onClick(():void => {
          this.isShow = true
        })
        .bindSheet($$(this.isShow), this.myBuilder, {
          mode: SheetMode.OVERLAY,
          height: SheetSize.LARGE,
          width: 300,
          enableOutsideInteractive: true,
          // detents: [SheetSize.MEDIUM, SheetSize.LARGE, 200.0] as [SheetSize|String|Double|Resource, SheetSize|undefined|String|Double|Resource, SheetSize|undefined|String|Double|Resource],
          showClose: true,
          preferType: this.mPreferType,
          title: { title: 'maintitle', subtitle: 'subtitle' },
          shadow: ShadowStyle.OUTER_DEFAULT_LG,
          borderColor: Color.Red,
          dragBar: true,
          maskColor: Color.Pink,
          keyboardAvoidMode: SheetKeyboardAvoidMode.TRANSLATE_AND_SCROLL,
          blurStyle: BlurStyle.Regular,
          showInSubWindow: this.showInSub,
          placement: Placement.Bottom,
          placementOnTarget: true,
          onHeightDidChange: ((height: int) => {
            console.log('TestTag:: height is' + height)
          }),
          onDetentsDidChange: ((height: int) => {
            console.log('TestTag:: detent is' + height)
          }),
          onTypeDidChange: ((height: SheetType) => {
            console.log('TestTag:: type is')
          }),
          onWidthDidChange: ((height: int) => {
            console.log('TestTag:: width is' + height)
          }),
          onDisappear: (() => {
            console.log('TestTag:: sheet goes to disappear')
            this.isShow = false
          })
        } as SheetOptions)
      Row({ space: 10 } as RowOptions) {
        Button('PreferType : POPUP')
          .id('popup')
          .height('8%')
          .backgroundColor(Color.Pink)
          .borderRadius(10)
          .onClick((): void => {
            this.mPreferType = SheetType.POPUP
          })
      }

      Row({ space: 10 } as RowOptions) {
        Button('showInSubWindow : true')
          .id('showInSubWindowTrue')
          .height('8%')
          .backgroundColor(Color.Pink)
          .borderRadius(10)
          .onClick((): void => {
            this.showInSub = true
          })
        Button('showInSubWindow : false')
          .id('showInSubWindowFalse')
          .height('8%')
          .backgroundColor(Color.Pink)
          .borderRadius(10)
          .onClick((): void => {
            this.showInSub = false
          })
      }

      Row({ space: 10 } as RowOptions) {
        Button('showInSubWindow : null')
          .id('showInSubWindowNull')
          .height('8%')
          .backgroundColor(Color.Pink)
          .borderRadius(10)
          .onClick((): void => {
            // this.showInSub = null
          })
        Button('showInSubWindow : undefined')
          .id('showInSubWindowUnd')
          .height('8%')
          .backgroundColor(Color.Pink)

          .borderRadius(10)
          .onClick((): void => {
            this.showInSub = undefined
          })
      }
    }
    .height('100%').width('100%')
  }
}
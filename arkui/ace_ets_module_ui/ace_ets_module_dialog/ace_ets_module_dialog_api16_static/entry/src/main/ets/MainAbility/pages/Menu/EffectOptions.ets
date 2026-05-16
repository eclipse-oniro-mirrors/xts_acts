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
  MenuOptions,
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
  BackgroundEffectOptions,
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
  Scroll,
  FontWeight,
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
  SizeOptions,
  BorderRadiuses
} from '@ohos.arkui.component'
import { State, Link, PropRef, Observed, ObjectLink, } from '@ohos.arkui.stateManagement'
import { UIContext, Router, KeyboardAvoidMode, PromptAction } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import { BuilderNode, FrameNode } from '@ohos.arkui.node';
import { ImmersiveMode, LevelMode } from '@ohos.promptAction';
import { LengthMetrics, ComponentContent } from '@ohos.arkui.node';
import { Callback, BusinessError } from '@ohos.base';
import { Router } from '@ohos.arkui.UIContext';
import promptAction from '@ohos.promptAction';

let router1 = new Router()
let promptAction = new PromptAction()

@Entry
@Component
struct backgroundEffectOptions_colorTest {
  @State listData: Array<number> = [0, 0, 0] as Array<number>
  @State text1: string = ''
  @State text2: string = ''
  @State text3: string = ''
  @State text4: string = ''
  private iconStr: ResourceStr = $r('sys.media.ohos_save_button_filled')

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ startIcon: this.iconStr, content: '菜单选项' } as MenuItemOptions)
      MenuItem({ startIcon: this.iconStr, content: '菜单选项' } as MenuItemOptions)
      MenuItem({ startIcon: this.iconStr, content: '菜单选项' } as MenuItemOptions)
    }
  }

  effectOptions: BackgroundEffectOptions = {
    radius: 60,
    saturation: 40,
    brightness: 1,
    color: Color.Orange,
  } as BackgroundEffectOptions
  blurStyle: (BlurStyle | undefined) = BlurStyle.Thin

  build() {
    Column({ space: 60 } as ColumnOptions) {
      Button('bindMenu1').fontColor(Color.Black)
        .bindMenu([
          {
            value: 'Menu1',
            action: () => {
              console.info('handle Menu1 select')
            }
          } as MenuElement,
          {
            value: 'Menu2',
            action: () => {
              console.info('handle Menu2 select')
            }
          } as MenuElement,
        ],
          {
            // backgroundEffect: this.effectOptions
          } as MenuOptions
        )
        .id('EffectOptions_btn1')
      Button('bindMenu2').fontColor(Color.Black)
        .bindMenu([
          {
            value: 'Menu1',
            action: () => {
              console.info('handle Menu1 select')
            }
          } as MenuElement,
          {
            value: 'Menu2',
            action: () => {
              console.info('handle Menu2 select')
            }
          } as MenuElement,
        ],
          {
            backgroundEffect: undefined
          } as MenuOptions
        )
        .id('EffectOptions_btn2')

      Button('bindMenu3').fontColor(Color.Black)
        .bindMenu([
          {
            value: 'Menu1',
            action: () => {
              console.info('handle Menu1 select')
            }
          } as MenuElement,
          {
            value: 'Menu2',
            action: () => {
              console.info('handle Menu2 select')
            }
          } as MenuElement,
        ],
          {
            // backgroundEffect: null
          } as MenuOptions
        )
        .id('EffectOptions_btn3')
    }
    .height('100%')
    .width('100%')
    .backgroundImage($r('app.media.icon'))
    .backgroundImageSize({ width: '100%', height: '100%' } as SizeOptions)
  }
}
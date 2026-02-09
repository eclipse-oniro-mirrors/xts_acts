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
import { CommonModifier , SymbolGlyphModifier } from '@ohos.arkui.modifier';
// xxx.ets
import router from '@ohos.router';
import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
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
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import { BuilderNode,FrameNode } from '@ohos.arkui.node';
import { ImmersiveMode } from '@ohos.promptAction';
import { LengthMetrics,ComponentContent } from '@ohos.arkui.node';
import { Callback,BusinessError } from '@ohos.base';
import { Router } from '@ohos.arkui.UIContext';
import promptAction from '@ohos.promptAction';

@Entry
@Component
struct ButtonExample {
  @State symbolIconModifier1: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_photo')).fontSize('24vp');
  @State symbolIconModifier2: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_photo')).fontSize('24vp');
  @State enabledIndex: boolean = true;
  @State enabledIndex1: boolean = true;
  @State listData: Array<number> = new Array<number>(0, 0, 0)
  @State modifier:CommonModifier = new CommonModifier().bindMenu(
    [
      {
        value: 'Menu1',
        enabled:this.enabledIndex,
        icon:$r('app.media.app_icon'),
        action: () => {
          console.info('menu action')
        }
      },
      {
        value: 'Menu1',
        enabled:this.enabledIndex,
        icon:$r('app.media.app_icon'),
        action: () => {
          console.info('handle Menu1 select')
        }
      },
    ]
  )
  @State modifier3:CommonModifier = new CommonModifier().bindMenu(
    [
      {
        value: 'Menu2',
        enabled:false,
        icon:$r('app.media.app_icon'),
        action: () => {
          console.info('Menu2 action')
        }
      },
      {
        value: 'Menu2',
        enabled:false,
        icon:$r('app.media.app_icon'),
        action: () => {
          console.info('handle Menu2 select')
        }
      },
    ]
  )

  @State modifier1:CommonModifier = new CommonModifier().bindMenu(
    [
      {
        value: 'Menu3',
        symbolIcon:this.symbolIconModifier1,
        enabled:true,
        icon:$r('app.media.app_icon'),
        action: () => {
          console.info('Menu3 action')
        }
      },
      {
        value: 'Menu3',
        symbolIcon:this.symbolIconModifier2,
        enabled:true,
        icon:$r('app.media.app_icon'),
        action: () => {
          console.info('handle Menu3 select')
        }
      },
    ]
  )
  @State modifier2:CommonModifier = new CommonModifier().bindMenu(
    [
      {
        value: 'Menu4',
        symbolIcon:this.symbolIconModifier1,
        enabled:false,
        icon:$r('app.media.app_icon'),
        action: () => {
          console.info('Menu4 action')
        }
      },
      {
        value: 'Menu4',
        symbolIcon:this.symbolIconModifier2,
        enabled:false,
        icon:$r('app.media.app_icon'),
        action: () => {
          console.info('handle Menu4 select')
        }
      },
    ]
  )

  build() {
    Column() {
      Column({ space: 10 } as ColumnOptions) {
        Row(){
          Button('弹出普通菜单(modifier) 无SymbolGlyph true', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .width(5)
          .height(5)
          .margin(5)
          .labelStyle({
            maxLines: 3
          })
          .id('btnModifier1')
          .attributeModifier(this.modifier)

        Button('弹出普通菜单(modifier) 无SymbolGlyph false', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .width(5)
          .height(5)
          .margin(5)
          .labelStyle({
            maxLines: 3
          })
          .id('btnModifier2')
          .attributeModifier(this.modifier3)
        }
        Row(){
          Button('弹出普通菜单(modifier) true', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .width(5)
          .height(5)
          .margin(5)
          .labelStyle({
            maxLines: 3
          })
          .id('btnModifier3')
          .attributeModifier(this.modifier1)

        Button('弹出普通菜单(modifier) false', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .width(5)
          .height(5)
          .margin(5)
          .labelStyle({
            maxLines: 3
          })
          .id('btnModifier4')
          .attributeModifier(this.modifier2)
        }

      }
    }
  }
}

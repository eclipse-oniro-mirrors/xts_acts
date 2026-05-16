/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static';

import { SymbolGlyphModifier } from '@ohos.arkui.modifier';
import router from '@ohos.router';
import {
  Entry,
  Column,
  Component,
  ColumnOptions,
  Builder,
  Button,
  Text,
  FlexAlign,
  ContextMenuOptions,
  ResponseType,
  Menu,
  MenuItem,
  SubMenuExpandingMode,
  $r,
  MenuItemOptions,
  MenuPreviewMode,
  PreviewScaleMode,
  AvailableLayoutArea,
  ModalMode,
  BlurStyle,
  MenuKeyboardAvoidMode,
  Color
} from '@ohos.arkui.component';
import { LengthUnit, LengthMetrics } from '@ohos.arkui.node';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import { ResourceStr } from '@ohos.arkui.component';

@Entry
@Component
struct MenuPage {
  @State startIconModifier: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_star'))
  @State endIconModifier: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_mic'))
  @State expandSymbolModifier: SymbolGlyphModifier =
    new SymbolGlyphModifier($r('sys.symbol.chevron_down')).fontColor([Color.Red]).fontSize('24vp')

  @Builder
  SubMenu() {
    Menu() {
      MenuItem({
        symbolStartIcon: this.startIconModifier,
        content: '图标'
      })
      MenuItem({
        symbolStartIcon: this.startIconModifier,
        content: '列表'
      })
    }.backgroundColor(Color.Grey)
  }

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({
        symbolStartIcon: this.startIconModifier,
        symbolEndIcon: this.endIconModifier,
        content: '新建文件夹',
        builder: (): void => this.SubMenu(),
      })
      MenuItem({
        symbolStartIcon: this.startIconModifier,
        content: '排序方式',
        builder: (): void => this.SubMenu(),
      })
      MenuItem({
        symbolStartIcon: this.startIconModifier,
        content: '查看方式',
        builder: (): void => this.SubMenu(),
      })
    }
    .key('subMenuExpandingMode')
    .subMenuExpandingMode(SubMenuExpandingMode.EMBEDDED_EXPAND)
    .backgroundColor(Color.Grey)
    .subMenuExpandSymbol(this.expandSymbolModifier)
  }

  build() {
    Column({ space: 8 } as ColumnOptions) {
      Button('click to show menu')
        .id('btnMenuPageOpen')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '90%' })
        .fontSize(10)
        .bindMenu(this.MyMenu)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .padding({ left: '3%', right: '3%', top: '2%', bottom: '2%' })
  }
}
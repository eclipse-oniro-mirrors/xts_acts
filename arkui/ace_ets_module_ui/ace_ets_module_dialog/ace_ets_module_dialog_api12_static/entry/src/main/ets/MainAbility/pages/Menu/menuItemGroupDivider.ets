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
import { SymbolGlyphModifier } from '@ohos.arkui.modifier';
import { LengthMetrics } from '@ohos.arkui.node'

import {
  Entry, Component,
  Column, ColumnOptions, Color, $r, Menu, MenuItem, MenuItemGroup,
  Text, Button, ClickEvent, Margin, MenuItemOptions, SubMenuExpandingMode,
  Flex, FlexDirection, ItemAlign, FlexAlign, DismissDialogAction,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct menuItemGroupDividerTest {
  @State text: string = ''
  @State startIconModifier: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_mic')).fontSize('24vp');
  @State endIconModifier: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_trash')).fontSize('24vp');
  @State selectIconModifier: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_trash')).fontSize('24vp');
  @State select: boolean = true;

  build() {
    Column() {
      Menu(){
        MenuItemGroup({header: '小标题' }){
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: "菜单选项",
            symbolEndIcon: this.endIconModifier
          } as MenuItemOptions)
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: "菜单选项",
            symbolEndIcon: this.endIconModifier
          } as MenuItemOptions)
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: "菜单选项",
            symbolEndIcon: this.endIconModifier
          } as MenuItemOptions)
        }
        MenuItemGroup({header: '小标题' }){
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: "菜单选项",
            symbolEndIcon: this.endIconModifier
          } as MenuItemOptions)
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: "菜单选项",
            symbolEndIcon: this.endIconModifier
          } as MenuItemOptions)
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: "菜单选项",
            symbolEndIcon: this.endIconModifier
          } as MenuItemOptions)
        }
      }.menuItemGroupDivider({strokeWidth: LengthMetrics.vp(50), color: Color.Blue}).key('menuItemGroupDividerText')
      .subMenuExpandingMode(SubMenuExpandingMode.SIDE_EXPAND)

    }
    .width('100%')
  }
}
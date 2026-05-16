'use static';
/*
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
import { LengthUnit } from '@ohos.arkui.node';
import { LengthMetrics } from '@ohos.arkui.node'
import { SymbolGlyphModifier } from '@ohos.arkui.modifier';
import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  Margin,
  ColumnOptions,
  Flex,
  Menu,
  MenuItemGroup,
  MenuItem,
  ResourceStr,
  MenuItemOptions,
  CustomBuilder,
  MenuItemGroupOptions,
  DividerStyleOptions,
  SubMenuExpandingMode
} from '@ohos.arkui.component';
import { LengthMetrics } from '@ohos.arkui.node'
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';

@Entry
@Component
struct Index {
  @State select: boolean = true
  @State arrowOffset: number = 0
  @State text: string = ''
  @State startIconModifier: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_mic')).fontSize('24vp');
  @State endIconModifier: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_trash')).fontSize('24vp');
  @State selectIconModifier: SymbolGlyphModifier =
    new SymbolGlyphModifier($r('sys.symbol.ohos_trash')).fontSize('24vp');
  private iconStr: ResourceStr = $r('app.media.icon')
  private iconStr2: ResourceStr = $r('app.media.icon')

  build() {
    Column() {
      Menu() {
        MenuItemGroup({ header: '头标', footer: '尾标' } as MenuItemGroupOptions) {
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项1',
            endIcon: this.iconStr2
          } as MenuItemOptions | CustomBuilder)
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项2',
            endIcon: this.iconStr2
          } as MenuItemOptions | CustomBuilder)
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项3',
            endIcon: this.iconStr2
          } as MenuItemOptions | CustomBuilder)
        }

        MenuItemGroup({ header: 'MenuItemGroup标题' }) {
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项一',
            endIcon: this.iconStr2,
          } as MenuItemOptions | CustomBuilder)
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项二',
            endIcon: this.iconStr2,
          } as MenuItemOptions | CustomBuilder)
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项三',
            endIcon: this.iconStr2,
          } as MenuItemOptions | CustomBuilder)
        }
      }.menuItemDivider({
        strokeWidth: LengthMetrics.vp(1.5),
        color: Color.Pink,
        startMargin: LengthMetrics.vp(2),
        endMargin: LengthMetrics.vp(2)
      } as DividerStyleOptions | undefined)
      .key('menuItemDividerText')

      Menu() {
        MenuItemGroup({ header: '头标', footer: '尾标' } as MenuItemGroupOptions) {
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项1',
            endIcon: this.iconStr2
          } as MenuItemOptions | CustomBuilder)
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项2',
            endIcon: this.iconStr2
          } as MenuItemOptions | CustomBuilder)
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项3',
            endIcon: this.iconStr2
          } as MenuItemOptions | CustomBuilder)
        }

        MenuItemGroup({ header: 'MenuItemGroup标题' } as MenuItemGroupOptions) {
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项一',
            endIcon: this.iconStr2,
          } as MenuItemOptions | CustomBuilder)
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项二',
            endIcon: this.iconStr2,
          } as MenuItemOptions | CustomBuilder)
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项三',
            endIcon: this.iconStr2,
          } as MenuItemOptions | CustomBuilder)
        }
      }.menuItemDivider({})
      .key('menuItemDividerText1')

      Menu() {
        MenuItemGroup({ header: '头标', footer: '尾标' }) {
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项1',
            endIcon: this.iconStr2
          } as MenuItemOptions | CustomBuilder)
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项2',
            endIcon: this.iconStr2
          } as MenuItemOptions | CustomBuilder)
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项3',
            endIcon: this.iconStr2
          } as MenuItemOptions | CustomBuilder)
        }

        MenuItemGroup({ header: 'MenuItemGroup标题' }) {
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项一',
            endIcon: this.iconStr2,
          } as MenuItemOptions | CustomBuilder)
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项二',
            endIcon: this.iconStr2,
          } as MenuItemOptions | CustomBuilder)
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项三',
            endIcon: this.iconStr2,
          } as MenuItemOptions | CustomBuilder)
        }
      }.menuItemDivider({
        strokeWidth: LengthMetrics.vp(-1),
        color: 'Color.Pink',
        startMargin: LengthMetrics.vp(-1),
        endMargin: LengthMetrics.vp(-1)
      })
      .key('menuItemDividerText2')

      Menu() {
        MenuItemGroup({ header: '头标', footer: '尾标' }) {
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项1',
            endIcon: this.iconStr2
          } as MenuItemOptions | CustomBuilder)
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项2',
            endIcon: this.iconStr2
          } as MenuItemOptions | CustomBuilder)
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项3',
            endIcon: this.iconStr2
          } as MenuItemOptions | CustomBuilder)
        }

        MenuItemGroup({ header: 'MenuItemGroup标题' }) {
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项一',
            endIcon: this.iconStr2,
          } as MenuItemOptions | CustomBuilder)
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项二',
            endIcon: this.iconStr2,
          } as MenuItemOptions | CustomBuilder)
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项三',
            endIcon: this.iconStr2,
          } as MenuItemOptions | CustomBuilder)
        }
      }.menuItemDivider({ color: 0 })
      .key('menuItemDividerText3')

      Menu() {
        MenuItemGroup({ header: '小标题' }) {
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          } as MenuItemOptions | CustomBuilder)
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          } as MenuItemOptions | CustomBuilder)
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          } as MenuItemOptions | CustomBuilder)
        }

        MenuItemGroup({ header: '小标题' }) {
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          } as MenuItemOptions | CustomBuilder)
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          } as MenuItemOptions | CustomBuilder)
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          } as MenuItemOptions | CustomBuilder)
        }
      }.menuItemGroupDivider({
        strokeWidth: LengthMetrics.vp(50),
        color: Color.Blue,
        startMargin: LengthMetrics.vp(2),
        endMargin: LengthMetrics.vp(2),
      })
      .key('menuItemGroupDividerText')
      .subMenuExpandingMode(SubMenuExpandingMode.SIDE_EXPAND)

      Menu() {
        MenuItemGroup({ header: '小标题' }) {
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          } as MenuItemOptions | CustomBuilder)
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          } as MenuItemOptions | CustomBuilder)
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          } as MenuItemOptions | CustomBuilder)
        }

        MenuItemGroup({ header: '小标题' }) {
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          } as MenuItemOptions | CustomBuilder)
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          } as MenuItemOptions | CustomBuilder)
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          } as MenuItemOptions | CustomBuilder)
        }
      }.menuItemGroupDivider({})
      .key('menuItemGroupDividerText1')
      .subMenuExpandingMode(SubMenuExpandingMode.EMBEDDED_EXPAND)

      Menu() {
        MenuItemGroup({ header: '小标题' }) {
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          } as MenuItemOptions | CustomBuilder)
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          } as MenuItemOptions | CustomBuilder)
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          } as MenuItemOptions | CustomBuilder)
        }

        MenuItemGroup({ header: '小标题' }) {
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          } as MenuItemOptions | CustomBuilder)
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          } as MenuItemOptions | CustomBuilder)
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          } as MenuItemOptions | CustomBuilder)
        }
      }.menuItemGroupDivider({
        strokeWidth: LengthMetrics.vp(-1),
        color: 'Color.Pink',
        startMargin: LengthMetrics.vp(-2),
        endMargin: LengthMetrics.vp(-2)
      })
      .key('menuItemGroupDividerText2')
      .subMenuExpandingMode(SubMenuExpandingMode.STACK_EXPAND)

      Menu() {
        MenuItemGroup({ header: '小标题' }) {
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          } as MenuItemOptions | CustomBuilder)
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          } as MenuItemOptions | CustomBuilder)
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          } as MenuItemOptions | CustomBuilder)
        }

        MenuItemGroup({ header: '小标题' }) {
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          } as MenuItemOptions | CustomBuilder)
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          } as MenuItemOptions | CustomBuilder)
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          } as MenuItemOptions | CustomBuilder)
        }
      }.menuItemGroupDivider({ color: 0 })
      .key('menuItemGroupDividerText3')

    }.height('100%')
    .width('100%')
    .backgroundColor('#f0f0f0')
  }
}
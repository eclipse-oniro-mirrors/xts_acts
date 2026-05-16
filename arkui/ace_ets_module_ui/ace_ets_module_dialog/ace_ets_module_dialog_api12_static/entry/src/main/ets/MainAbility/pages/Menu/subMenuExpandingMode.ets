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

import { LengthMetrics } from '@ohos.arkui.node';

import {
  Entry, Component, ResourceStr,
  Column, ColumnOptions, Color,SubMenuExpandingMode, Menu, MenuItem, MenuItemGroup,
  Text, Button, ClickEvent, Margin, Builder, MenuItemOptions, $r,
  Flex, FlexDirection, ItemAlign, FlexAlign, DismissDialogAction,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct subMenuExpandingModeTest {
  @State menuSubMenuExpandingMode: SubMenuExpandingMode | undefined = SubMenuExpandingMode.SIDE_EXPAND
  @State select: boolean = true
  private iconStr: ResourceStr = $r('app.media.icon')
  private iconStr2: ResourceStr = $r('app.media.icon')

  @Builder
  SubMenu() {
    Menu() {
      MenuItem({ content:'复制', labelInfo: 'Ctrl+C'} as MenuItemOptions)
      MenuItem({content:'粘贴', labelInfo: 'Ctrl+V'} as MenuItemOptions)
    }
    .subMenuExpandingMode(this.menuSubMenuExpandingMode)
  }

  build() {
    Menu() {
      MenuItem({ startIcon: $r('app.media.icon'), content: '菜单选项1'} as MenuItemOptions)
        .selectIcon(true)
        .selected(this.select)
        .onChange(()=>{
          this.select = ! this.select
        })
      MenuItem({ startIcon: $r('app.media.icon'), content: '菜单选项2'} as MenuItemOptions)
        .enabled(false)
      MenuItem({
        startIcon: this.iconStr,
        content: '菜单选项',
        endIcon: this.iconStr2,
        builder: this.SubMenu
      } as MenuItemOptions)
      MenuItemGroup({ header:'小标题'}) {
        MenuItem({
          startIcon: this.iconStr,
          content: '菜单选项1',
          endIcon:this.iconStr2,
          builder:this.SubMenu
        } as MenuItemOptions)
        MenuItem({
          startIcon:$r('app.media.icon'),
          content:'菜单选项2',
          endIcon: this.iconStr2,
          builder: this.SubMenu
        } as MenuItemOptions)
      }
      MenuItem({
        startIcon: this.iconStr,
        content:'菜单选项3',
      } as MenuItemOptions)
    }.menuItemDivider({ strokeWidth: LengthMetrics.vp(2),
      color: Color.Orange,
      startMargin: LengthMetrics.vp(3),
      endMargin: LengthMetrics.vp(3)}).key('menuItemDividerText')
    .subMenuExpandingMode(SubMenuExpandingMode.SIDE_EXPAND)
  }
}

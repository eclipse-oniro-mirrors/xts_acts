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
import {
  Entry, Component,
  Column, ColumnOptions, Color, ResourceStr, MenuItemOptions, MenuItemGroup, $r,
  Text, Button, ClickEvent, Margin, Row, FontWeight, Builder, Menu, MenuItem,
  Flex, FlexDirection, ItemAlign, FlexAlign, DismissDialogAction, SubMenuExpandingMode,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct SubMenuExpandingMode_Index {
  @State select: boolean = true
  private iconStr: ResourceStr = $r("app.media.icon")
  private iconStr2: ResourceStr = $r("app.media.app_icon")

  @Builder
  SubMenu() {
    Menu() {
      MenuItem({ content: "复制", labelInfo: "Ctrl+C" } as MenuItemOptions)
      MenuItem({ content: "粘贴", labelInfo: "Ctrl+V" } as MenuItemOptions)
    }
  }

  @Builder
  MyMenu(){
    Menu() {
      MenuItem({ startIcon: $r("app.media.icon"), content: "菜单选项" } as MenuItemOptions)
      MenuItem({ startIcon: $r("app.media.icon"), content: "菜单选项" } as MenuItemOptions)
        .enabled(false)
      MenuItem({
        startIcon: this.iconStr,
        content: "菜单选项",
        endIcon: this.iconStr2,
        builder: (): void => this.SubMenu()
      } as MenuItemOptions)
      MenuItemGroup({ header: '小标题' }) {
        MenuItem({
          startIcon: this.iconStr,
          content: "菜单选项",
          endIcon: this.iconStr2,
          builder: (): void => this.SubMenu()
        } as MenuItemOptions)
        MenuItem({
          startIcon: $r("app.media.app_icon"),
          content: "菜单选项",
          endIcon: this.iconStr2,
          builder: (): void => this.SubMenu()
        } as MenuItemOptions)
      }

      MenuItem({
        startIcon: this.iconStr,
        content: "菜单选项",
      } as MenuItemOptions)
    }.subMenuExpandingMode(SubMenuExpandingMode.SIDE_EXPAND).id("menu")
  }

  build() {
    Row() {
      Column() {
        Text('click to show menu')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .id('btn')
      .bindMenu(this.MyMenu)
      .width('100%')
    }
    .height('100%')
  }
}
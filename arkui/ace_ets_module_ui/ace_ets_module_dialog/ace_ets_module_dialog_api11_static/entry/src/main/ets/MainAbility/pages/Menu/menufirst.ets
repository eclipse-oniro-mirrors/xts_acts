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
import hilog from '@ohos.hilog';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '../../../../../hypium/index';
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
  MenuItemOptions,
  CustomBuilder,
  MenuItemGroupOptions,
  ResourceStr,
  Builder,
  Padding,
  FontWeight,
  ResponseType
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import testsuite from '../../../../src/test/List.test';
@Entry
@Component
struct Index {
  @State select: boolean = true
  @State arrowOffset: number = 0
  private iconStr: ResourceStr = $r("app.media.icon")

  @Builder
  ThreeLevelMenu() {
    Menu() {
      MenuItem({ content: "复制", labelInfo: "Ctrl+C" } as MenuItemOptions | CustomBuilder)
      MenuItem({ content: "粘贴", labelInfo: "Ctrl+V" } as MenuItemOptions | CustomBuilder)
    }
  }

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ startIcon: $r("app.media.icon"), content: "菜单选项" } as MenuItemOptions | CustomBuilder)
        .selectIcon(true)
        .selected(false)
      MenuItem({ startIcon: $r("app.media.icon"), content: "菜单选项" } as MenuItemOptions | CustomBuilder)
        .selectIcon(true)
        .selected(false)
      MenuItem({
        startIcon: this.iconStr,
        content: "菜单选项",
      } as MenuItemOptions | CustomBuilder).selectIcon(true).selected(false)

      MenuItemGroup({ header: '小标题' } as MenuItemGroupOptions) {
        MenuItem({ startIcon: this.iconStr, content: "菜单选项" } as MenuItemOptions | CustomBuilder)
          .selectIcon(true)
          .selected(this.select)
          .onChange((selected) => {
            console.info("menuItem select" + selected);
          })
        MenuItem({
          startIcon: this.iconStr,
          content: "菜单选项",
        } as MenuItemOptions | CustomBuilder).selectIcon(true).selected(false)
        MenuItem({
          startIcon: $r("app.media.icon"),
          content: "菜单选项",
        } as MenuItemOptions | CustomBuilder).selectIcon(true).selected(false)
      }
    }
  }

  build() {
    Column() {
      Column() {
        Text('右键点击弹出菜单')
          .key("menu")
          .fontWeight(FontWeight.Bold)
          .fontSize(30)
          .padding({ top: 20 } as Padding)
          .bindContextMenu(this.MyMenu, ResponseType.RightClick, { enableArrow: true, arrowOffset: this.arrowOffset })
      }.height('40%')
    }.height('100%')
    .width('100%')
    .backgroundColor('#f0f0f0')
  }
}
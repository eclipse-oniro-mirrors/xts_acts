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
  Builder,
  MenuItemOptions,
  CustomBuilder
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';

//Menu禁用
@Entry
@Component
struct menuEnabledDemo {
  @State mText: string = 'init'

  @Builder
  SubMenu() {
    Menu() {
      MenuItem({ content: "text1" } as MenuItemOptions | CustomBuilder)
      MenuItem({ content: "text2" } as MenuItemOptions | CustomBuilder)
    }.key("menuEnd")
  }

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({
        content: "一级菜单",
        builder: () => this.SubMenu()
      } as MenuItemOptions).key('menuEnabled')
    }.enabled(false)
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Column() {
        Text("bindMenu-禁用")
      }
      .key("bindMenuEnd")
      .width('100%')
      .margin(30)
      .bindMenu([
        {
          value: 'Menu',
          action: () => {
            console.info('handle Menu select')
          }
        }
      ])
      .enabled(false)


      Column() {
        Text('menu禁用，无法点出二级').key('cmEnd')
      }
      .bindMenu(this.MyMenu)
      .width('100%')

      Text(this.mText).key('text')
      Button('test').onClick((event: ClickEvent) => {
        this.mText = 'enabled'
      }).key('change')
    }
  }
}
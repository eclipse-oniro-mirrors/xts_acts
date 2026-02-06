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
  $r,
  $rawfile,
  Builder,
  Color,
  Column,
  ColumnOptions,
  Component,
  CopyOptions,
  CustomBuilder,
  DragItemInfo,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  ItemAlign,
  Margin,
  Menu,
  MenuItem,
  MenuItemOptions,
  MenuOptions,
  Padding,
  Placement,
  ResourceStr,
  ResponseType,
  Row,
  Text,
  TextAlign,
  TextArea,
  TouchType,
  Visibility
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct DirectiveMenuExample {
  @State bdgColor: string = 'green'
  @State fontColor: string = 'black'
  private iconStr: ResourceStr = $r("app.media.icon")

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" } as MenuItemOptions).id('close')
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" } as MenuItemOptions)
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" } as MenuItemOptions)
    }
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Column() {
        Text("longClick")
          .fontSize(20)
          .width('100%')
          .height("25%")
          .backgroundColor(this.bdgColor)
          .fontColor(this.fontColor)
          .textAlign(TextAlign.Center)
          .bindContextMenu(this.MyMenu, ResponseType.LongPress, {
            enableArrow: true,
            showInSubWindow: false,
            placement: Placement.Bottom,
            aboutToAppear: () => {
              console.log("============================== aboutToAppear");
              this.bdgColor = '#FFFF0000'
            },
            aboutToDisappear: () => {
              console.log("============================== aboutToDisappear");
              this.fontColor = '#FF0000FF'
            }
          } as MenuOptions)
          .id('aboutToAppear')
      }
    }
    .width('100%')
    .height('100%')
  }
}
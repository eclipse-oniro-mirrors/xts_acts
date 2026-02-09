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
  BlurStyle,
  Builder,
  Button,
  ButtonType,
  ClickEvent,
  Column,
  ColumnOptions,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FlexOptions,
  FontWeight,
  ItemAlign,
  Margin,
  Menu,
  MenuItem,
  MenuItemOptions,
  Placement,
  ResponseType,
  SheetSize,
  SheetType,
  Text,
  TextAlign
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';


@Entry
@Component
struct menuBlurStyleExample {
  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ startIcon: $r("app.media.icon"), content: "菜单选项" } as MenuItemOptions)
      MenuItem({ startIcon: $r("app.media.icon"), content: "菜单选项" } as MenuItemOptions)
      MenuItem({ startIcon: $r("app.media.icon"), content: "菜单选项" } as MenuItemOptions)
    }
  }

  build() {
    Column({ space: 50 } as ColumnOptions) {
      Column() {
        Column() {
          Text('menuBlurStyle')
            .key('menu_blurStyle')
            .width(200)
            .height(80)
            .textAlign(TextAlign.Center)
            .margin(100)
            .fontSize(25)
            .bindContextMenu(this.MyMenu, ResponseType.LongPress,
              {
                placement: Placement.Bottom,
                backgroundBlurStyle: BlurStyle.Thin
              })
            .backgroundColor("#ff3df2f5")
        }
      }.width('100%')
    }
  }
}
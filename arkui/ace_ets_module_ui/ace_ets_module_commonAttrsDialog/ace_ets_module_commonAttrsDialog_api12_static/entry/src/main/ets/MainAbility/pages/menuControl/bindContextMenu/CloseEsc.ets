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

import events_emitter from '@ohos.events.emitter';
import {
  Entry,Builder,Menu,MenuItem,MenuItemOptions,
  Column,
  Component,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Text,
  Button,
  FontWeight,
  ButtonType,
  ClickEvent,
  Margin,
  FlexOptions,
  ColumnOptions,
  TextAlign,
  Scroll,
  Image,
  Color,
  $rawfile,
  DragEvent,
  $r,
  ResourceStr
// ContextMenu
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '../../../../../../hypium/index';
import testsuite from '../../../../../src/test/List.test'
import {
  State
} from '@ohos.arkui.stateManagement'

@Entry
@Component
struct CloseEsc {
  private iconStr: ResourceStr = $r("app.media.icon")
  @State isShown: boolean = false

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" } as MenuItemOptions)
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" } as MenuItemOptions)
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" } as MenuItemOptions)
    }
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Text('CloseEsc')
        .textAlign(TextAlign.Center)
        .bindContextMenu(this.isShown, this.MyMenu, {
          onDisappear: () => {
          }
        })

      Button("click")
        .id("CloseEsc")
        .onClick((e:ClickEvent) => {
          this.isShown = !this.isShown;
        })
      Text(this.isShown.toString()).id("CloseEscText")
    }
    .justifyContent(FlexAlign.Center)
    .height('100%')
    .width('100%')
  }
}
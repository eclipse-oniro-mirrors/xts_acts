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
  $rawfile,
  Builder,
  Button,
  ButtonType,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Context,
  Divider,
  DragEvent,
  DragItemInfo,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FlexOptions,
  FontWeight,
  Image,
  ItemAlign,
  Margin,
  Position,
  ResponseType,
  Text,
  TextAlign
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';
import common from '@ohos.app.ability.common';

@Entry
@Component
struct bindContextMenuExample {
  onPageShow() {
    console.info('Blank page show called');
    AppStorage.setOrCreate<Context>('context', this.getUIContext().getHostContext()!)
  }

  @Builder
  MenuBuilder() {
    Flex({
      direction: FlexDirection.Column,
      alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.Center
    } as FlexOptions) {
      Button('Test ContextMenu1')
      Divider()
        .strokeWidth(2)
        .margin(5)
        .color(Color.Black)
      Button('Test ContextMenu2')
      Divider()
        .strokeWidth(2)
        .margin(5)
        .color(Color.Black)
      Button('Test ContextMenu3')
    }
    .width(200)
    .height(160)
  }

  build() {
    Flex({
      direction: FlexDirection.Column,
      alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.Center
    } as FlexOptions) {
      Column() {
        Button("Test ContextMenu")
          .id("bindContextMenu")
          .margin(100)
          .backgroundColor(0xAFEEEE)
          .bindContextMenu(this.MenuBuilder, ResponseType.LongPress)
          .onDragStart((event:DragEvent, extraParams?:String|undefined):DragItemInfo => {
            this.getUIContext().getContextMenuController().close()
            return {} as DragItemInfo
          })
      }
    }
    .width('100%')
    .height('100%')
  }
}
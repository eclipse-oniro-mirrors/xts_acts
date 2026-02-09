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

import Log from '../../common/Log';
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
  FlexDirection,
  FlexAlign,
  ItemAlign,
  TextAlign,
  TextOverflow,
  Alignment,
  Divider,
  ResponseType,
  Visibility,
  Builder
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct ResponseTypePage {
  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear ResponseType start`);
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear ResponseType end`);
  }

  @Builder
  ContextMenuBuilder() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      Text('text3')
        .fontSize(20)
        .width(100)
        .height(50)
        .textAlign(TextAlign.Center)
      Divider().height(10)
    }
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text("responseType-RightClick")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("RightClickText")
        .bindContextMenu(this.ContextMenuBuilder, ResponseType.RightClick)
        .visibility(Visibility.None)

      Text("responseType-LongPress")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("LongPressText")
        .bindContextMenu(this.ContextMenuBuilder, ResponseType.LongPress)
        .visibility(Visibility.None)

      Column() {
        Text('rightclick for menu')
      }
      .key("TestColumn")
      .width('100%')
      .margin({ top: 5 } as Margin)
      .bindContextMenu(this.ContextMenuBuilder, ResponseType.RightClick)
    }
    .width("100%")
    .height("100%")
  }
}
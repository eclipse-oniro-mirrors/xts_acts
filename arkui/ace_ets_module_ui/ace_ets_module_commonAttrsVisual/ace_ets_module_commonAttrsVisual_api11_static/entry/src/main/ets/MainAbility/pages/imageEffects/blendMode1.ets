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
import emitter from '@ohos.events.emitter';
import hilog from '@ohos.hilog';
import {
  Entry,
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
  BlendMode,
  $r,
  $$,
  SheetType,
  BindOptions,
  SheetOptions,
  Alignment,
  Color,
  Row
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage, Link } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct blendMode11 {
  build() {
    Column() {
      Column() {
        Text("BlendMode.DESTINATION_IN")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .id('blendMode11_DESTINATION_IN')
      .blendMode(BlendMode.DST_IN)
      .height('100%')
      .width('100%')
      .backgroundColor('#ff08ff00')

      Column() {
        Text("BlendMode.SOURCE_IN")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .id('blendMode11_SOURCE_IN')
      .blendMode(BlendMode.SRC_IN)
      .height('100%')
      .width('100%')
      .backgroundColor('#ff08ff00')

      Column() {
        Text("BlendMode.NORMAL")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .id('blendMode11_NORMAL')
      // .blendMode(BlendMode.NORMAL)
      .height('100%')
      .width('100%')
      .backgroundColor('#ff08ff00')
    }
  }
}
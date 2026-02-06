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
  $$,
  $r,
  AdaptiveColor,
  Alignment,
  BindOptions,
  BlurStyle,
  Button,
  ButtonType,
  Circle,
  CircleOptions,
  ClickEvent,
  Color,
  ColoringStrategy,
  Column,
  ColumnOptions,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FlexOptions,
  FontWeight,
  Image,
  ItemAlign,
  Margin,
  OverlayOffset,
  OverlayOptions,
  Padding,
  Rect,
  RectOptions,
  Row,
  Scroll,
  ShadowOptions,
  ShadowStyle,
  ShadowType,
  SheetOptions,
  SheetType,
  Text,
  TextAlign,
  ThemeColorMode
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, Link, LocalStorage, State } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';

const router = new Router()

@Entry
@Component
struct ShadowTypeStyle {
  build() {
    Column({ space: 10 } as ColumnOptions) {
      Text('ShadowType: COLOR').fontSize(15).fontColor('0xCCCCCC').width('90%')
      Image($r('app.media.icon')).id("ShadowType_COLOR")
        .width('90%')
        .height(40)
        .shadow({ type: ShadowType.COLOR, radius: 20 } as ShadowOptions)

      Text('ShadowType: BLUR').fontSize(15).fontColor('0xCCCCCC').width('90%')
      Image($r('app.media.icon')).id("ShadowType_BLUR")
        .width('90%')
        .height(40)
        .shadow({ type: ShadowType.BLUR, radius: 20 } as ShadowOptions)

      // 添加阴影效果，图片效果不变
      Text('ShadowStyle: OUTER_DEFAULT_XS').fontSize(15).fontColor('0xCCCCCC').width('90%')
      Image($r('app.media.icon'))
        .id("OUTER_DEFAULT_XS")
        .width('90%')
        .height(40)
        .shadow(ShadowStyle.OUTER_DEFAULT_XS)
        .shadow({ type: ShadowType.COLOR, radius: 20 } as ShadowOptions)

      Text('ShadowStyle: OUTER_DEFAULT_SM').fontSize(15).fontColor('0xCCCCCC').width('90%')
      Image($r('app.media.icon')).id("OUTER_DEFAULT_SM")
        .width('90%')
        .height(40)
        .shadow(ShadowStyle.OUTER_DEFAULT_SM)

      Text('ShadowStyle: OUTER_DEFAULT_MD').fontSize(15).fontColor('0xCCCCCC').width('90%')
      Image($r('app.media.icon')).id("OUTER_DEFAULT_MD")
        .width('90%')
        .height(40)
        .shadow(ShadowStyle.OUTER_DEFAULT_MD)

      Text('ShadowStyle: OUTER_DEFAULT_LG').fontSize(15).fontColor('0xCCCCCC').width('90%')
      Image($r('app.media.icon')).id("OUTER_DEFAULT_LG")
        .width('90%')
        .height(40)
        .shadow(ShadowStyle.OUTER_DEFAULT_LG)

      Text('ShadowStyle: OUTER_FLOATING_SM').fontSize(15).fontColor('0xCCCCCC').width('90%')
      Image($r('app.media.icon')).id("OUTER_FLOATING_SM")
        .width('90%')
        .height(40)
        .shadow(ShadowStyle.OUTER_FLOATING_SM)

      Text('ShadowStyle: OUTER_FLOATING_MD').fontSize(15).fontColor('0xCCCCCC').width('90%')
      Image($r('app.media.icon')).id("OUTER_FLOATING_MD")
        .width('90%')
        .height(40)
        .shadow(ShadowStyle.OUTER_FLOATING_MD)
    }.width('100%').margin({ top: 5 } as Margin)
  }
}
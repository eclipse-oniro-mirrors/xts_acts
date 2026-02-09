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
  $r,$$,SheetType,BindOptions,SheetOptions,Alignment,Color,Row,OverlayOffset,OverlayOptions,Padding,Rect,RectOptions
,BlurStyle,ThemeColorMode,AdaptiveColor,Circle,CircleOptions,ColoringStrategy,RotateOptions
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage, Link,LocalStorage } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';
import { State } from '@ohos.arkui.stateManagement'


@Entry
@Component
struct RotateOptions1 {
  build() {
    Column() {
      Text('RotateOptions').width('90%').fontColor('0xCCCCCC').padding(15).fontSize(14)
      Row().id("RotateOptions")
        .rotate({
          x: 0,
          y: 0,
          z: 1,
          centerX: '50%',
          centerY: '50%',
          centerZ: 1,
          perspective: 2,
          angle: 300
        } as RotateOptions) // 组件以矢量(0,0,1)为旋转轴，绕中心点顺时针旋转300度
        .width(100).height(100).backgroundColor('0xAFEEEE')
    }.width('100%').margin({ top: 5 } as Margin)
  }
}
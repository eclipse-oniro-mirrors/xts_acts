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
,BlurStyle,ThemeColorMode,AdaptiveColor,Circle,CircleOptions,ColoringStrategy
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage, Link,LocalStorage } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct IndexComponent {
  @State textColor: Color = Color.Black;

  onPageShow() {
    this.textColor = Color.Blue;
    console.info('IndexComponent onPageShow');
  }

  onPageHide() {
    this.textColor = Color.Transparent;
    console.info('IndexComponent onPageHide');
  }

  onBackPress() {
    this.textColor = Color.Red;
    console.info('IndexComponent onBackPress');
    return true;
  }
  aboutToReuse() {
    console.info('aboutReuse');
  }
  build() {
    Column() {
      Text('Hello World')
        .fontColor(this.textColor)
        .fontSize(30)
        .margin(30).key('customAdd')
    }.width('100%')
  }
}
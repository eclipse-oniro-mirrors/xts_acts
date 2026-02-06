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
  $r,
  $$,
  SheetType,
  BindOptions,
  SheetOptions,
  Alignment,
  Color,
  Row,
  OverlayOffset,
  OverlayOptions,
  Padding,
  Rect,
  RectOptions,
  BlurStyle,
  ThemeColorMode,
  AdaptiveColor,
  Circle,
  CircleOptions,
  ColoringStrategy,
  postCardAction
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage, Link, LocalStorage, LocalStoragePropRef } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';
import { State } from '@ohos.arkui.stateManagement'

let storage = new LocalStorage();

interface PostCardParams {
  detail: String;
}

interface PostCardActionParams {
  action: String;
  abilityName: String;
  params: PostCardParams; // 复用之前定义的 PostCardParams 接口
}

// @Entry(storage)
@Entry
@Component
struct WidgetCard {
  // @LocalStoragePropRef('detail') detail: String = 'init';

  build() {
    Column() {
      Button('跳转')
        .margin('20%')
        .onClick((e: ClickEvent) => {
          console.info('postCardAction to EntryAbility');
          postCardAction(this, {
            'action': 'router',
            'abilityName': 'EntryAbility', // 只能跳转到当前应用下的UIAbility
            'params': {
              'detail': 'RouterFromCard'
            }
          } as PostCardActionParams);
        })
      // Text(`${this.detail}`).margin('20%')
    }
    .width('100%')
    .height('100%')
  }
}
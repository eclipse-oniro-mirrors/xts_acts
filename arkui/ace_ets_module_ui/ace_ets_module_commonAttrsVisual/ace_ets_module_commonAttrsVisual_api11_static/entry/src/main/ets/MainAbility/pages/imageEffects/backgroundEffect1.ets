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
  $$,
  $r,
  AdaptiveColor,
  Alignment,
  BackgroundEffectOptions,
  BindOptions,
  Builder,
  Button,
  ButtonType,
  ClickEvent,
  Color,
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
  Position,
  Progress,
  Row,
  Scroll,
  SheetOptions,
  SheetType,
  Text,
  TextAlign
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, Link, State } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';

@Entry
@Component
struct BackgroundExample {
  @State grayscale2: Array<number> = [3, 56] as Array<number>

  @Builder
  renderBackground() {
    Column() {
      Progress({ value: 50 })
    }
  }

  build() {
    Column() {
      Text("content")
        .width(100)
        .height(40)
        .fontColor("#FFF")
        .key("texteffrct")
        .position({ x: 50, y: 80 } as Position)
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.Green)
        .backgroundEffect({
          radius: 5,
          saturation: 50,
          brightness: 100,
          color: Color.Green,
          adaptiveColor: AdaptiveColor.DEFAULT,
          blurOptions: {
            grayscale: [3, 65]
          }
        } as BackgroundEffectOptions)
    }
    .width(200).height(200)
    .background(this.renderBackground, undefined)
    .backgroundColor(Color.Gray)

  }
}
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
  BlurStyleActivePolicy,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  FontWeight,
  Margin,
  Row,
  Text,
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, Link, State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct BlurStyleActivePolicy_ALWAYS_INACTIVE {
  @State message: string = 'Hello World';
  @State mBlurStyleActivePolicy: BlurStyleActivePolicy = BlurStyleActivePolicy.ALWAYS_INACTIVE

  build() {
    Row() {
      Column() {
        Text(this.message)
          .id('ALWAYS_INACTIVE')
          .fontSize(30)
          .width(100)
          .height(100)
          .backgroundColor(Color.Green)
          .fontWeight(FontWeight.Bold)
          .backgroundEffect({ radius: 20, brightness: 10, color: Color.Red, policy: this.mBlurStyleActivePolicy })
      }
      .width('100%')
    }
    .height('100%')
  }
}
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
  Component,
  Column,
  Text,
  ForEach,
  Scroller,
  ScrollDirection,
  Color,
  Scroll,
  Margin,
  Edge,
  Row,
  TextAlign,
  BarState,
  ColumnOptions,
  Flex,
  FlexSpaceOptions,
  FlexWrap,
  Button,
  LengthMetrics,
} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
@Entry
@Component
struct FlexExample2 {
  @State value: string = 'a2'
  build() {
    Column() {
      Column({ space: 5 } as ColumnOptions) {
        Text('Wrap').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Flex({ wrap: FlexWrap.Wrap, space: { main: LengthMetrics.px(50), cross: LengthMetrics.px(50) } as FlexSpaceOptions }) {
          Button('a1')
            .id('a1')
            .nextFocus({ up: 'a2' });
          Button(this.value).id('a2')
            .nextFocus({ down: 'a3' })
            .onFocus(() => {
              this.value = 'suc'
            })
          Button(this.value).id('a3')
            .nextFocus({ left: 'a4' })
            .onFocus(() => {
              this.value = 'suc'
            })
          Button(this.value).id('a4')
            .nextFocus({ right: 'a5' })
            .onFocus(() => {
              this.value = 'suc'
            })
          Button(this.value).id('a5')
            .nextFocus({ forward: 'a6' })
            .onFocus(() => {
              this.value = 'suc'
            })
          Button(this.value).id('a6')
            .nextFocus({ backward: 'a7' })
            .onFocus(() => {
              this.value = 'suc'
            })
          Button(this.value).id('a7')
            .onFocus(() => {
              this.value = 'suc'
            })
        }
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)
      }.width('100%').margin({ top: 5 } as Margin)
    }.width('100%')
  }
}
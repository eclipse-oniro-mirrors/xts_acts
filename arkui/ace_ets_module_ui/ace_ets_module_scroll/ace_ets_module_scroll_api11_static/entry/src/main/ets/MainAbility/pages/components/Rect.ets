'use static';
/*
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
  Flex,
  Visibility,
  Button,
  Text,
  Rect,
  ClickEvent,
  FontWeight,
  Color,
  PatternLockController,
  ItemAlign,
  ColumnOptions,
  Margin,
  RectOptions
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct RectExample {
  onPageShow() {
    console.info('rect page show called');
  }

  onBuildDone() {
    console.info('rect page build done called');
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text('normal').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Rect({ width: '90%', height: 50 } as RectOptions)
      Rect().width('90%').height(50)

      Text('with rounded corners').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Rect({ width: '90%', height: 50 } as RectOptions).radiusHeight(20).radiusWidth(20)
      Rect({ width: '90%', height: 50 } as RectOptions).radius(20)
    }.width('100%').margin({ top: 5 } as Margin)
  }
}
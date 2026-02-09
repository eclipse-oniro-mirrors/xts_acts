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
  Polyline,
  ClickEvent,
  FontWeight,
  Color,
  PatternLockController,
  ItemAlign,
  ColumnOptions,
  Margin,
  FlexAlign
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct PolylineExample {
  onPageShow() {
    console.info('polyline page show called');
  }

  onBuildDone() {
    console.info('polyline page build done called');
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Polyline({ width: 100, height: 100 }).points([[0, 0], [20, 60], [100, 100]]).key('polyline')
        Polyline().width(100).height(100).points([[0, 0], [0, 100], [100, 100]]).key('polyline1')
      }.width('100%')
    }.margin({ top: 5 } as Margin)
  }
}

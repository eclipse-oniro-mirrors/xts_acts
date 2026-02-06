'use static';
/**
  * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Log from '../../common/Log';
import {Entry, Component, Flex, FlexDirection, ItemAlign, FlexAlign, Text, FlexOptions, ProgressStyleOptions, Alignment, TextAlign, ProgressOptions, TextOverflow, ProgressType, Row, RowOptions, Progress, Color} from '@ohos.arkui.component'
const TAG = 'ets_apiLack_add';

@Entry
@Component
struct ProgressStyle {
  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear ProgressStyle start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear ProgressStyle end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center } as FlexOptions) {

      Text("progress-Style")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(Color.Red)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("styleText")
      Row({ space: 40 } as RowOptions) {
        Progress({ value: 20, total: 150, type: ProgressType.ScaleRing } as ProgressOptions)
          .color(Color.Green)
          .value(50)
          .width(100)
          .style({ strokeWidth: 20, scaleCount: 30, scaleWidth: 20 } as ProgressStyleOptions)
          .key("Progress")
      }
    }.width("100%").height("100%")
  }
}


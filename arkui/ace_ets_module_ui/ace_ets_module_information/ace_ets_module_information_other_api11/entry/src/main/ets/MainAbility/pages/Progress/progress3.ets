/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct ProgressScaleCount {
  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear ProgressScaleCount start`);
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear ProgressScaleCount end`);
  }

  build() {
    Column({ space: 15 }) {
      Text('Linear Progress')
        .fontSize(9)
        .fontColor(0xCCCCCC)
        .width('90%')
      Progress({ value: 10, type: ProgressType.Linear })
        .width(200)
      Progress({ value: 20, total: 150, type: ProgressType.Linear })
        .color(Color.Grey)
        .value(50)
        .width(200)

      Text('Eclipse Progress')
        .fontSize(9)
        .fontColor(0xCCCCCC)
        .width('90%')
      Row({ space: 40 }) {
        Progress({ value: 10, type: ProgressType.Eclipse })
          .width(100)
        Progress({ value: 20, total: 150, type: ProgressType.Eclipse })
          .color(Color.Grey)
          .value(50)
          .width(100)
      }

      Text('ScaleRing Progress')
        .fontSize(9)
        .fontColor(0xCCCCCC)
        .width('90%')
      Row({ space: 40 }) {
        Progress({ value: 10, type: ProgressType.ScaleRing })
          .width(100)
        Progress({ value: 20, total: 150, type: ProgressType.ScaleRing })
          .key("progressStyleOptions")
          .color(Color.Grey)
          .value(50)
          .width(100)
          .style({ strokeWidth: 15, scaleCount: 15, scaleWidth: 5 })
      }

      Text('Ring Progress')
        .fontSize(9)
        .fontColor(0xCCCCCC)
        .width('90%')
      Row({ space: 40 }) {
        Progress({ value: 10, type: ProgressType.Ring }).width(100)
        Progress({ value: 20, total: 150, type: ProgressType.ScaleRing })
          .color(Color.Grey).value(50).width(100)
          .style({ strokeWidth: 20, scaleCount: 30, scaleWidth: 20 })
      }

      Text('Capsule Progress').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Row({ space: 40 }) {
        Progress({ value: 10, type: ProgressType.Capsule })
          .width(100)
          .height(50)
        Progress({ value: 20, total: 150, type: ProgressType.Capsule })
          .color(Color.Grey)
          .value(50)
          .width(100)
          .height(50)
      }
    }
    .width('100%')
    .margin({ top: 30 })
  }
}


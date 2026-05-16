'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
  Button,
  MouseEvent,
  MouseHistoricalPoint,
  Text
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct DisplayXExample {
  @State displayX: number = 0;
  @State displayY: number = 0;

  build() {
    Column() {
      Button('onMouse')
        .width(180)
        .height(80)
        .fontSize(24)
        .id('button04')
        .onMouse((event: MouseEvent): void => {
          this.displayX = event.displayX;
          this.displayY = event.displayY;
          let allHistoricalPoints: Array<MouseHistoricalPoint> | undefined = event.getHistoricalPoints();
          if (allHistoricalPoints && allHistoricalPoints.length > 0) {
            let lastPoint = allHistoricalPoints[allHistoricalPoints.length - 1];
            let historyDisplayX = lastPoint.displayX;
            let historyDisplayY = lastPoint.displayY;

            console.info('[TEST INFO] 实时 displayX: ' + this.displayX + ' displayY: ' + this.displayY);
            console.info('[TEST INFO] 历史点 displayX: ' + historyDisplayX + ' displayY: ' + historyDisplayY);
          }
        })
      Text(`displayY: ${this.displayY}`)
        .id('displayY')
        .fontSize(20)
    }
    .padding({ top: 30 })
    .width('100%')
  }
}
'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
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
struct globalDisplayY {
  @State globalDisplayX: number = 0;
  @State globalDisplayY: number = 0;
  @State timestamp: number = 0;

  build() {
    Column() {
      Button('onMouse')
        .id('button8')
        .width(180)
        .height(80)
        .fontSize(24)
        .onMouse((event?: MouseEvent) => {
          if (!event) {
            return;
          }
          this.globalDisplayX = event.globalDisplayX ?? 0;
          this.globalDisplayY = event.globalDisplayY ?? 0;
          this.timestamp = event.timestamp ?? 0;

          let allHistoricalPoints = event.getHistoricalPoints();
          if (allHistoricalPoints && allHistoricalPoints.length > 0) {
            for (let idx = 0; idx < allHistoricalPoints.length; idx++) {
              let point = allHistoricalPoints[idx];
              console.info('[TEST INFO] [历史点] globalDisplayX: ' + point.globalDisplayX + ' globalDisplayY: ' + point.globalDisplayY + ' timestamp: ' + point.timestamp);

              if (idx + 1 == allHistoricalPoints.length) {
                console.info('[TEST INFO] [结束] 总点数: ' + allHistoricalPoints.length);
              }
            }
          }
        })

      Text(`globalDisplayY：${this.globalDisplayY}`)
        .id('globalDisplayY')
        .fontSize(22)
        .margin({ top: 10 })
    }
    .padding({ top: 30 })
    .width('100%')
  }
}
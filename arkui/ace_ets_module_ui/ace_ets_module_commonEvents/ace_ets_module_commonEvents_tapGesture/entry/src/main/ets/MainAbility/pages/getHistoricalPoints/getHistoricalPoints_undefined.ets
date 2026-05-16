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

@Entry
@Component
struct displayX001 {
  @State displayX: number = 0;
  @State displayY: number = 0;

  build() {
    Column({ space: 20 }) {
      Button('onMouse')
        .width(180).height(80)
        .fontSize(24)
        .id('button02')
        .onMouse((event: MouseEvent): void => {
          if (!event) {
            return;
          }
          if (event.displayX !== undefined && event.displayY !== undefined) {
            this.displayX = event.displayX;
            this.displayY = event.displayY;
          }

          let allHistoricalPoints: Array<MouseHistoricalPoint> | undefined = undefined;
          if (event.getHistoricalPoints) {
            allHistoricalPoints = event.getHistoricalPoints();
          }else {
            allHistoricalPoints = undefined
          }

          if (allHistoricalPoints && allHistoricalPoints.length > 0) {
            for (let idx = 0; idx < allHistoricalPoints.length; idx++) {
              if (idx + 1 == allHistoricalPoints.length) {
                console.info("[TEST INFO] displayX: " + this.displayX + " displayY: " + this.displayY)
              }
            }
          }
        })

      Text(`${this.displayX}`)
        .id('displayX')
        .textAlign(TextAlign.Center)
        .margin({ bottom: 10 })

      Text(`${this.displayY}`)
        .id('displayY')
        .textAlign(TextAlign.Center)
        .margin({ bottom: 10 })
    }
    .padding({ top: 30 }).width('100%')
  }
}
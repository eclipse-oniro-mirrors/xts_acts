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
struct globalDisplayX {
  @State globalDisplayX: number = 0;
  @State globalDisplayY: number = 0;
  @State timestamp: number = 0;

  build() {
    Column({ space: 20 }) {
      Button('onMouse')
        .width(180).height(80)
        .fontSize(24)
        .id('button04')
        .onMouse((event: MouseEvent): void => {
          this.globalDisplayX = event.globalDisplayX!;
          this.globalDisplayY = event.globalDisplayY!;
          this.timestamp = event.timestamp;

          let allHistoricalPoints: Array<MouseHistoricalPoint> | undefined = event.getHistoricalPoints?.();
          if (allHistoricalPoints) {
            for (let idx = 0; idx < allHistoricalPoints.length; idx++) {
              if (idx + 1 == allHistoricalPoints.length) {
                console.info('[TEST INFO] globalDisplayX: ' + this.globalDisplayX + ' globalDisplayY: ' + this.globalDisplayY);
              }
            }
          }
        })

      Text(`${this.globalDisplayX}`)
        .id('globalDisplayX')
        .textAlign(TextAlign.Center)
        .margin({ bottom: 10 })

      Text(`${this.globalDisplayY}`)
        .id('globalDisplayY')
        .textAlign(TextAlign.Center)
        .margin({ bottom: 10 })
    }
    .padding({ top: 30 }).width('100%')
  }
}
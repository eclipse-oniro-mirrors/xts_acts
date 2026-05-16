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
struct windowX {
  @State windowX: number = 0;
  @State windowY: number = 0;

  build() {
    Column({ space: 20 }) {
      Button('onMouse')
        .width(180).height(80)
        .fontSize(24)
        .id('button03')
        .onMouse((event: MouseEvent): void => {
          this.windowX = event.windowX;
          this.windowY = event.windowY;
          let allHistoricalPoints: Array<MouseHistoricalPoint> | undefined = event.getHistoricalPoints?.();
          if (allHistoricalPoints) {
            for (let idx = 0; idx < allHistoricalPoints.length; idx++) {
              console.info('[TEST INFO] windowX: ' + this.windowX + ' windowY: ' + this.windowY);
              if (idx + 1 == allHistoricalPoints.length) {
                console.info('[TEST INFO] windowX: ' + this.windowX + ' windowY: ' + this.windowY + ' [end] allHistoricalPoints.length = %d',
                  allHistoricalPoints.length);
              }
            }
          }
        })
      Text(`${this.windowX}`)
        .id('windowX')
        .textAlign(TextAlign.Center)
        .margin({ bottom: 10 })
      Text(`${this.windowY}`)
        .id('windowY')
        .textAlign(TextAlign.Center)
        .margin({ bottom: 10 })
    }
    .padding({ top: 30 }).width('100%')
  }
}
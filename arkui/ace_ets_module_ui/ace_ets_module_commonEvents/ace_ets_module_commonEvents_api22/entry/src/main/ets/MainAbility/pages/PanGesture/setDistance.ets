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

import { hiTraceMeter } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct setFingersExample {
  @State offsetX: number = 0;
  @State offsetY: number = 0;
  @State positionX: number = 0;
  @State positionY: number = 0;
  @State distance: (number | null | undefined)[] = [0, -1]
  @State distanceIndex: number = 0
  @State fingers: (number | null | undefined)[] = [0, 10, -1, 11]
  @State fingersIndex: number = 0
  private panOption: PanGestureOptions = new PanGestureOptions({ direction: PanDirection.Left | PanDirection.Right });

  build() {
    Column() {
      Column() {
        Text('PanGesture offset:\nX: ' + this.offsetX + '\n' + 'Y: ' + this.offsetY)
      }
      .id('column')
      .width('60%')
      .height('30%')
      .padding(5)
      .border({ width: 3 })
      .margin(10)
      .translate({ x: this.offsetX, y: this.offsetY, z: 0 })
      .gesture(
        PanGesture(this.panOption)
          .onActionStart((event: GestureEvent) => {
            console.info('Pan start');
            hiTraceMeter.startTrace("PanGesture", 1);
          })
          .onActionUpdate((event: GestureEvent) => {
            if (event) {
              this.offsetX = this.positionX + event.offsetX;
              this.offsetY = this.positionY + event.offsetY;
            }
          })
          .onActionEnd(() => {
            this.positionX = this.offsetX;
            this.positionY = this.offsetY;
            AppStorage.setOrCreate('positionX', this.positionX)
            hiTraceMeter.finishTrace("PanGesture", 1);
          })
      )

      Button('修改PanGesture触发条件')
        .onClick(() => {
          this.panOption.setDistance(this.distance[this.distanceIndex]);
          this.panOption.setFingers(this.fingers[this.fingersIndex]);
        })
        .margin('2%')
        .width('60%')
        .height('5%')
        .id('change')
      Button('distance: ' + this.distance[this.distanceIndex])
        .id('distance')
        .width('60%')
        .height('5%')
        .margin('2%')
        .onClick(() => {
          this.distanceIndex++
          if (this.distanceIndex > 1) {
            this.distanceIndex = 0
          }
        })
      Button('fingers: ' + this.fingers[this.fingersIndex])
        .id('fingers')
        .width('60%')
        .height('5%')
        .margin('2%')
        .onClick(() => {
          this.fingersIndex++
          if (this.fingersIndex > 3) {
            this.fingersIndex = 0
          }
        })
        .width('60%')
        .height('5%')
    }.width('100%').height('90%')
  }
}
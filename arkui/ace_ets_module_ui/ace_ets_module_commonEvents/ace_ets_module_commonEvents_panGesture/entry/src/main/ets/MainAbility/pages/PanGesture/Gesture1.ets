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

@Entry
@Component
struct Gesture1Example {
  @State offsetX: number = 0
  @State offsetY: number = 0
  @State positionX: number = 0
  @State positionY: number = 0
  private panOption: PanGestureOptions = new PanGestureOptions({ direction: PanDirection.Left | PanDirection.Right })
  @State gesture1: string = "init"

  build() {
    Column() {
      Column() {
        Text('PanGesture offset:\nX: ' + this.offsetX + '\n' + 'Y: ' + this.offsetY)
      }
      .height('50%')
      .width('30%')
      .border({ width: 3 })
      .translate({ x: this.offsetX, y: this.offsetY, z: 0 }) // 以组件左上角为坐标原点进行移动
      // 左右拖动触发该手势事件
      .gesture(
        PanGesture(this.panOption)
          .onActionStart((event: GestureEvent) => {
            console.info('Pan start')
          })
          .onActionUpdate((event: GestureEvent) => {
            if (event) {
              this.offsetX = this.positionX + event.offsetX
              this.offsetY = this.positionY + event.offsetY
            }
          })
          .onActionEnd((event: GestureEvent) => {
            this.positionX = this.offsetX
            this.positionY = this.offsetY
            console.info('Pan end')
          })
      )

      Text(this.gesture1).id("gesture").height('10%').width('30%')
      Button('修改PanGesture触发条件')
        .onClick(() => {
          // 将PanGesture手势事件触发条件改为双指以任意方向拖动
          this.panOption.setDirection(PanDirection.Right)
          this.gesture1 = this.panOption.getDirection() + ""
          this.panOption.setDirection(PanDirection.All)
          AppStorage.setOrCreate('All', this.panOption.getDirection())
          this.panOption.setDirection(PanDirection.Horizontal)
          AppStorage.setOrCreate('Horizontal', this.panOption.getDirection())
          this.panOption.setDirection(PanDirection.Vertical)
          AppStorage.setOrCreate('Vertical', this.panOption.getDirection())
          this.panOption.setDirection(PanDirection.Left)
          AppStorage.setOrCreate('Left', this.panOption.getDirection())
          this.panOption.setDirection(PanDirection.Up)
          AppStorage.setOrCreate('Up', this.panOption.getDirection())
          this.panOption.setDirection(PanDirection.Down)
          AppStorage.setOrCreate('Down', this.panOption.getDirection())
          this.panOption.setDirection(PanDirection.None)
          AppStorage.setOrCreate('None', this.panOption.getDirection())
          this.panOption.setFingers(2)
        }).id('gesture1').height('10%').width('30%')
    }.height('90%').width('100%').align(Alignment.Top)
  }
}
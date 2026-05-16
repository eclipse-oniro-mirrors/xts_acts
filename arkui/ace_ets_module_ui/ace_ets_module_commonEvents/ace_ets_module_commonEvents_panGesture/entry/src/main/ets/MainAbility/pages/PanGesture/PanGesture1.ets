/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
struct PanGesture1 {
  @State angle: number = 60
  @State offsetX: number = 0
  @State offsetY: number = 0
  @State positionX: number = 0
  @State positionY: number = 0
  private panOption: PanGestureOptions = new PanGestureOptions({ direction: PanDirection.All })

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Column() {
        Column() {
          Text('RotationGesture angle:' + this.angle).key('Pan1')
          Text(String(Math.round(this.offsetX))).key('PanGesture1_1')
          Text(String(Math.round(this.offsetY))).key('PanGesture1_2')
        }
        .key('PanGesture1')
        .height("90%")
        .width("100%")
        .backgroundColor(0x008000)
        .rotate({ angle: this.angle })
        .translate({ x: this.offsetX, y: this.offsetY, z: 0 })
        .gesture(
          PanGesture(this.panOption)
            .onActionStart((event?: GestureEvent) => {
              console.info('Pan start')
            })
            .onActionUpdate((event?: GestureEvent) => {
              if (event) {
                this.offsetX = this.positionX + event.offsetX
                this.offsetY = this.positionY + event.offsetY
              }
            })
            .onActionEnd(() => {
              this.positionX = this.offsetX
              this.positionY = this.offsetY
              console.info('Pan end')
            })
        )
      }
      .height("25%")
      .width("50%")
      .backgroundColor(0xffa500)
    }
    .height('100%')
    .width('100%')
  }
}
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
struct SwipeGestureForWatch {
  @State offsetX: number = 20
  @State offsetY: number = 10
  @State rotateAngle: number = 0
  @State speed: number = 1

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Column() {
        Column() {
          Text('PanGesture offset:X:' + this.offsetX + 'Y:' + this.offsetY).key('Swipe3')
          Text(String(Math.round(this.rotateAngle))).key('Swipe4')
        }
        .key('SwipeGesture2')
        .height("90%")
        .width("100%")
        .backgroundColor(0x008000)
        .translate({x: this.offsetX, y: this.offsetY})
        .gesture(
          SwipeGesture({ direction: SwipeDirection.All })
            .onAction((event?: GestureEvent) => {
              if (event) {
                this.speed = event.speed
                this.rotateAngle = event.angle
              }
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
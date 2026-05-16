/**

 Copyright (c) 2024 Huawei Device Co., Ltd.
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 http://www.apache.org/licenses/LICENSE-2.0
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */
@Entry
@Component
struct SwipeGesture1 {
  @State angle: number = 90
  @State rotateAngle: number = 0
  @State rotateAngle1: number = 0
  @State speed: number = 1
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
    Column() {
      Column() {
        Text('RotationGesture angle:' + this.angle).key('Swipe1')
        Text(String(Math.round(this.rotateAngle))).key('Swipe2')
      }
      .key('SwipeGesture1')
      .height("90%")
      .width("100%")
      .backgroundColor(0x008000)
      .rotate({ angle: this.angle })
      .gesture(
        SwipeGesture({ direction: SwipeDirection.All })
          .onAction((event?: GestureEvent) => {
            if (event) {
              this.rotateAngle = event.angle
            }
          })
      )
      Column() {
        Text(String(Math.round(this.rotateAngle1))).key('Swipe7')
      }
      .key('SwipeGesture4')
      .height("90%")
      .width("100%")
      .backgroundColor(0x008000)
      .rotate({ angle: this.angle })
      .gesture(
        SwipeGesture({ direction: SwipeDirection.None })
          .onAction((event?: GestureEvent) => {
            if (event) {
              this.rotateAngle1 = event.angle
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
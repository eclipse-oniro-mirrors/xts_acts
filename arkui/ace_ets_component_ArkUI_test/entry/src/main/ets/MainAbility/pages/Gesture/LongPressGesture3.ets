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
struct LongPressGesture3 {
  @State scaleX: number = 0.5
  @State scaleY: number = 0.5
  @State count: number = 0

  build() {
    Column() {
      Column() {
        Text('PinchGesture center:(' + this.scaleX + ',' + this.scaleY + ')').key('LongPress5')
        Text('LongPress onAction:' + this.count).key('LongPress6')
      }
      .key('LongPressGesture3')
      .height(150)
      .width(200)
      .backgroundColor(0x008000)
      .scale({ x: this.scaleX, y: this.scaleY, z: 1 })
      .gesture(
        LongPressGesture({ repeat: true })
          .onAction((event?: GestureEvent) => {
            if (event && event.repeat) {
              this.count = 2
            }
          })
      )
    }
    .height(150)
    .width(200)
    .backgroundColor(0xffa500)
  }
}
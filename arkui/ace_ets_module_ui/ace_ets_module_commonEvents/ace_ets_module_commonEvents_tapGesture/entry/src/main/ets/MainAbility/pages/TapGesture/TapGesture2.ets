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
struct TapGesture2 {
  @State offsetX: number = 10
  @State offsetY: number = 20
  @State value: string = ''

  build() {
    Column() {
      Column() {
        Text('PanGesture offset:X:' + this.offsetX + 'Y:' + this.offsetY).key('Tap3')
        Text(this.value).key('Tap4')
      }
      .key('TapGesture2')
      .height(150)
      .width(200)
      .backgroundColor(0x008000)
      .translate({x: this.offsetX, y: this.offsetY})
      .gesture(
        TapGesture({ count: 1 })
          .onAction((event?: GestureEvent) => {
            if (event) {
              this.value = 'TapGesture'
            }
          })
      )
    }
    .height(150)
    .width(200)
    .backgroundColor(0xffa500)
  }
}
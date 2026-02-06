/*
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
struct PanGestureExample {
  @State value: string = ''
  build() {
    Column() {
      Text(this.value)
        .gesture(
          PanGesture({ fingers: 1, isFingerCountLimited: true })
            .onActionStart((event: GestureEvent) => {
              if (event) {
                this.value = 'success'
              }
            })
        )
        .id('PanGesture')
        .height('40%')
        .width('90%')
        .padding(20)
        .border({ width: 3 })
        .margin(10)
      Button('clear')
        .id('clear')
        .onClick(() => {
          this.value = ''
        })
    }.width('100%')
  }
}
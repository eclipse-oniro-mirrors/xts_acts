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
struct PinchGestureEvent1 {
  @State value: string = ''
  build() {
    Column() {
      Text(this.value)
        .gesture(
          PinchGesture()
            .onActionStart((event: GestureEvent) => {
              this.value = '' + event.targetDisplayId
            })
        )
        .id('PinchGesture1')
        .height('40%')
        .width('90%')
        .padding(20)
        .border({ width: 3 })
        .margin(10)
    }.width('100%')
  }
}
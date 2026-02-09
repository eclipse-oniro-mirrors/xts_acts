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
struct AxisEventExample {
  @State text: string = ''
  @State text1: string = ''

  build() {
    Column() {
      Row({ space: 20 }) {
        Button('AxisEvent')
          .width('50%')
          .height('20%')
          .id('button')
          .onAxisEvent((event?: AxisEvent) => {
            if (event) {
              this.text =
                'axisPinch:' + event.axisPinch;
              this.text1 =
                'PinchAxisScaleValue:' + event.getPinchAxisScaleValue();
            }
          })
      }.margin(20)

      Text(this.text)
        .width('100%')
        .height('5%')
        .id('text')
      Text(this.text1)
        .width('100%')
        .height('5%')
        .id('text1')
    }.width('100%').height('100%')
  }
}
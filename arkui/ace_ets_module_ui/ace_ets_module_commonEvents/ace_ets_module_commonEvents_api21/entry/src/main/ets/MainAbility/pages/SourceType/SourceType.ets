/*
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
struct PanGestureSourceType {
  @State sourceType1: SourceType = SourceType.TouchScreen
  @State sourceType2: SourceType = SourceType.KEY
  @State sourceType3: SourceType = SourceType.JOYSTICK
  private panOption: PanGestureOptions = new PanGestureOptions({ direction: PanDirection.Left | PanDirection.Right })

  build() {
    Column() {
      Column() {
        Button('' + this.sourceType1).id('sourceType1_id')
      }
      .id('PanGestureSourceTypeColumn')
      .height('30%')
      .width('30%')
      .padding(20)
      .border({ width: 3 })
      .margin(50)
      .gesture(
        PanGesture(this.panOption)
          .onActionStart((event: GestureEvent) => {
            console.info('Pan start')
          })
          .onActionUpdate((event: GestureEvent) => {
            if (event) {
              this.sourceType1 = event.source
            }
          })
          .onActionEnd((event: GestureEvent) => {
            console.info('Pan end')
          })
      )
      .gesture(
        TapGesture()
          .onAction((event: GestureEvent) => {
            console.info('tap start')
            if (event) {
              this.sourceType1 = event.source
            }
          })
      )

      Button('change SourceType_KEY')
        .id('changeSourceType2_id')
        .width(300)
        .height(60)
        .margin(10)
        .fontSize(14)
        .onClick(() => {
          this.sourceType1 = this.sourceType2
        })
      Button('change SourceType_JOYSTICK')
        .id('changeSourceType3_id')
        .width(300)
        .height(60)
        .margin(10)
        .fontSize(14)
        .onClick(() => {
          this.sourceType1 = this.sourceType3
        })
    }
  }
}
/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct measureFromViewport {
  @State ratio1: number = 0.0;
  @State ratio2: number = 0.0;

  build() {
    Column() {
      Text(`nratio: ${this.ratio1}`).width('100%')
      Column() {
        Row() {
          Row() {

          }
          .backgroundColor(Color.Blue)
          .height('60%')
          .width('100%')
          .offset({ x: 0, y: '60%' })
          // measureFromViewport设置为true，父组件未设置clip(true)，超出父组件的区域被视为可见区域。
          .onVisibleAreaApproximateChange({
            ratios: [0.0, 1.0],
            expectedUpdateInterval: 500,
            measureFromViewport: true
          }, (isExpanding: boolean, currentRatio: number) => {
            this.ratio1 = currentRatio
            AppStorage.setOrCreate('measureFromViewportIsTrue', this.ratio1)
          })
        }
        .backgroundColor(Color.Pink)
        .height('60%')
        .width('100%')
      }
      .padding(5)
      .borderWidth(1)
      .height('40%')
      .width('80%')

      Text(`nratio: ${this.ratio2}`).width('100%')
      Column() {
        Row() {
          Row() {

          }
          .backgroundColor(Color.Blue)
          .height('60%')
          .width('100%')
          .offset({ x: 0, y: '60%' })
          // 不设置measureFromViewport，measureFromViewport默认为false，父组件未设置clip(true)，超出父组件的区域被视为不可见区域。
          .onVisibleAreaApproximateChange({
            ratios: [0.0, 1.0],
            expectedUpdateInterval: 500,
            measureFromViewport: false
          }, (isExpanding: boolean, currentRatio: number) => {
            this.ratio2 = currentRatio
            AppStorage.setOrCreate('measureFromViewportIsFalse', this.ratio2)
          })
        }
        .backgroundColor(Color.Pink)
        .height('60%')
        .width('100%')
      }
      .padding(5)
      .borderWidth(1)
      .height('40%')
      .width('80%')
    }
    .height('90%')
    .width('100%')
  }
}


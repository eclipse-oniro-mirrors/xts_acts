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

class MyModifier implements GestureModifier {
  public value: string = ''
  public distanceThresholdList: (number | undefined | null) [] =
    [undefined, 200.55, -100, NaN, Infinity]
  public distanceThresholdIndex: number = 0

  applyGesture(event: UIGestureEvent): void {
    event.addGesture(
      new TapGestureHandler({
        count: 1,
        fingers: 1,
        isFingerCountLimited: false,
        distanceThreshold: this.distanceThresholdList[this.distanceThresholdIndex]
      })
        .tag(' TapGesture')
        .onAction((event: GestureEvent | undefined) => {
          if (event) {
            console.info(' TapGestureHandler ')
            console.info(' Tap_fingerList: ', JSON.stringify(event.fingerList))
            this.value = JSON.stringify(event.fingerList[0])
          }
        })

    )
  }
}

@Entry
@Component
struct distanceThreshold {
  @State modifier: MyModifier = new MyModifier()
  @State value001: string = ''

  build() {
    Column() {
      Column() {
        Column()
          .key('test_Column')
          .height('60%')
          .width('100%')
          .gestureModifier(this.modifier)
          .backgroundColor(Color.Blue)

        Row({ space: 2 }) {
          Button('点击')
            .key('onClick')
            .onClick(() => {
              this.value001 = this.modifier.value
            })

          Button('切换:'+this.modifier.distanceThresholdList[this.modifier.distanceThresholdIndex])
            .key('onClick01')
            .onClick(() => {
              this.modifier.distanceThresholdIndex++
              if (this.modifier.distanceThresholdIndex > (this.modifier.distanceThresholdList.length - 1)) {
                this.modifier.distanceThresholdIndex = 0
              }
            })
        }
        
        Text(this.value001).key('text')

      }
      .height('45%')
      .width('55%')
      .border({ width: 1 })
      .margin(10)

    }
    .height('100%')
    .width('100%')
  }
}


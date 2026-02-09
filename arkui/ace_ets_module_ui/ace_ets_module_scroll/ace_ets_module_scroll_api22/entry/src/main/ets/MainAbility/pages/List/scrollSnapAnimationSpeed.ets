/**
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
interface Speed {
  scrollSnapAnimationSpeed: string;
}

interface InspectorInfo {
  $attrs: Speed;
}
@Entry
@Component
struct ListOriExample {
  @State arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  @State arrIndex: number = 10;
  @State speedIndex: number = 0;
  @State speedList: (  undefined | null | ScrollSnapAnimationSpeed)[] = [
    ScrollSnapAnimationSpeed.SLOW,
    ScrollSnapAnimationSpeed.NORMAL,
    1,
    undefined,
    -1,
  ]
  @State speedValue: string = '0'

  build() {
    Column() {
      Button(`更改111SpeedIndex:`+this.speedIndex).onClick(() => {
        this.speedIndex = this.speedIndex + 1;
        if (this.speedIndex >= this.speedList.length) {
          this.speedIndex = 0
        }
      })
        .id('speedBtn')
      Button('getInspectorByKey')
        .onClick(() => {
          let msg = getInspectorByKey('List');
          let a: InspectorInfo = JSON.parse(msg) as InspectorInfo;
          this.speedValue = a?.$attrs?.scrollSnapAnimationSpeed
        })
        .id('getKeyBtn')
      Text(this.speedValue).fontColor(Color.Blue).key('speedValue')
      List() {
        ForEach(this.arr, (item: number, index?: number) => {
          ListItem() {
            Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
              Text('' + item)
                .width('100%')
                .height('10%')
                .textAlign(TextAlign.Center)
                .backgroundColor(0xFFFFFF)
            }
          }.backgroundColor(Color.Blue)
        }, (item: string) => item)

      }
      .id('List')
      .scrollSnapAnimationSpeed(this.speedList[this.speedIndex])
      .scrollSnapAlign(ScrollSnapAlign.CENTER)
      .width('90%')
      .height('30%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}

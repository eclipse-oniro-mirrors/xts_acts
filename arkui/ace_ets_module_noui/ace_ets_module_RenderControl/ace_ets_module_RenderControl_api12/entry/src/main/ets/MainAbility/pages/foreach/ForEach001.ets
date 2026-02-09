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
@Entry
@ComponentV2
struct ForEachwithAnimateTo {
  @Local simpleList: string[] = [];
  @Local rotateAngle: number = 0;
  @Local arrLast: string = this.simpleList[this.simpleList.length - 1];
  aboutToAppear(): void {
    for (let i = 0; i < 20; i++) {
      this.simpleList.push('item' + i);
    }
  }
  build() {
    Column({space: 10}) {
      Button('stop rotating')
        .height('5%')
        .margin(50)
        .rotate({ x: 0, y: 0, z: 1, angle: this.rotateAngle })
        .onAppear(() => {
          this.getUIContext()?.animateTo({
            duration: 1200,
            curve: Curve.Friction,
            delay: 500,
            iterations: -1,
            playMode: PlayMode.Alternate,
            expectedFrameRateRange: {
              min: 10,
              max: 120,
              expected: 60,
            }
          }, () => {
            this.rotateAngle = 90;
          })
        })
        .onClick(() => {
          this.getUIContext()?.animateTo({ duration: 0 }, () => {
            this.rotateAngle = 0;
          })
        })
      Divider()
      Row() {
        Text(this.arrLast)
          .id('arrLastStr')
        Button('add date')
          .id('addDate')
          .height('3%')
          .onClick(() => {
            for (let i = 0; i < 51; i++) {
              this.simpleList.push('new item' + i);
            }
            this.arrLast = this.simpleList[this.simpleList.length - 1];
          })
      }
      List({ space: 10 }) {
        ForEach(this.simpleList, (item: string) => {
          ListItem() {
            Text(item)
              .fontColor(Color.Red)
          }
        }, (item: string) => item)
      }
      .width('100%')
      .height('100%')
      .listDirection(Axis.Vertical)
    }
  }
}

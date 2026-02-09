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
@ComponentV2
struct IfElseChild {
  @Param str: string = 'ww';
  @Param color: Color = Color.Blue;
  @Consumer('fontColor') fontColor: string = 'blue';

  aboutToAppear(): void {
    if (this.color === Color.Blue) {
      this.fontColor = 'blue';
    } else {
      this.fontColor = 'red';
    }
  }
  build() {
    Column(){
      Text(this.str)
        .fontColor(this.color)
    }
  }
}
@Entry
@ComponentV2
struct IfElsewithAnimateTo {
  @Local simpleList: string[] = [];
  @Local rotateAngle: number = 0;
  @Local flag: boolean = true;
  @Provider('fontColor') fontColor: string = 'red';
  aboutToAppear(): void {
    for (let i = 0; i < 10; i++) {
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
        Text(this.fontColor)
          .id('fontColor')
        Button('change flag')
          .id('flag')
          .height('3%')
          .onClick(() => {
            this.flag = !this.flag;
          })
      }
      ForEach(this.simpleList, (item: string) => {
        if (this.flag) {
          IfElseChild({str: item, color: Color.Blue})
        } else {
          IfElseChild({str: item, color: Color.Red})
        }
      }, (item: string) => item)

    }
  }
}

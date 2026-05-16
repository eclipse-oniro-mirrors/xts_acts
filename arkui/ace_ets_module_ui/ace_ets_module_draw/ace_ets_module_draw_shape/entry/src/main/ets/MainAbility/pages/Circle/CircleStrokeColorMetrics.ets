/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { ColorMetrics } from '@kit.ArkUI';

type ColorChannel = 'Red' | 'Green' | 'Blue' | 'White';

@Entry
@Component
struct CircleStrokeColorMetrics {
  @State hdrValue: number = 1;
  @State selectedChannel: ColorChannel = 'Red';

  private buildHDRColor(): ColorMetrics {
    let r = 0;
    let g = 0;
    let b = 0;
    switch (this.selectedChannel) {
      case 'Red':
        r = this.hdrValue;
        break;
      case 'Green':
        g = this.hdrValue;
        break;
      case 'Blue':
        b = this.hdrValue;
        break;
      case 'White':
        r = this.hdrValue;
        g = this.hdrValue;
        b = this.hdrValue;
        break;
    }
    return ColorMetrics.createHDRColor(ColorSpace.BT2020, r, g, b, 1);
  }

  private getSDRColor(): ResourceColor {
    switch (this.selectedChannel) {
      case 'Red': return '#FF0000';
      case 'Green': return '#00FF00';
      case 'Blue': return '#0000FF';
      case 'White': return '#FFFFFF';
      default: return '#FF0000';
    }
  }

  build() {
    Column({ space: 3 }) {
      Text(`测试通道: ${this.selectedChannel} | HDR 倍率: ${this.hdrValue.toFixed(1)}`)
        .height(20)
      Row({space:10}){
        Circle()
          .id('CircleStrokeColorMetrics1')
          .width(40)
          .height(40)
          .strokeWidth(7)
          .stroke(this.buildHDRColor())
        Circle()
          .id('CircleStrokeColorMetrics2')
          .width(40)
          .height(40)
          .strokeWidth(7)
          .stroke(this.getSDRColor())
      }
      Row({ space:2 }) {
        Button('红色')
          .id('ChangeCircleColorRed')
          .width(70)
          .height(20)
          .fontColor(Color.White)
          .backgroundColor(this.selectedChannel)
          .onClick(() => {
            this.selectedChannel = 'Red';
          })
        Button('绿色')
          .id('ChangeCircleColorGreen')
          .width(70)
          .height(20)
          .fontColor(Color.White)
          .backgroundColor(this.selectedChannel)
          .onClick(() => {
            this.selectedChannel = 'Green';
          })
      }
      Row({ space:2 }) {
        Button('蓝色')
          .id('ChangeCircleColorBlue')
          .width(70)
          .height(20)
          .fontColor(Color.White)
          .backgroundColor(this.selectedChannel )
          .onClick(() => {
            this.selectedChannel = 'Blue';
          })
        Button('白色')
          .id('ChangeCircleColorWhite')
          .width(70)
          .height(20)
          .fontColor(Color.White)
          .backgroundColor(this.selectedChannel )
          .onClick(() => {
            this.selectedChannel = 'White';
          })
      }

      Row({ space: 2 }) {
        Button('减少 (-0.5)')
          .id('ChangeCircleColorReduce')
          .width(80)
          .height(20)
          .onClick(() => {
            this.hdrValue = Math.max(-2, this.hdrValue - 0.5);
          })

        Button('增加 (+0.5)')
          .id('ChangeCircleColorAdd')
          .width(80)
          .height(20)
          .onClick(() => {
            this.hdrValue = Math.min(10, this.hdrValue + 0.5);
          })
      }
    }
    .width('100%')
    .height('100%')
  }
}
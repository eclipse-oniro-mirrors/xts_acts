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
import { BusinessError } from '@kit.BasicServicesKit';

type ColorChannel = 'Red' | 'Green' | 'Blue' | 'White';

@Entry
@Component
struct CanvasGradientCreateHDRColor {
  @State hdrValue: number = 1.0;
  @State selectedChannel: ColorChannel = 'Red';

  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);

  private getSDRColor(): string {
    switch (this.selectedChannel) {
      case 'Red': return '#FF0000';
      case 'Green': return '#00FF00';
      case 'Blue': return '#0000FF';
      case 'White': return '#FFFFFF';
      default: return '#FF0000';
    }
  }
  private drawCanvas() {
    this.context.clearRect(0, 0, 1000, 1000);
    let gradSDR = this.context.createLinearGradient(85, 10, 160, 110)
    try {
      gradSDR.addColorStop(0.0, '#000000')
      gradSDR.addColorStop(0.5, this.getSDRColor())
      gradSDR.addColorStop(1.0, '#000000')
    } catch (error) {
      console.error(`SDR addColorStop error`);
    }
    this.context.fillStyle = gradSDR
    this.context.fillRect(10, 10, 150, 150)

    this.context.fillStyle = '#FFFFFF';
    this.context.font = '16px sans-serif';
    this.context.textAlign = 'center';
    this.context.fillText('SDR', 85, 180);

    let gradHDR = this.context.createLinearGradient(245, 10, 320, 110)

    let r = 0;
    let g = 0;
    let b = 0;
    switch (this.selectedChannel) {
      case 'Red': r = this.hdrValue; break;
      case 'Green': g = this.hdrValue; break;
      case 'Blue': b = this.hdrValue; break;
      case 'White': r = this.hdrValue; g = this.hdrValue; b = this.hdrValue; break;
    }

    try {
      gradHDR.addColorStop(0.0, ColorMetrics.createHDRColor(ColorSpace.BT2020, 0.0, 0.0, 0.0, 1.0))
      gradHDR.addColorStop(0.5, ColorMetrics.createHDRColor(ColorSpace.BT2020, r, g, b, 1.0))
      gradHDR.addColorStop(1.0, ColorMetrics.createHDRColor(ColorSpace.BT2020, 0.0, 0.0, 0.0, 1.0))
    } catch (error) {
      let e: BusinessError = error as BusinessError;
      console.error(`HDR addColorStop error. Code: ${e.code}, message: ${e.message}`);
    }

    this.context.fillStyle = gradHDR
    this.context.fillRect(170, 10, 150, 150)

    this.context.fillStyle = '#FFFFFF';
    this.context.fillText(`HDR (${this.hdrValue.toFixed(1)})`, 245, 180);
  }

  build() {
    Column({ space:3 }) {
      Text(`通道: ${this.selectedChannel} | HDR倍率: ${this.hdrValue.toFixed(1)}`)
        .height(15)
      Canvas(this.context)
        .id('CanvasGradientCreateHDRColor')
        .width(180)
        .height(50)
        .backgroundColor('#000000')
        .onReady(() => {
          this.drawCanvas();
        })
      Row({ space:2 }) {
        Button('红色')
          .id('ChangeCanvasColorRed')
          .width(70)
          .height(20)
          .fontColor(Color.White)
          .backgroundColor(this.selectedChannel)
          .onClick(() => {
            this.selectedChannel = 'Red';
            this.drawCanvas();
          })
        Button('绿色')
          .id('ChangeCanvasColorGreen')
          .width(70)
          .height(20)
          .fontColor(Color.White)
          .backgroundColor(this.selectedChannel)
          .onClick(() => {
            this.selectedChannel = 'Green';
            this.drawCanvas();
          })
       }
      Row({ space:2 }) {
        Button('蓝色')
          .id('ChangeCanvasColorBlue')
          .width(70)
          .height(20)
          .fontColor(Color.White)
          .backgroundColor(this.selectedChannel )
          .onClick(() => {
            this.selectedChannel = 'Blue';
            this.drawCanvas();
          })
        Button('白色')
          .id('ChangeCanvasColorWhite')
          .width(70)
          .height(20)
          .fontColor(Color.White)
          .backgroundColor(this.selectedChannel )
          .onClick(() => {
            this.selectedChannel = 'White';
            this.drawCanvas();
          })
      }
      Row({ space: 2 }) {
        Button('减少')
          .id('ChangeCanvasColorReduce')
          .height(20)
          .width(70)
          .onClick(() => {
            this.hdrValue = parseFloat((Math.max(0, this.hdrValue - 0.5)).toFixed(1));
            this.drawCanvas();
          })
        Button('增加')
          .id('ChangeCanvasColorAdd')
          .height(20)
          .width(70)
          .onClick(() => {
            this.hdrValue = parseFloat((Math.min(10, this.hdrValue + 0.5)).toFixed(1));
            this.drawCanvas();
          })
      }
      Text('增加数值观察右侧 HDR 亮度变化')
        .height(20)
    }
    .width('100%')
    .height('100%')
  }
}
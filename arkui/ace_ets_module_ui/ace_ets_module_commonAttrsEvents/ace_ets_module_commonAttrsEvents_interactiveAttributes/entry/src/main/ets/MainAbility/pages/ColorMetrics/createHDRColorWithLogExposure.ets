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

interface PresetColor {
  exposure: number | undefined;
  colorSpace: ColorSpace;
  r: number | undefined;
  g: number;
  b: number;
  alpha?: number | undefined;
  desc: string;
}

@Entry
@Component
struct createHDRColorWithLogExposure {
  @State currentColor: ColorMetrics =
    ColorMetrics.createHDRColorWithLogExposure(undefined, ColorSpace.DISPLAY_P3, 0, 0, 0, undefined);
  @State exposure: number | undefined = undefined;
  @State colorSpace: ColorSpace = ColorSpace.SRGB;
  @State redValue: number | undefined = 0;
  @State greenValue: number = 0;
  @State blueValue: number = 0;
  @State alphaValue: number | undefined = undefined;
  private presetColors: PresetColor[] = [
    {
      exposure: NaN,
      colorSpace: ColorSpace.DISPLAY_P3,
      r: 0,
      g: 0,
      b: 0,
      alpha: 1,
      desc: 'NaN-DISPLAY_P3'
    },
    {
      exposure: 0,
      colorSpace: ColorSpace.SRGB,
      r: 1.1,
      g: 0.3,
      b: -1,
      alpha: 1,
      desc: '0-SRGB'
    },
  ];

  aboutToAppear() {
    this.updateColor();
  }

  updateColor() {
    this.currentColor =
      ColorMetrics.createHDRColorWithLogExposure(this.exposure, this.colorSpace, this.redValue, this.greenValue,
        this.blueValue, this.alphaValue);
  }

  getColorSpaceName(space: ColorSpace): string {
    switch (space) {
      case ColorSpace.SRGB:
        return 'SRGB';
      case ColorSpace.DISPLAY_P3:
        return 'DISPLAY_P3';
      default:
        return 'UNKNOWN';
    }
  }

  build() {
    Scroll() {
      Column({ space: '2%' }) {
        Text('createHDRColorWithLogExposure Test')
          .width('90%')
          .textAlign(TextAlign.Center)
          .margin({ top: '2%' })

        Column() {
          Text('Current Color')
            .margin({ bottom: '1%' })

          Column({ space: '1%' }) {
            Text(`${this.getColorSpaceName(this.colorSpace)}`)
              .id('logColorSpaceText')

            Text(`RGB(${this.redValue !== undefined ? this.redValue.toFixed(2) :
              'undefined'}, ${this.greenValue.toFixed(2)}, ${this.blueValue.toFixed(2)})`)
              .id('logRgbText')

            Text(`Alpha: ${this.alphaValue !== undefined ? this.alphaValue.toFixed(2) : 'undefined'}`)
              .id('logAlphaText')

            Text(`Exposure: ${this.exposure}`)
              .id('logExposureText')
          }
          .padding('2%')
        }
        .width('90%')
        .margin({ top: '2%' })

        Text('Preset Colors (Click to Apply)')
          .width('90%')
          .margin({ top: '2%' })

        Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.SpaceBetween }) {
          ForEach(this.presetColors, (item: PresetColor, index: number) => {
            Column({ space: '1%' }) {
              Column()
                .width('100%')
                .height('8%')
                .backgroundColor(ColorMetrics.createHDRColorWithLogExposure(item.exposure, item.colorSpace, item.r ?? 0,
                  item.g, item.b, item.alpha))
                .borderRadius('1%')

              Text(item.desc)
                .fontColor(Color.Grey)
                .textAlign(TextAlign.Center)
            }
            .width('45%')
            .margin({ bottom: '2%' })
            .id(`logPresetBtn${index + 1}`)
            .onClick(() => {
              this.exposure = item.exposure;
              this.colorSpace = item.colorSpace;
              this.redValue = item.r;
              this.greenValue = item.g;
              this.blueValue = item.b;
              this.alphaValue = item.alpha;
              this.updateColor();
            })
          })
        }
        .width('90%')

        Image($r('app.media.ic'))
          .fillColor(this.currentColor)
          .width('90%')
          .height('10%')
          .id('logTestImage')
          .margin({ top: '2%' })

        Blank().height('3%')
      }
      .width('100%')
      .padding({ left: '3%', right: '3%' })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFFFFF')
  }
}
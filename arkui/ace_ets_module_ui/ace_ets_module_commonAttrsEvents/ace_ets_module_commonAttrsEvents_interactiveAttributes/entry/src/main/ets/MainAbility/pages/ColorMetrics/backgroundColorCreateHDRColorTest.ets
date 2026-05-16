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
  colorSpace: ColorSpace;
  r: number;
  g: number;
  b: number;
  alpha: number | undefined;
  desc: string;
}

@Entry
@Component
struct backgroundColorCreateHDRColorTest {
  @State currentColor: ColorMetrics = ColorMetrics.createHDRColor(ColorSpace.SRGB, 0, 2, 2, 0.5);
  @State colorSpace: ColorSpace = ColorSpace.SRGB;
  @State redValue: number = 0;
  @State greenValue: number = 2;
  @State blueValue: number = 2;
  @State alphaValue: number | undefined = 0.5;
  private presetColors: PresetColor[] = [
    {
      colorSpace: ColorSpace.SRGB,
      r: 0,
      g: 2.0,
      b: 2.0,
      alpha: 0.5,
      desc: 'SRGB RGB(0, 2.0, 2.0)'
    },
    {
      colorSpace: ColorSpace.DISPLAY_P3,
      r: 0,
      g: 10,
      b: 1,
      alpha: undefined,
      desc: 'DISPLAY_P3 RGB(0, 10, 1)'
    },
  ];

  aboutToAppear() {
    this.updateColor();
  }

  updateColor() {
    this.currentColor =
      ColorMetrics.createHDRColor(this.colorSpace, this.redValue, this.greenValue, this.blueValue, this.alphaValue);
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
        Text('createHDRColor Test')
          .width('90%')
          .textAlign(TextAlign.Center)
          .margin({ top: '2%' })

        Text('backgroundColor & fillColor with ColorMetrics')
          .fontColor(Color.Grey)
          .width('90%')
          .textAlign(TextAlign.Center)

        Column() {
          Text('Current Color Display')
            .margin({ bottom: '1%' })

          Stack() {
            Column()
              .width('100%')
              .height('100%')
              .backgroundColor(this.currentColor)
              .borderRadius('2%')
              .id('colorDisplayBg')

            Column({ space: '1%' }) {
              Text(`${this.getColorSpaceName(this.colorSpace)}`)
                .id('colorSpaceText')

              Text(`RGB(${this.redValue.toFixed(2)}, ${this.greenValue.toFixed(2)}, ${this.blueValue.toFixed(2)})`)
                .id('rgbText')

              Text(`Alpha: ${this.alphaValue !== undefined ? this.alphaValue.toFixed(2) : 'undefined'}`)
                .id('alphaText')
            }
            .padding('2%')
          }
          .width('90%')
          .height('15%')
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
                .backgroundColor(ColorMetrics.createHDRColor(item.colorSpace, item.r, item.g, item.b, item.alpha))
                .borderRadius('1%')

              Text(item.desc)
                .fontColor(Color.Grey)
                .textAlign(TextAlign.Center)
            }
            .width('45%')
            .margin({ bottom: '2%' })
            .id(`presetBtn${index + 1}`)
            .onClick(() => {
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
          .id('testImage')
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
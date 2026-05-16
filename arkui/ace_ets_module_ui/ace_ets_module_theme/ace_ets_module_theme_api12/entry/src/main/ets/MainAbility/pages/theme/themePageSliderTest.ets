/**
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

import { CustomTheme, CustomColors, CustomDarkColors } from '@ohos.arkui.theme';

class GreenColors implements CustomColors {
  compBackgroundPrimary = '#ff049404';
  ompBackgroundPrimaryTran = '#FF00541F';
  compBackgroundPrimaryContrary = '#FFFFFFFF';
  compBackgroundSecondary = '#1111FF11';
  compBackgroundTertiary = '#FF00541F';
  compBackgroundEmphasiz = '#3322FF22';
  compBackgroundNeutral = '#FFFFFFFF'
  compEmphasizeSecondary = '#44FF2222'
  compEmphasizeTertiary = '#33FF1111'
}

class RedColors implements CustomColors {
  fontPrimary = '#fff32b3c';
  fontEmphasize = '#FFD53032';
  fontOnPrimary = '#FFFFFFFF';
  compBackgroundTertiary = '#44FF2222';
  backgroundEmphasize = '#FFD00000';
  compEmphasizeSecondary = '#33FF1111';
}

class PageCustomTheme implements CustomTheme {
  colors?: CustomColors
  darkColors?: CustomDarkColors

  constructor(colors: CustomColors) {
    this.colors = colors
  }
}

@Entry
@Component
struct themeSliderPage {
  static readonly themeCount = 3;
  themeNames: string[] = ['System', 'Custom (green)', 'Custom (red)'];
  themeArray: (CustomTheme | undefined)[] = [
    undefined, // System
    new PageCustomTheme(new GreenColors()),
    new PageCustomTheme(new RedColors())
  ]
  @State themeIndex: number = 0;

  build() {
    Column() {
      Column({ space: '8vp' }) {
        Text(`未使用WithTheme`)
        // 点击按钮切换局部换肤
        Button(`切换theme配色：${this.themeNames[this.themeIndex]}`)
          .onClick(() => {
            this.themeIndex = (this.themeIndex + 1) % themeSliderPage.themeCount;
          }).key('themeSliderClick')

        // 系统默认按钮配色
        Text('block').fontSize(9).fontColor(0xCCCCCC).margin(15).width('90%')
        Slider({ style: SliderStyle.OutSet, value: 40 })
          .blockSize({ width: 40, height: 40 })
          .blockBorderColor(Color.Red)
          .blockBorderWidth(5)
        Divider()
        Text('step').fontSize(9).fontColor(0xCCCCCC).margin(15).width('90%')
        Slider({ style: SliderStyle.InSet, value: 40, step: 10 })
          .showSteps(true)
          .stepSize(8)
          .stepColor(Color.Yellow)
        Divider()
        Text('track').fontSize(9).fontColor(0xCCCCCC).margin(15).width('90%')
        Slider({ style: SliderStyle.InSet, value: 40 })
          .trackBorderRadius(2)
        Divider()
      }
      .margin({
        top: '50vp'
      })

      WithTheme({ theme: this.themeArray[this.themeIndex] }) {
        // WithTheme作用域
        Column({ space: '8vp' }) {
          Text(`使用WithTheme`).key('themeText')
          Text('block').fontSize(9).fontColor(0xCCCCCC).margin(15).width('90%')
          Slider({ style: SliderStyle.OutSet, value: 40 })
            .blockSize({ width: 40, height: 40 })
            .blockBorderColor(Color.Red)
            .blockBorderWidth(5)
          Divider()
          Text('step').fontSize(9).fontColor(0xCCCCCC).margin(15).width('90%')
          Slider({ style: SliderStyle.InSet, value: 40, step: 10 })
            .showSteps(true)
            .stepSize(8)
            .stepColor(Color.Yellow)
          Divider()
          Text('track').fontSize(9).fontColor(0xCCCCCC).margin(15).width('90%')
          Slider({ style: SliderStyle.InSet, value: 40 })
            .selectedColor("#EEFF00FF")
            .trackBorderRadius(2).key('sliderBg')
          Divider()
        }
        .width('100%')
      }
    }
  }
}
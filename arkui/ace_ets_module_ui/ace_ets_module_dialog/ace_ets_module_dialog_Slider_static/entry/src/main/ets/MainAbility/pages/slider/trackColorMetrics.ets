
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
import { Entry, Column, Component, Flex, FlexDirection, ItemAlign, FlexAlign, Text, Button, FontWeight,
  Row, ClickEvent, Margin, ButtonType, TextPicker, Color,
  ColorMetrics, Scroll, SliderChangeMode, Slider, SliderOptions, $r, SliderStyle } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { ColorMetrics, ColorSpace, ColorMetricsLinearGradient, ResourceColor, LinearGradient,  } from '@kit.ArkUI'
import ConfigurationConstant from '@ohos.app.ability.ConfigurationConstant';
import common from '@ohos.app.ability.common';
@Entry
@Component
struct trackColorMetricsTest {
  @State greenColor: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0.0, 1.0, 0.0, 1);
  @State yellowColor: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1.0, 1.0, 0.0, 1);
  @State redColor: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1.0, 0.0, 0.0, 1);
  @State errorColor1: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, -1, -1, -1, -1);
  @State pinkColor: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1.0, 0.75, 0.8, 1);
  @State blueColor: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0.0, 0.0, 1.0, 1);
  @State purpleColor: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0.5, 0.0, 0.5, 1);
  @State orangeColor: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1.0, 0.65, 0.0, 1);
  @State cyanColor: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0.0, 1.0, 1.0, 1);
  @State magentaColor: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1.0, 0.0, 1.0, 1);
  @State brownColor: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0.65, 0.16, 0.16, 1);
  @State tealColor: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0.0, 0.5, 0.5, 1);
  @State lavenderColor: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0.9, 0.9, 1.0, 1);
  @State oliveColor: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0.5, 0.5, 0.0, 1);
  @State coralColor: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1.0, 0.5, 0.31, 1);
  @State navyColor: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0.0, 0.0, 0.5, 1);
  @State limeColor: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0.0, 1.0, 0.0, 1);
  @State maroonColor: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0.5, 0.0, 0.0, 1);
  @State electricBlue: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0.0, 0.47, 1.0, 1);
  @State neonGreen: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0.0, 1.0, 0.5, 1);
  @State darkPurple: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0.28, 0.0, 0.51, 1);

  @State Color2: ColorMetricsLinearGradient =
    new ColorMetricsLinearGradient([
      { color: this.blueColor ?? this.greenColor, offset: 0 },
      { color: this.greenColor ?? this.coralColor, offset: 0.05 },
      { color: this.coralColor ?? this.yellowColor, offset: 0.1 },
      { color: this.darkPurple ?? this.oliveColor, offset: 0.15 },
      { color: this.oliveColor ?? this.lavenderColor, offset: 0.2 },
      { color: this.lavenderColor ?? this.tealColor, offset: 0.25 },
      { color: this.tealColor ?? this.brownColor, offset: 0.3 },
      { color: this.brownColor ?? this.magentaColor, offset: 0.35 },
      { color: this.magentaColor ?? this.cyanColor, offset: 0.4 },
      { color: this.cyanColor ?? this.orangeColor, offset: 0.45 },
      { color: this.orangeColor ?? this.purpleColor, offset: 0.5 },
      { color: this.purpleColor ?? this.blueColor, offset: 0.55 },
      { color: this.blueColor ?? this.pinkColor, offset: 0.6 },
      { color: this.pinkColor ?? this.navyColor, offset: 0.65 },
      { color: this.navyColor ?? this.limeColor, offset: 0.7 },
      { color: this.limeColor ?? this.maroonColor, offset: 0.75 },
      { color: this.maroonColor ?? this.electricBlue, offset: 0.8 },
      { color: this.electricBlue ?? this.neonGreen, offset: 0.85 },
      { color: this.neonGreen ?? this.darkPurple, offset: 0.9 },
      { color: this.darkPurple ?? this.pinkColor, offset: 0.95 },
      { color: this.pinkColor ?? this.orangeColor, offset: 1 }
    ])
  @State inSetValueOne: Double = 10;

  // 修改为联合类型
  @State beginColor : ColorMetrics | undefined = this.greenColor;
  @State endColor : ColorMetrics | undefined = this.greenColor;
  @State beginColorr : ResourceColor| undefined  = '#ff00ff19';
  @State endColorr : ResourceColor | undefined= '#ff00ff19';

  @State color: ColorMetricsLinearGradient =
    new ColorMetricsLinearGradient([
      { color: this.beginColor ?? this.greenColor, offset: 0 },
      { color: this.endColor ?? this.greenColor, offset: 1 }
    ])
  @State colorr: LinearGradient =
    new LinearGradient([
      { color: this.beginColorr ?? '#ff00ff19', offset: 0 },
      { color: this.endColorr ?? '#ff00ff19', offset: 1 }
    ])
  @State Color1: ColorMetricsLinearGradient =
    new ColorMetricsLinearGradient([
      { color: this.blueColor , offset: 0 },
      { color: this.redColor , offset: 0.7 },
      { color: this.yellowColor , offset: 0.3 },
      { color: this.blueColor , offset: 1 }
    ])

  @State Color3: ColorMetricsLinearGradient =
    new ColorMetricsLinearGradient([
      { color: this.redColor , offset: 0 },
      { color: this.blueColor , offset: 1 }
    ])

  @State Color4: ColorMetricsLinearGradient =
    new ColorMetricsLinearGradient([
      { color: this.redColor , offset: 1 }
    ])
  build() {
    Scroll(){
      Column() {
        Row(){
          Slider({
            value: this.inSetValueOne,
            min: 0,
            max: 100,
            style: SliderStyle.InSet
          } as SliderOptions).id('Slider0')
            .width('80%')
            .blockColor('#FF0000')
            .trackColor( $r('sys.color.ohos_id_color_component_normal'))
            .selectedColor('#4169E1')
            .showTips(true)
        }

        Row(){
          Text('静态设值').fontSize(15).fontColor(Color.Gray).margin(10)
          Slider({
            value: this.inSetValueOne,
            min: 0,
            max: 100,
            style: SliderStyle.InSet
          }).id('Slider1')
            .width('80%')
            .blockColor('#FF0000')
            .trackColorMetrics(this.Color3)
            .selectedColor('#4169E1')
            .showTips(true)
        }

        Row(){
          Slider({
            value: this.inSetValueOne,
            min: 0,
            max: 100,
            style: SliderStyle.InSet
          }).id('Slider2')
            .width('80%')
            .blockColor('#FF0000')
            .trackColorMetrics(undefined)
            .selectedColor('#4169E1')
            .showTips(true)
        }

        Row(){
          Slider({
            value: this.inSetValueOne,
            min: 0,
            max: 100,
            style: SliderStyle.InSet
          }).id('Slider3')
            .width('80%')
            .blockColor('#FF0000')
            // .trackColorMetrics(null)
            .selectedColor('#4169E1')
            .showTips(true)
        }

        Text('异常顺序:0-0.3:蓝~黄；0.3-0.7：黄~红；0.7-1：红~蓝').fontSize(15).fontColor(Color.Gray).margin(10)
        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        }).id('Slider4')
          .width('80%')
          .blockColor('#FF0000')
          .trackColorMetrics(this.Color1)
          .selectedColor('#4169E1')
          .showTips(true)
          .onChange((value: Double, mode: SliderChangeMode) => {
            this.inSetValueOne = value;
            console.info('value:' + value + 'mode:' + mode.toString());
          })

        Text('多次设置：从0~1，由橘色至蓝色均匀渐变').fontSize(15).fontColor(Color.Gray).margin(10)
        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        }).id('Slider5')
          .width('80%')
          .blockColor('#FF0000')
          .trackColorMetrics(this.Color1)
          .trackColorMetrics(this.Color2)
          .trackColorMetrics(this.Color3)
          .selectedColor('#4169E1')
          .showTips(true)

        Text('同时设置，先trackColor后trackColorMetrics：从0~1，由橘色至蓝色均匀渐变').fontSize(15).fontColor(Color.Gray).margin(10)
        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        }).id('Slider6')
          .width('80%')
          .blockColor('#FF0000')
          .trackColor(Color.Pink)
          .trackColorMetrics(this.Color3)
          .selectedColor('#4169E1')
          .showTips(true)

        Text('同时设置，先trackColorMetrics后trackColor：全部粉色').fontSize(15).fontColor(Color.Gray).margin(10)
        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        }).id('Slider7')
          .width('80%')
          .blockColor('#FF0000')
          .trackColorMetrics(this.Color3)
          .trackColor(Color.Red)
          .selectedColor('#4169E1')
          .showTips(true)
        Row(){
          Text('单颜色：Red').fontSize(15).fontColor(Color.Gray).margin(10)
          Slider({
            value: this.inSetValueOne,
            min: 0,
            max: 100,
            style: SliderStyle.InSet
          }).id('Slider8')
            .width('80%')
            .blockColor('#FF0000')
            .trackColorMetrics(this.Color4)
            .selectedColor('#4169E1')
            .showTips(true)
        }
      }
    }
  }
}


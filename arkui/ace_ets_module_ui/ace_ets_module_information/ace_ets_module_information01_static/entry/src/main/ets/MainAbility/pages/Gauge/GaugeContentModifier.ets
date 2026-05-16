/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static'

import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  Row,
  WrappedBuilder,
  wrapBuilder,
  Builder,
  ContentModifier,
  DataPanel,
  DataPanelType,
  DataPanelConfiguration,
  Alignment,
  Line,
  ForEach,
  RelativeContainer,
  Rect,
  Color,
  Gauge,
  GaugeOptions,
  GaugeConfiguration,
  HorizontalAlign,
  FlexAlign,
  LoadingProgress,
  LoadingProgressConfiguration,
  Progress,
  ProgressType,
  ProgressConfiguration,
  Flex,
  Path,
  TextClock,
  TextClockConfiguration,
  TextClockController,
  TimePickerFormat,
  TimePicker,
  TextTimer,
  TextTimerConfiguration,
  TextTimerController,
  Circle,
  Stack,
  AttributeModifier,
  DataPanelAttribute,
  GaugeAttribute,
  LoadingProgressAttribute,
  ProgressAttribute,
  TextClockAttribute,
  TextTimerAttribute,
  QRCode,
  $r,
  List,
  ListItem,
  Badge,
  BadgeParamWithNumber,
  BadgeParamWithString,
  BadgeStyle,
  BadgePosition,
  Image,
  ImageRotateOrientation,
  ColorMetrics,
  ColorContent,
  ImageErrorCallback,
  ImageError,
  DatePicker,
  DatePickerAttribute,
  DatePickerDialogOptions,
  Scroll,
  CustomBuilderT,
  ContentModifier
} from '@ohos.arkui.component'
import { State, Link, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import promptAction from '@ohos.promptAction'
import { LevelOrder, LevelMode } from '@ohos.promptAction'
import { UIContext } from '@ohos.arkui.UIContext'

@Builder
function buildGauge(config: GaugeConfiguration): void {
  Column() {
    Text('【ContentModifier】 value:' + JSON.stringify((config.contentModifier as MyGaugeStyle).value) +
      '  min:' + JSON.stringify((config.contentModifier as MyGaugeStyle).min) +
      '  max:' + JSON.stringify((config.contentModifier as MyGaugeStyle).max))
      .fontSize(12).align(Alignment.Start).id('gauge_contentModifier')
    Text('【Config】value：' + config.value + ' min：' + config.min + '  max：' + config.max)
      .fontSize(12)
      .align(Alignment.Start)
      .id('gauge')
    Row() {
      Gauge({
        value: (config.contentModifier as MyGaugeStyle).value,
        min: (config.contentModifier as MyGaugeStyle).min,
        max: (config.contentModifier as MyGaugeStyle).max
      })
        .width('40%')
        .height('70%')
      Gauge({ value: (config.value) }).width('40%')
        .height('70%')
    }
  }
  .width('100%')
  .alignItems(HorizontalAlign.Center)
}

class MyGaugeStyle implements ContentModifier<GaugeConfiguration> {
  public value: number = 0
  public min: number = 0
  public max: number = 0

  constructor(value: number, min: number, max: number) {
    this.value = value
    this.min = min
    this.max = max
  }

  applyContent(): WrappedBuilder<CustomBuilderT<GaugeConfiguration>> {
    return wrapBuilder<CustomBuilderT<GaugeConfiguration>>(buildGauge)
  }
}

@Observed
class GaugeModifier implements AttributeModifier<GaugeAttribute> {
  applyNormalAttribute(instance: GaugeAttribute): void {
    instance.contentModifier(new MyGaugeStyle(30, 20, 100))
  }
}

// Index.ets
@Entry
@Component
struct Index {
  @State gaugeValue: number = 50
  @State gaugeMin: number = 0
  @State gaugeMax: number = 100
  gaugeModifier: GaugeModifier = new GaugeModifier()

  build() {
    Scroll() {

      Column() {
        // Gauge ContentModifier
        Text('2. Gauge').width('80%').fontSize(20).align(Alignment.Start)
        Gauge({ value: this.gaugeValue })
          .width('100%')
          .height('25%')
          .attributeModifier(this.gaugeModifier)
        Row() {
          Button('增加').onClick((e: ClickEvent) => {
            if (this.gaugeValue < this.gaugeMax) {
              this.gaugeValue += 10
            }
          })
            .id('add')
          Button('减少').onClick((e: ClickEvent) => {
            if (this.gaugeValue > this.gaugeMin) {
              this.gaugeValue -= 10
            }
          })
            .id('delete')
        }
      }.width('100%')
    }
  }
}

@Component
struct ChildItem {
  @State item: number;
  @State index: Int;
  @State max: number;
  public color1: string = '#65ff00dd'
  public color2: string = '#6500ff99'
  public color3: string = '#65ffe600'
  public color4: string = '#6595ff00'
  public color5: string = '#65000dff'
  public color6: string = '#650099ff'
  public colorArray: Array<string> = [this.color1, this.color2, this.color3, this.color4, this.color5, this.color6]

  build() {
    RelativeContainer() {
      Row() {
        Rect()
          .height(25)
          .width(this.item * 600 / this.max)
          .foregroundColor((this.index < 0 || this.index >= this.colorArray.length) ? this.colorArray[0] :
            this.colorArray[this.index])
          .radius(5)
          .align(Alignment.Start)
        Text(' ' + this.item)
          .fontSize(17)
      }
    }.height(28)
  }
}

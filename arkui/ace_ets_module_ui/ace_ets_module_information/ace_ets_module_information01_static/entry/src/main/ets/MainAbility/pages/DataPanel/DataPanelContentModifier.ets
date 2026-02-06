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
function buildDataPanel(config: DataPanelConfiguration): void {
  Column() {
    Text('length:' + config.values.length + ' ' + 'max:' + config.maxValue).align(Alignment.Start).id('dataPanel')
    Column() {
      ForEach(config.values, (item: number, index: Int) => {
        const idx = index;
        ChildItem({ item: item, index: idx, max: config.maxValue })
      }, (item: number, index: Int) => item.toString())
    }
  }
}

class MyDataPanelStyle implements ContentModifier<DataPanelConfiguration> {
  public color: Color = Color.Black

  constructor(color: Color) {
    this.color = color
  }

  applyContent(): WrappedBuilder<CustomBuilderT<DataPanelConfiguration>> {
    return wrapBuilder<CustomBuilderT<DataPanelConfiguration>>(buildDataPanel);
  }
}

class DataPanelModifier implements ContentModifier<DataPanelConfiguration> {
  constructor() {
  }

  applyContent(): WrappedBuilder<CustomBuilderT<DataPanelConfiguration>> {
    return wrapBuilder<CustomBuilderT<DataPanelConfiguration>>(buildDataPanel)
  }
}

// Index.ets
@Entry
@Component
struct Index {
  @State dataPanelValues: number[] = [12.3, 21.1, 13.4, 35.2, 26.0, 32.0]
  dataPanelModifier: DataPanelModifier = new DataPanelModifier()

  build() {
    Scroll() {

      Column() {
        Text('信息展示类 ContentModifier').fontSize(32)

        // DataPanel ContentModifier
        Text('1. DataPanel').width('80%').fontSize(20).align(Alignment.Start).id('jjj')
        DataPanel({ values: this.dataPanelValues, max: 140, type: DataPanelType.Circle })
          .width('80%')
          .height('20%')
          .constraintSize({ maxWidth: '100%' })
          .contentModifier(this.dataPanelModifier)
          .id('DataPanelContentModifier_max')
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

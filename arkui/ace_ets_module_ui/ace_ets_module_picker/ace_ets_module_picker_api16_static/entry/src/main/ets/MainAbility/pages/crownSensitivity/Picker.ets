'use static';
/*
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
import {
  Entry, Component, Builder,NodeContainer,
  Column, ColumnOptions, ImageAnalyzerType, CrownSensitivity,
  Flex, FlexDirection, ItemAlign, FlexAlign, ImageAIOptions,  ImageAnalyzerController, ImageBitmap,  ImageAnalyzerConfig,
  Text, Button, FontWeight, ClickEvent, Margin, Color, Row, RenderingContextSettings, CanvasRenderingContext2D, Canvas,DatePicker,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct DatePickerExample {
  private selectedDate: Date = new Date('2021-08-08')

  build() {
    Column() {
      DatePicker({
        start: new Date('1970-1-1'),
        end: new Date('1980-1-1'),
      })
        .key('picker01')

        .digitalCrownSensitivity(CrownSensitivity.HIGH)  //取值不对，得到的是1,期望是2
        .focusable(true)
        .focusOnTouch(true)
        .disappearTextStyle({ color: Color.Green, font: { size: '16fp', weight: FontWeight.Bold } })
        .textStyle({ color: Color.Pink, font: { size: '18fp', weight: FontWeight.Normal } })
        .selectedTextStyle({ color: Color.Orange, font: { size: '26fp', weight: FontWeight.Regular } })
        .lunar(false)
        .defaultFocus(true)
        .onDateChange((value: Date) => {
          this.selectedDate = value
          console.info('select current date is: ' + value.toString())
        })

      DatePicker({
        start: new Date('1980-1-1'),
        end: new Date('2000-1-1'),
      })
        .digitalCrownSensitivity(CrownSensitivity.LOW)
        .key('picker02')
        .focusable(false)
        .focusOnTouch(false)

      DatePicker({
        start: new Date('2100-1-1'),
        end: new Date('2200-1-1'),
      })
        .digitalCrownSensitivity(CrownSensitivity.MEDIUM)
        .key('picker03')
        .defaultFocus(false)

      DatePicker({
        start: new Date('2100-1-1'),
        end: new Date('2200-1-1'),
      })
        .key('picker04')

      DatePicker({
        start: new Date('2100-1-1'),
        end: new Date('2200-1-1'),
      })
        .key('picker05')
        .digitalCrownSensitivity(CrownSensitivity.MEDIUM)

      DatePicker({
        start: new Date('2100-1-1'),
        end: new Date('2200-1-1'),
      })
        .key('picker06')
        .digitalCrownSensitivity(CrownSensitivity.MEDIUM)

      DatePicker({
        start: new Date('2100-1-1'),
        end: new Date('2200-1-1'),
      })
        .key('picker07')
        .digitalCrownSensitivity(undefined)
    }
  }
}
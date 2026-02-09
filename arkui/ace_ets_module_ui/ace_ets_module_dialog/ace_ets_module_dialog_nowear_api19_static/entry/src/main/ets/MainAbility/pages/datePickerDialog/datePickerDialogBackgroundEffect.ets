'use static';
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
  Row, ClickEvent, Margin, ButtonType, ColumnOptions, SizeOptions, $r, BackgroundBlurStyleOptions, BlurStyleActivePolicy,
  AdaptiveColor,ThemeColorMode, Color, BackgroundEffectOptions} from '@ohos.arkui.component'
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct datePickerDialog2 {
  private selectedDate: Date = new Date('2025-04-23')
  build() {
    Column({ space: 10 } as ColumnOptions){
      Button('DatePickerDialog_Effect001')
        .id('DatePickerDialog_Effect001')
        .onClick((e:ClickEvent) => {
          this.getUIContext().showDatePickerDialog({
            start: new Date('2000-1-1'),
            end: new Date('2100-12-31'),
            selected: this.selectedDate,
            // showTime: true,
            useMilitaryTime: false,
            dateTimeOptions: { hour: 'numeric', minute: '2-digit' },
            backgroundEffect: {
              radius: 40.0,
              saturation: 25,
              brightness: 2,
              color: Color.Pink,
              adaptiveColor: AdaptiveColor.DEFAULT,
              policy:BlurStyleActivePolicy.ALWAYS_ACTIVE,
              inactiveColor:Color.Blue,
              blurOptions: {
                grayscale: [20,20]
              }
            } as BackgroundEffectOptions
          })
        })
      Button('DatePickerDialog_Effect002')
        .id('DatePickerDialog_Effect002')
        .onClick((e:ClickEvent) => {
          this.getUIContext().showDatePickerDialog({
            start: new Date('2000-1-1'),
            end: new Date('2100-12-31'),
            selected: this.selectedDate,
            showTime: true,
            useMilitaryTime: false,
            dateTimeOptions: { hour: 'numeric', minute: '2-digit' },
            // backgroundEffect: {
            //   radius: undefined,
            //   saturation: undefined,
            //   brightness: undefined,
            //   color: undefined,
            //   adaptiveColor: undefined,
            //   policy:undefined,
            //   inactiveColor:undefined,
            //   blurOptions: undefined,
            // } as BackgroundEffectOptions
          })
        })
      Button('DatePickerDialog_Effect003')
        .id('DatePickerDialog_Effect003')
        .onClick((e:ClickEvent) => {
          this.getUIContext().showDatePickerDialog({
            start: new Date('2000-1-1'),
            end: new Date('2100-12-31'),
            selected: this.selectedDate,
            showTime: true,
            useMilitaryTime: false,
            dateTimeOptions: { hour: 'numeric', minute: '2-digit' },
            // backgroundEffect: {
            //   radius: null,
            //   saturation: null,
            //   brightness: null,
            //   color: null,
            //   adaptiveColor: null,
            //   policy:null,
            //   inactiveColor:null,
            //   blurOptions: null,
            // } as BackgroundEffectOptions
          })
        })
    }
    .height('100%')
    .width('100%')
    .backgroundImage($r('app.media.icon'))
    .backgroundImageSize({ width: '100%', height: '100%' } as SizeOptions)
  }
}
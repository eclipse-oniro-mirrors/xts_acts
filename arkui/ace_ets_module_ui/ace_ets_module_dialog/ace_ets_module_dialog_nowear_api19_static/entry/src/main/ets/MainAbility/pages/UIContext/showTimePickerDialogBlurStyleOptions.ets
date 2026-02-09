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
  AdaptiveColor,ThemeColorMode, Color, TimePickerResult, TimePickerFormat} from '@ohos.arkui.component'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct ShowTimePickerDialog1 {
  private selectTime: Date = new Date('2020-12-25T08:30:00')
  build() {
    Column({ space: 10 } as ColumnOptions){
      Button('ShowTimePickerDialog_Options001')
        .id('ShowTimePickerDialog_Options001')
        .onClick((e:ClickEvent) => {
          let uiContext: UIContext = this.getUIContext();
          uiContext.showTimePickerDialog({
            selected: this.selectTime,
            format: TimePickerFormat.HOUR_MINUTE,
            useMilitaryTime:  true,
            dateTimeOptions: { hour: 'numeric', minute: '2-digit' },
            onAccept: (value: TimePickerResult) => {
              // 设置selectTime为按下确定按钮时的时间，这样当弹窗再次弹出时显示选中的为上一次确定的时间
              if (value.hour != undefined && value.minute != undefined) {
                this.selectTime.setHours(value.hour, value.minute)
                console.info('TimePickerDialog:onAccept()' + JSON.stringify(value))
              }
            },
            backgroundBlurStyleOptions: {
              policy:BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE,
              adaptiveColor:AdaptiveColor.AVERAGE,
              scale:0,
              colorMode:ThemeColorMode.LIGHT,
              inactiveColor:Color.Pink,
              blurOptions:{
                grayscale:[20,100]
              }
            } as BackgroundBlurStyleOptions
          })
        })
      Button('ShowTimePickerDialog_Options002')
        .id('ShowTimePickerDialog_Options002')
        .onClick((e:ClickEvent) => {
          let uiContext: UIContext = this.getUIContext();
          uiContext.showTimePickerDialog({
            selected: this.selectTime,
            format: TimePickerFormat.HOUR_MINUTE,
            useMilitaryTime:  true,
            dateTimeOptions: { hour: 'numeric', minute: '2-digit' },
            onAccept: (value: TimePickerResult) => {
              // 设置selectTime为按下确定按钮时的时间，这样当弹窗再次弹出时显示选中的为上一次确定的时间
              if (value.hour != undefined && value.minute != undefined) {
                this.selectTime.setHours(value.hour, value.minute)
                console.info('TimePickerDialog:onAccept()' + JSON.stringify(value))
              }
            },
            backgroundBlurStyleOptions: {
              policy:undefined,
              adaptiveColor:undefined,
              scale:undefined,
              colorMode:undefined,
              inactiveColor:undefined,
              blurOptions:undefined,
            } as BackgroundBlurStyleOptions
          })
        })
      Button('ShowTimePickerDialog_Options003')
        .id('ShowTimePickerDialog_Options003')
        .onClick((e:ClickEvent) => {
          let uiContext: UIContext = this.getUIContext();
          uiContext.showTimePickerDialog({
            selected: this.selectTime,
            format: TimePickerFormat.HOUR_MINUTE,
            useMilitaryTime:  true,
            dateTimeOptions: { hour: 'numeric', minute: '2-digit' },
            onAccept: (value: TimePickerResult) => {
              // 设置selectTime为按下确定按钮时的时间，这样当弹窗再次弹出时显示选中的为上一次确定的时间
              if (value.hour != undefined && value.minute != undefined) {
                this.selectTime.setHours(value.hour, value.minute)
                console.info('TimePickerDialog:onAccept()' + JSON.stringify(value))
              }
            },
            // backgroundBlurStyleOptions: {
            //   policy:null,
            //   adaptiveColor:null,
            //   scale:null,
            //   colorMode:null,
            //   inactiveColor:null,
            //   blurOptions:null,
            // } as BackgroundBlurStyleOptions
          })
        })
    }
    .height('100%')
    .width('100%')
    .backgroundImage($r('app.media.icon'))
    .backgroundImageSize({ width: '100%', height: '100%' } as SizeOptions)
  }
}
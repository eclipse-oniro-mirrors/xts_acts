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
  AdaptiveColor,ThemeColorMode, Color} from '@ohos.arkui.component'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct ShowDatePickerDialog1 {
  private selectedDate: Date = new Date('2025-04-23')
  build() {
    Column({ space: 10 } as ColumnOptions){
      Button('ShowDatePickerDialog_Options001')
        .id('ShowDatePickerDialog_Options001')
        .onClick((e:ClickEvent) => {
          let uiContext: UIContext = this.getUIContext();
          uiContext.showDatePickerDialog({
            start: new Date('2000-1-1'),
            end: new Date('2100-12-31'),
            selected: this.selectedDate,
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
      Button('ShowDatePickerDialog_Options002')
        .id('ShowDatePickerDialog_Options002')
        .onClick((e:ClickEvent) => {
          let uiContext: UIContext = this.getUIContext();
          uiContext.showDatePickerDialog({
            start: new Date('2000-1-1'),
            end: new Date('2100-12-31'),
            selected: this.selectedDate,
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
      Button('ShowDatePickerDialog_Options003')
        .id('ShowDatePickerDialog_Options003')
        .onClick((e:ClickEvent) => {
          let uiContext: UIContext = this.getUIContext();
          uiContext.showDatePickerDialog({
            start: new Date('2000-1-1'),
            end: new Date('2100-12-31'),
            selected: this.selectedDate,
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
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
@Entry
@Component
struct calendarPickerDialog1 {
  private selectedDate: Date = new Date('2024-04-23')
  build() {
    Column({ space: 10 }){
      Button('CalendarPickerDialog_Options001')
        .id('CalendarPickerDialog_Options001')
        .onClick(() => {
          CalendarPickerDialog.show({
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
            }
          })
        })
      Button('CalendarPickerDialog_Options002')
        .id('CalendarPickerDialog_Options002')
        .onClick(() => {
          CalendarPickerDialog.show({
            selected: this.selectedDate,
            backgroundBlurStyleOptions: {
              policy:undefined,
              adaptiveColor:undefined,
              scale:undefined,
              colorMode:undefined,
              inactiveColor:undefined,
              blurOptions:undefined,
            }
          })
        })
      Button('CalendarPickerDialog_Options003')
        .id('CalendarPickerDialog_Options003')
        .onClick(() => {
          CalendarPickerDialog.show({
            selected: this.selectedDate,
            backgroundBlurStyleOptions: {
              policy:null,
              adaptiveColor:null,
              scale:null,
              colorMode:null,
              inactiveColor:null,
              blurOptions:null,
            }
          })
        })
    }
    .height('100%')
    .width('100%')
    .backgroundImage($r('app.media.icon'))
    .backgroundImageSize({ width: '100%', height: '100%' })
  }
}
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
struct CalendarPickerDialogBackgroundEffectPage {
  private selectedDate: Date = new Date('2024-04-23')

  build() {
    Column({ space: 10 }) {
      Button('CalendarPickerDialog_Effect001')
        .id('CalendarPickerDialog_Effect001')
        .onClick(() => {
          CalendarPickerDialog.show({
            selected: this.selectedDate,
            backgroundEffect: {
              radius: 40,
              saturation: 25,
              brightness: 2,
              color: Color.Pink,
              adaptiveColor: AdaptiveColor.DEFAULT,
              policy: BlurStyleActivePolicy.ALWAYS_ACTIVE,
              inactiveColor: Color.Blue,
              blurOptions: {
                grayscale: [20, 20]
              }
            }
          })
        })
      Button('CalendarPickerDialog_Effect002')
        .id('CalendarPickerDialog_Effect002')
        .onClick(() => {
          CalendarPickerDialog.show({
            selected: this.selectedDate,
            backgroundEffect: {
              radius: undefined,
              saturation: undefined,
              brightness: undefined,
              color: undefined,
              adaptiveColor: undefined,
              policy: undefined,
              inactiveColor: undefined,
              blurOptions: undefined,
            }
          })
        })
      Button('CalendarPickerDialog_Effect003')
        .id('CalendarPickerDialog_Effect003')
        .onClick(() => {
          CalendarPickerDialog.show({
            selected: this.selectedDate,
            backgroundEffect: {
              radius: null,
              saturation: null,
              brightness: null,
              color: null,
              adaptiveColor: null,
              policy: null,
              inactiveColor: null,
              blurOptions: null,
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
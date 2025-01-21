/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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
import { redCustomTheme } from '../../themes/CustomTheme';
import { CustomTheme } from '@ohos.arkui.theme';

export const datePickerThemeProperty: string = `datePickerThemeProperty`;
export const datePickerIsLunarProperty: string = `datePickerIsLunarProperty`;
export class DatePickerKeys {
  public static readonly datePickerSystem = `DatePicker_System`;
  public static readonly datePickerWithTheme = `DatePicker_WithTheme`;
}

@Entry
@Component
struct DatePickerPage {
  count = 0;
  @StorageProp(datePickerThemeProperty) localTheme: CustomTheme | undefined = redCustomTheme;
  @StorageLink(datePickerIsLunarProperty) isLunar: boolean = true;
  @State selectedSystem: Date = new Date();
  selectedCustom: Date = new Date();

  build() {
    Column() {
      Text('System Theme')
        .fontColor(Color.Blue)
        .margin({
          top: '5%',
          bottom: '10%'
        })
      DatePicker({
        selected: this.selectedSystem
      })
        .key(DatePickerKeys.datePickerSystem)
        .margin({
          right: '5%'
        })
        .lunar(this.isLunar)
        .onDateChange(value => {
          this.selectedSystem = value
        })
      Divider()
        .height('4vp')
        .width('100%')
        .color(Color.Black)
        .margin({
          top: '5%',
          bottom: '5%'
        })
      Text('Custom Theme')
        .fontColor(this.localTheme?.colors?.fontEmphasize ?? Color.Black)
        .margin({
          top: '5%',
          bottom: '10%'
        })
      WithTheme({ theme: this.localTheme }) {
        DatePicker({
          selected: this.selectedCustom
        })
          .key(DatePickerKeys.datePickerWithTheme)
          .margin({
            right: '5%'
          })
          .lunar(this.isLunar)
          .onDateChange(value => {
            this.selectedCustom = value
          })
      }
      Button('Lunar<==>Gregorian')
        .margin({ top: 30, bottom: 30 })
        .onClick(() => {
          this.isLunar = !this.isLunar
        })
        .margin(30)
    }
    .width('100%')
    .height('100%')
    .padding('4%')
  }
}
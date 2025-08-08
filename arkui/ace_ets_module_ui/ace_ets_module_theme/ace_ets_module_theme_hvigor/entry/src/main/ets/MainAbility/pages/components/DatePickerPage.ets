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
import { brownCustomTheme, redCustomTheme } from '../../themes/CustomTheme';
import { CustomTheme } from '@ohos.arkui.theme';

export const datePickerThemeProperty: string = `datePickerThemeProperty`;
export const datePickerThemeSetProperty: string = `datePickerThemeSetProperty`
export const datePickerIsLunarProperty: string = `datePickerIsLunarProperty`;
export class DatePickerKeys {
  public static readonly datePickerSystem = `DatePicker_System`;
  public static readonly datePickerSystemCustomAttrs = `DatePicker_System_CustomAttrs`
  public static readonly datePickerWithTheme = `DatePicker_WithTheme`;
  public static readonly datePickerWithThemeCustomAttrs = `DatePicker_WithTheme_CustomAttrs`
}

@Entry
@Component
struct DatePickerPage {
  count = 0;
  @StorageProp(datePickerThemeProperty) localTheme: CustomTheme | undefined = redCustomTheme;
  @StorageLink(datePickerThemeSetProperty) themeSet: boolean | undefined = true
  @StorageLink(datePickerIsLunarProperty) isLunar: boolean = true;
  @State selectedSystem: Date = new Date();
  selectedCustom: Date = new Date();

  build() {
    Scroll() {
      Column({ space: '20vp' }) {
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
        DatePicker({
          selected: this.selectedSystem
        })
          .selectedTextStyle({ color: brownCustomTheme.colors?.fontEmphasize })
          .textStyle({ color: brownCustomTheme.colors?.fontPrimary })
          .disappearTextStyle({ color: brownCustomTheme.colors?.fontPrimary })
          .key(DatePickerKeys.datePickerSystemCustomAttrs)
          .margin({
            right: '5%'
          })
          .lunar(this.isLunar)
          .onDateChange(value => {
            this.selectedSystem = value
          })
        WithTheme({ theme: this.themeSet ? this.localTheme : undefined }) {
          Column({ space: '20vp' }) {
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
            DatePicker({
              selected: this.selectedCustom
            })
              .selectedTextStyle({ color: brownCustomTheme.colors?.fontEmphasize })
              .textStyle({ color: brownCustomTheme.colors?.fontPrimary })
              .disappearTextStyle({ color: brownCustomTheme.colors?.fontPrimary })
              .key(DatePickerKeys.datePickerWithThemeCustomAttrs)
              .margin({
                right: '5%'
              })
              .lunar(this.isLunar)
              .onDateChange(value => {
                this.selectedCustom = value
              })
          }
        }
      }
    }
  }
}